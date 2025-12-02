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
            status: status ?? "",
            characterType: characterType ?? ""
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
            status: status ?? "",
            characterType: characterType ?? ""
        )
    }
    
    
}