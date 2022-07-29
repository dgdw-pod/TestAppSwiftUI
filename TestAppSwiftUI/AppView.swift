//
//  ContentView.swift
//  TestAppSwiftUI
//
//  Created by David Drysdale-Wilson on 28/07/2022.
//

import SwiftUI

struct AppView: View {
    @ObservedObject private var viewModel: AppViewModel
    
    init(viewModel: AppViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        if(self.viewModel.isBusy) {
            ProgressView()
        } else if(self.viewModel.isLoggedIn) {
            ProfileView(viewModel: viewModel.getProfileViewModel())
        } else {
            LoginView(viewModel: viewModel.getLoginViewModel())
        }
        
    }
}

struct AppView_Previews: PreviewProvider {

    static var previews: some View {
        AppView(viewModel: AppViewModel(authHandler: AuthHandler()))
    }
}
