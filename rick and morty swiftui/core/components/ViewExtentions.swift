//
//  ViewExtentions.swift
//  rick and morty swiftui
//
//  Created by shinji on 11/11/25.
//

import SwiftUI

extension View {
    
    func clipCorners(
        cornerRadius: CGFloat = 6
    ) -> some View {
        return self.clipShape(.rect(cornerRadius: cornerRadius))
    }
}
