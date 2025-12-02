//
//  CharactersNetworkResponse.swift
//  rick and morty swiftui
//
//  Created by shinji on 7/20/24.
//

import Foundation

struct NetworkCharactersResponse: Codable {
    
    let info: Info?
    let results: [Character]?
    let error: String?
    
    
    init(error: Error) {
        info = nil
        results = nil
        self.error = error.localizedDescription
    }
}
