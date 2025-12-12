//
//  CharacterListViewModel.swift
//  rick and morty swiftui
//
//  Created by shinji on 9/19/24.
//

import Foundation

final class CharacterListViewModel : ObservableObject {
    
    let networkService: NetworkService
    
    @Published
    var state: CharacterListState
    
    init(
        networkService: NetworkService = NetworkServiceImpl.shared,
        state: CharacterListState = CharacterListState()
    ) {
        self.networkService = networkService
        self.state = state
        initFetchCharacters()
    }
    
    func fetchCharacters(page: Int) {
        print("Fetching characters")
        Task {
            let response = await networkService.fetchCharacters(page: page)
            
            await MainActor.run {
                
                if(!response.hasError && response.data != nil ) {
                    let characters = response.data?.results ?? []
                    onCharacterSuccess(
                        characters: characters.extractCharacters()
                    )
                } else if let errorMsg = response.data?.error {
                    print("ERROR MSG: \(errorMsg)")
                    onError(msg: errorMsg)
                } else if response.hasError {
                    onError(msg: response.error?.localizedDescription ?? "Unknow Error")
                } else {
                    onError(msg: "Unknow Error")
                }
            }
            
        }
    }
    
    func initFetchCharacters() {
        onLoading()
        fetchCharacters(page: 0)
    }
    
    func fetchNextPage() {
        state.isNextPageLoading = true
        fetchCharacters(page: state.currentPage + 1)
    }
    
    func fetchPreviousPage() {
        if state.currentPage <= 0 { return }
        fetchCharacters(page: state.currentPage - 1)
    }
    
    func onLoading() {
        state.isLoading = true
        state.errorMessage = nil
    }
    
    func onNotLoading() {
        state.isLoading = false
    }
    
    func onCharacterSuccess(characters: [Character]) {
        // append for now
        state.characters.append(contentsOf: characters)
        state.errorMessage = nil
        onNotLoading()
        print("Characters loaded: size \(state.characters.count)")
    }
    
    func onCurrentPageChange(page: Int) {
        state.currentPage = page
    }
    
    func onError(msg: String) {
        state.errorMessage = msg
        onNotLoading()
    }
}
