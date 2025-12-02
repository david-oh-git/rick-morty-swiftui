//
//  ImageExtentions.swift
//  rick and morty swiftui
//
//  Created by shinji on 8/3/24.
//

import SwiftUI

extension Image {
    
    func imageModifier() -> some View{
        self
        .resizable()
        .scaledToFit()
    }
    
    func iconModifier() -> some View {
        self
        .imageModifier()
        .frame(maxWidth: 128)
        .foregroundColor(.red)
        .opacity(0.5)
    }
}
