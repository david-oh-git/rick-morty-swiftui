//
//  NetworkCharacterResponse.swift
//  rick and morty swiftui
//
//  Created by shinji on 7/21/24.
//

import Foundation

struct NetworkCharacterResponse: Codable {
    
    let id: Int?
    let name: String?
    let species: String?
    let type: String?
    let gender: String?
    let url: String?
    let image: String?
    let status: String?
    let characterType: String?
    
    let error: String?
    
    init(error: Error) {
        id = nil
        name = nil
        species = nil
        type = nil
        gender = nil
        url = nil
        image = nil
        status = nil
        characterType = nil
        self.error = error.localizedDescription
    }

}





