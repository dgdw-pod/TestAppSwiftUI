//
//  LoggedInView.swift
//  TestAppSwiftUI
//
//  Created by David Drysdale-Wilson on 28/07/2022.
//

import SwiftUI

struct ProfileView: View {
    private let buttonColour = Color(red: 33 / 255, green: 150 / 255, blue: 243 / 255)
    
    @ObservedObject private var viewModel: ProfileViewModel
    
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Text("Name: " + self.viewModel.getName())
                .padding()
            Button("Logout") {
                self.viewModel.logout()
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 10)
            .background(self.buttonColour)
            .foregroundColor(Color.white)
            .cornerRadius(10)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {

    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel(onLoggedOut: {}))
    }
}
