//
//  NetworkService.swift
//  rick and morty swiftui
//
//  Created by shinji on 7/20/24.
//

import Foundation

protocol NetworkService {
    
    func fetchCharacters(url: String) async -> NetworkResponse<NetworkCharactersResponse>
    
    func fetchCharacters(page: Int) async -> NetworkResponse<NetworkCharactersResponse>
    
    func fetchCharacter(id: Int) async -> NetworkResponse<NetworkCharacterResponse>
}
