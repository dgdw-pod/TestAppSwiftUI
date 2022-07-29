//
//  ContentView.swift
//  TestAppSwiftUI
//
//  Created by David Drysdale-Wilson on 28/07/2022.
//

import SwiftUI

struct AppView: View {
    private let headerColour = Color(red: 33 / 255, green: 150 / 255, blue: 243 / 255)
    
    @ObservedObject private var viewModel: AppViewModel
    
    init(viewModel: AppViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            if(self.viewModel.isBusy) {
                ProgressView()
            } else if(self.viewModel.isLoggedIn) {
                ProfileView(viewModel: viewModel.getProfileViewModel())
            } else {
                LoginView(viewModel: viewModel.getLoginViewModel())
            }
            
            VStack {
                ZStack {
                    self.headerColour.frame(height: 100)
                        .edgesIgnoringSafeArea(.all)
                    Text("OAuth SwiftUI Demo")
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .offset(y: -25)
                }
                Spacer()
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {

    static var previews: some View {
        AppView(viewModel: AppViewModel(authHandler: AuthHandler()))
    }
}
