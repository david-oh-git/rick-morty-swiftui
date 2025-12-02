//
//  CharacterViewState.swift
//  rick and morty swiftui
//
//  Created by shinji on 7/30/24.
//

import Foundation

@Observable
class CharacterState {
    
    var isLoading: Bool = true
    var character: Character? = nil
    var errorMessage: String? = nil

}
