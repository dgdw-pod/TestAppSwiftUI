//
//  NotLoggedInView.swift
//  TestAppSwiftUI
//
//  Created by David Drysdale-Wilson on 28/07/2022.
//

import SwiftUI

class LoginViewModel : ObservableObject {
    private let authHandler: AuthHandler
    private let onProgress: () -> Void
    private let onLoggedIn: (String) -> Void
    private let onLoggedOut: () -> Void
    
    init(authHandler: AuthHandler, onProgress: @escaping () -> Void, onLoggedIn: @escaping (String) -> Void, onLoggedOut: @escaping () -> Void) {
        self.authHandler = authHandler
        self.onProgress = onProgress
        self.onLoggedIn = onLoggedIn
        self.onLoggedOut = onLoggedOut
    }
    
    func login() {
        self.onProgress();

        DispatchQueue.main.startCoroutine {
            
            do {
                let name = try self.authHandler.login(viewController: self.getViewController()).await()
                self.onLoggedIn(name!)
            } catch {
                self.onLoggedOut()
            }
            
        }
    }
    
    private func getViewController() -> UIViewController {
        return UIApplication.shared.windows.first!.rootViewController!
    }
}
