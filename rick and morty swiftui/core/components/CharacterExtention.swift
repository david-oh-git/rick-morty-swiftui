//
//  CharacterExtention.swift
//  rick and morty swiftui
//
//  Created by shinji on 11/11/25.
//

import SwiftUI

extension Character {
    
    var statusColour: Color {
        switch self.status {
        case "Alive":
            return .green
        case "Dead":
            return .red
        default:
            return .gray
        }
    }
}
