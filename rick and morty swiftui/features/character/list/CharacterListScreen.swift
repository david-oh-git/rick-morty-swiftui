//
//  CharacterListScreen.swift
//  rick and morty swiftui
//
//  Created by shinji on 11/7/25.
//

import SwiftUI

struct CharacterListScreen: View {
    
    @ObservedObject
    var viewModel: CharacterListViewModel
    
    init(
        viewModel: CharacterListViewModel = CharacterListViewModel()
    ) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        // Loading screen
        if viewModel.state.isLoading {
            LoadingScreen()
        } else if viewModel.state.isEmpty {
            EmptyScreen(
                message: "Empty screen",
                refreshAction: { viewModel.initFetchCharacters() }
            )
        } else {
            ListContent(state: viewModel.state)
        }
        
    }
}

struct ListContent: View {
    let state: CharacterListState
    
    var body: some View {
        List(state.characters) { character in
        
            NavigationLink {
                CharacterDetailScreen(character.id)
            } label: {
                CharacterListItem(character: character)
            }
        }
    }
}

#Preview {
    CharacterListScreen()
}
