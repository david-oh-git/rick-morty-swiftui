//
//  CharcaterView.swift
//  rick and morty swiftui
//
//  Created by shinji on 7/30/24.
//

import SwiftUI

struct CharacterDetailScreen: View {
    
    let id: Int
    @ObservedObject
    var viewModel: CharacterDetailViewModel
    
    init(
        _ id: Int,
        viewModel: CharacterDetailViewModel = CharacterDetailViewModel()
    ) {
        self.viewModel = viewModel
        self.id = id
        viewModel.fetchCharacter(id: id)
    }

    var body: some View {
        // Loading screen
        if viewModel.state.isLoading {
            LoadingScreen()
        }
        if let errorMsg = viewModel.state.errorMessage {
            Text(errorMsg)
            Button {
                viewModel.fetchCharacter(id: id)
            } label: {
                Text("Retry")
            }
        }
        if let character = viewModel.state.character {
            CharacterView(character: character)
        }
    }
}


struct CharacterView: View {
    
    let character: Character
    
    
    var body: some View {
        VStack {
            
            ZStack(alignment: .bottom) {
                let _ = print("Img URL : \(character.image)")
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
                
                Text(character.name)
                    .font(.title2)
                    .padding()
                    .offset(y: 15)
            }
            
            Divider()
            
            DetailsCard(character: character)
        } // END vstack
    }
}

struct DetailsCard: View {
    
    let character: Character
    
    var body: some View {
        
        VStack{
            
        }.padding()
            .background {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.tint)
                    .opacity(0.10)
                    .brightness(-0.1)
            }
            .foregroundStyle(.white)
    }
}

#Preview {
    CharacterDetailScreen(1)
}
