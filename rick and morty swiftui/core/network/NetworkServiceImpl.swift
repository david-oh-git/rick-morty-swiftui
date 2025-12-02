//
//  NetworkServiceImpl.swift
//  rick and morty swiftui
//
//  Created by shinji on 7/21/24.
//

import Foundation

struct NetworkServiceImpl : NetworkService {

    static let shared = NetworkServiceImpl()
    
    func fetchCharacters(url: String) async -> NetworkResponse<NetworkCharactersResponse> {
        return await safeCall(
            urlString: url,
            type: NetworkCharactersResponse.self
        )
    }
    
    func fetchCharacters(page: Int) async -> NetworkResponse<NetworkCharactersResponse> {
        return await safeCall(
            urlString: "https://rickandmortyapi.com/api/character/?page=\(page)",
            type: NetworkCharactersResponse.self
        )
    }
    
    func fetchCharacter(id: Int) async -> NetworkResponse<NetworkCharacterResponse> {
        return await safeCall(
            urlString: "https://rickandmortyapi.com/api/character/\(id)",
            type: NetworkCharacterResponse.self
        )
    }
    
}
