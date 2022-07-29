//
//  TestAppSwiftUIApp.swift
//  TestAppSwiftUI
//
//  Created by David Drysdale-Wilson on 28/07/2022.
//

import SwiftUI

@main
struct TestAppSwiftUIApp: App {
    private let authHandler: AuthHandler
    private let viewModel: AppViewModel
    
    init() {
        self.authHandler = AuthHandler()
        self.viewModel = AppViewModel(authHandler: self.authHandler)
    }
    
    var body: some Scene {
        WindowGroup {
            AppView(viewModel: self.viewModel)
        }
    }
}
