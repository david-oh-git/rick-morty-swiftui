//
//  EmptyScreen.swift
//  rick and morty swiftui
//
//  Created by shinji on 12/1/25.
//

import SwiftUI

struct EmptyScreen: View {
    
    let message: String
    let refreshAction: () -> Void
    
    var body: some View {
        VStack {
            Text(message)
                .font(.headline)
                .foregroundColor(.primary)
                .padding()
            
            Button(
                "Refresh",
                action: { refreshAction() }
            )
        }
    
    }
}

#Preview {
    EmptyScreen(
        message: "This is my story",
        refreshAction: { print("Refreshing...") }
    )
}
