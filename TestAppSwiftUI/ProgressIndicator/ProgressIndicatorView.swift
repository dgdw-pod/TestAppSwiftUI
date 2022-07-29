//
//  ProgressIndicatorView.swift
//  TestAppSwiftUI
//
//  Created by David Drysdale-Wilson on 28/07/2022.
//

import SwiftUI

struct ProgressIndicatorView: View {
    private let progressTint = Color(red: 33 / 255, green: 150 / 255, blue: 243 / 255)
    
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: self.progressTint))
            .scaleEffect(2, anchor: .center)
    }
}

struct ProgressIndicatorView_Previews: PreviewProvider {

    static var previews: some View {
        ProgressIndicatorView()
    }
}
