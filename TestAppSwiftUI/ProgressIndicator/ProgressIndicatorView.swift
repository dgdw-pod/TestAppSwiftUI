//
//  ProgressIndicatorView.swift
//  TestAppSwiftUI
//
//  Created by David Drysdale-Wilson on 28/07/2022.
//

import SwiftUI

struct ProgressIndicatorView: View {
    var body: some View {
        ProgressView()
            .scaleEffect(x: 2, y:2)
    }
}

struct ProgressIndicatorView_Previews: PreviewProvider {

    static var previews: some View {
        ProgressIndicatorView()
    }
}
