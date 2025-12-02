//
//  CharacterListViewState.swift
//  rick and morty swiftui
//
//  Created by shinji on 9/19/24.
//

import Foundation

@Observable
class CharacterListState {
    
    var isLoading: Bool = false
    var characters: [Character] = []
    var errorMessage: String? = nil
}

