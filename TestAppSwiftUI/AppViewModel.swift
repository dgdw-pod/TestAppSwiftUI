//
//  AppViewModel.swift
//  TestAppSwiftUI
//
//  Created by David Drysdale-Wilson on 28/07/2022.
//

import Foundation

class AppViewModel : ObservableObject {
    private let authHandler: AuthHandler
    private var loginViewModel: LoginViewModel?
    private var profileViewModel: ProfileViewModel?
    
    @Published var isBusy = false;
    @Published var isLoggedIn = false;
    
    init(authHandler: AuthHandler) {
        self.authHandler = authHandler
    }
    
    private func initLoginViewModel() -> LoginViewModel {
        if(self.loginViewModel == nil) {
            self.loginViewModel = LoginViewModel(authHandler: self.authHandler, onProgress: self.onProgress, onLoggedIn: self.onLoggedIn, onLoggedOut: self.onLoggedOut)
        }
        
        return self.loginViewModel!
    }
    
    func getLoginViewModel() -> LoginViewModel {
        return self.initLoginViewModel()
    }
    
    private func initProfileViewModel() -> ProfileViewModel {
        if(self.profileViewModel == nil) {
            self.profileViewModel = ProfileViewModel(onLoggedOut: self.onLoggedOut)
        }
        
        return self.profileViewModel!
    }
    
    func getProfileViewModel() -> ProfileViewModel {
        return self.initProfileViewModel()
    }
    
    func onProgress() {
        self.isBusy = true;
    }
    
    func onLoggedIn(name: String) {
        self.isBusy = false;
        self.isLoggedIn = true;
        self.getProfileViewModel().setName(name: name)
    }
    
    func onLoggedOut() {
        self.isBusy = false;
        self.isLoggedIn = false;
    }
}
