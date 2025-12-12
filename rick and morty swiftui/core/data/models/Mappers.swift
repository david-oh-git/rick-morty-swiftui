//
//  Mappers.swift
//  rick and morty swiftui
//
//  Created by shinji on 12/1/25.
//


import Foundation

extension NetworkCharacterResponse {
    
    
    func extractNetworkCharacter() -> NetworkCharacter {
        return NetworkCharacter(
            id: id!,
            name: name ?? "",
            species: species ?? "",
            type: type ?? "",
            gender: gender ?? "",
            url: url ?? "",
            image: image ?? "",
            status: status ?? ""
        )
    }
    
    func extractCharacter() -> Character {
        return Character(
            id: id!,
            name: name ?? "",
            species: species ?? "",
            type: type ?? "",
            gender: gender ?? "",
            url: url ?? "",
            image: image ?? "",
            status: status ?? ""
        )
    }
    
    
}

extension Array<NetworkCharacter> {
   
   func extractCharacters() -> [Character] {
       return self.map{
           Character(
               id: $0.id,
               name: $0.name,
               species: $0.species,
               type: $0.type,
               gender: $0.gender,
               url: $0.url,
               image: $0.image,
               status: $0.status
           )
       }
   }
}
