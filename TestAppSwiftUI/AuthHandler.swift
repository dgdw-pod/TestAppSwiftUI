//
//  AppAuthHandler.swift
//  TestAppSwiftUI
//
//  Created by David Drysdale-Wilson on 28/07/2022.
//

import AppAuth
import SwiftCoroutine
import os.log

struct Data : Decodable {
    let name: String
}

struct UserInfo : Decodable {
    let data: Data
}

class AuthHandler {
    private let authorisationEndpoint = URL(string: "https://auth-staging.pod-point.com/oauth/authorize")
    private let tokenEndpoint = URL(string: "https://auth-staging.pod-point.com/api/v1/oauth/token")
    private let userInfoEndpoint = URL(string: "https://auth-staging.pod-point.com/api/v1/user")
    private let redirectUrl = URL(string: "com.podpoint.testapp://callback")
    private let identifier = "74"
    
    private var userAgentSession: OIDExternalUserAgentSession?
    
    func login(viewController: UIViewController) -> CoFuture<String?> {
        let promise = CoPromise<String?>()
        
        let configuration = OIDServiceConfiguration(authorizationEndpoint: authorisationEndpoint!,
                                                    tokenEndpoint: tokenEndpoint!)
        
        let authRequest = OIDAuthorizationRequest(configuration: configuration,
                                             clientId: identifier,
                                             scopes: [],
                                             redirectURL: redirectUrl!,
                                             responseType: OIDResponseTypeCode,
                                             additionalParameters: nil)
        
        let userAgent = OIDExternalUserAgentIOS(presenting: viewController)
        self.userAgentSession = OIDAuthorizationService.present(authRequest, externalUserAgent: userAgent!) { authResponse, ex in
            
            if(authResponse != nil) {
                let tokenRequest = authResponse!.tokenExchangeRequest()
                
                OIDAuthorizationService.perform(tokenRequest!, originalAuthorizationResponse: authResponse) { tokenResponse, ex in
                    
                    if(tokenResponse != nil) {
                        self.getUserInfo(token: tokenResponse!.accessToken!, promise: promise)
                    } else {
                        promise.fail(ex!)
                    }
                }
            } else {
                promise.fail(ex!)
            }
            
            self.userAgentSession = nil
        }
        
        return promise
    }
    
    func getUserInfo(token: String, promise: CoPromise<String?>) {
        var request = URLRequest(url: userInfoEndpoint!)
        request.allHTTPHeaderFields = ["Authorization": "Bearer \(token)"]
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if(data != nil) {
                let result = try? JSONDecoder().decode(UserInfo.self, from: data!)
                if(result != nil) {
                    promise.success(result!.data.name)
                } else {
                    promise.fail(error!)
                }
            }
        }
        
        task.resume()
    }
}
