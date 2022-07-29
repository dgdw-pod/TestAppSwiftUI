//
//  LoggedInViewModel.swift
//  TestAppSwiftUI
//
//  Created by David Drysdale-Wilson on 28/07/2022.
//

import Foundation

class ProfileViewModel : ObservableObject {
    private let onLoggedOut: () -> Void
    
    @Published var name: String
    
    init(onLoggedOut: @escaping () -> Void) {
        self.onLoggedOut = onLoggedOut
        self.name = ""
    }
    
    func setName(name: String) {
        self.name = name
    }
    
    func getName() -> String {
        return self.name
    }
    
    func logout() {
        self.onLoggedOut()
    }
}
