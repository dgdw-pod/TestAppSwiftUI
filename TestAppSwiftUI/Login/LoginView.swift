//
//  NotLoggedInViewModel.swift
//  TestAppSwiftUI
//
//  Created by David Drysdale-Wilson on 28/07/2022.
//

import SwiftUI

struct LoginView: View {
    private let buttonColour = Color(red: 33 / 255, green: 150 / 255, blue: 243 / 255)
    
    @ObservedObject private var viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Button("Login") {
            self.viewModel.login()
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 10)
        .background(self.buttonColour)
        .foregroundColor(Color.white)
        .cornerRadius(10)
    }
}

struct LoginView_Previews: PreviewProvider {

    static var previews: some View {
        LoginView(viewModel: LoginViewModel(authHandler: AuthHandler(), onProgress: {}, onLoggedIn: {(name: String) -> Void in return}, onLoggedOut: {}))
    }
}
