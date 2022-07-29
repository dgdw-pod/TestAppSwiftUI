//
//  LoggedInView.swift
//  TestAppSwiftUI
//
//  Created by David Drysdale-Wilson on 28/07/2022.
//

import SwiftUI

struct ProfileView: View {
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
            .background(Color.blue)
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
