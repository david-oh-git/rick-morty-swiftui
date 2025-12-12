//
//  CharacterListItem.swift
//  rick and morty swiftui
//
//  Created by shinji on 11/11/25.
//

import SwiftUI

struct CharacterListItem: View {
    
    let character: Character
    
    var body: some View {
        HStack(alignment: .center) {
            AsyncImage(
                url: URL(string: character.image),
                transaction: Transaction(
                    animation: .spring(
                        response: 0.5,
                        dampingFraction: 0.6,
                        blendDuration: 0.25
                    )
                )
            ) { phase in
                switch phase {
                case .success(let image):
                    image.imageModifier()
                        .transition(.move(edge: .bottom))
                case .failure(_):
                    Image(systemName: "photo.circle.fill").iconModifier()
                case .empty:
                    Image(systemName: "photo.circle.fill")
                        .iconModifier()
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                @unknown default:
                    ProgressView()
                }
            }
            .clipShape(.rect(cornerRadius: 25))
            
            
            VStack(alignment: .leading) {
                Text(character.name)
                    .font(.headline)
                Text("\(character.species) - \(character.gender)")
                
                Text(character.status)
                    .font(.footnote)
                    .colorInvert()
                    .bold()
                    .textCase(.uppercase)
                    .padding(4)
                    .background(character.statusColour)
                    .clipCorners()
            }
            .frame(
                maxWidth: .infinity,
                alignment: .topLeading
            )
            .padding(4)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    CharacterListItem(
        character: Character(
            id: 2,
            name: "Harry Potter",
            species: "Human",
            type: "Unknown",
            gender: "Male",
            url: "",
            image: "https://rickandmortyapi.com/api/character/25",
            status: "Alive"
        )
    )
}
