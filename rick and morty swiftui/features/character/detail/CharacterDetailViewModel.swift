//
//  CharacterDetailViewModel.swift
//  rick and morty swiftui
//
//  Created by david on 7/30/24.
//

import Foundation


final class CharacterDetailViewModel : ObservableObject {
    
    let networkService: NetworkService
    
    @Published
    var state: CharacterState
    
    init(
        networkService: NetworkService = NetworkServiceImpl.shared,
        state: CharacterState = CharacterState()
    ) {
        self.networkService = networkService
        self.state = state
    }
    
    func fetchCharacter(id: Int) {
        onLoading()
        Task {
            let response = await networkService.fetchCharacter(id: id)
            
            await MainActor.run {
            
                if let error = response.error {
                    onError(msg: error.localizedDescription)
                } else if let data = response.data {
                    onCharacterSuccess(character: data.extractCharacter())
                } else {
                    onError(msg: "Unknown error")
                }
                
            }
        }
    }
    
    func onLoading() {
        state.isLoading = true
        state.errorMessage = nil
    }
    
    func onNotLoading() {
        state.isLoading = false
    }
    
    func onCharacterSuccess(character: Character) {
        state.character = character
        state.errorMessage = nil
        onNotLoading()
    }
    
    func onError(msg: String) {
        state.errorMessage = msg
        onNotLoading()
    }
}
