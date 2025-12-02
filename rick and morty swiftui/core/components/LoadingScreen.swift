//
//  LoadingScreen.swift
//  rick and morty swiftui
//
//  Created by shinji on 8/3/24.
//

import SwiftUI


struct LoadingScreen: View {
    
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
            .scaleEffect(2.0, anchor: .center)
    }
    
}

#Preview {
    LoadingScreen()
}
