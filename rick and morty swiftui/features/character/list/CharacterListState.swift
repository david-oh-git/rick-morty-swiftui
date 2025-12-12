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
    var isNextPageLoading: Bool = false
    var currentPage: Int = 0
    var prev: String? = nil
    var next: String? = nil
    var characters: [Character] = []
    var errorMessage: String? = nil
    var isEmpty: Bool {
        characters.isEmpty
    }
}

