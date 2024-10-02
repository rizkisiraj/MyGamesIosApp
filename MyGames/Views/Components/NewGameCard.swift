//
//  NewGameCard.swift
//  MyGames
//
//  Created by Rizki Siraj on 16/06/24.
//

import SwiftUI

struct NewGameCard: View {
    var game: Game
    var gameImageURL: URL {
        URL(string: game.background_image ?? "")!
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            AsyncImage(url: gameImageURL) { image in
                image
                    .resizable()
            } placeholder: {
                Color.gray
            }
            .scaledToFill()
            .frame(height: 124)
            .frame(minWidth: 0, maxWidth: .infinity)
            .overlay {
                Color(.black).opacity(0.6)
            }
            .clipped()
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            HStack(alignment: .center) {
                AsyncImage(url: gameImageURL) { phase in
                    switch(phase) {
                    case .empty:
                        LoadingNewView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipped()
                            .clipShape(
                                RoundedRectangle(cornerRadius: 10)
                            )
                            .padding(.trailing, 8)
                    case .failure( _):
                        BrokenNewView()
                    @unknown default:
                        EmptyView()
                    }
                }

                VStack(alignment: .leading ,spacing: 4) {
                    Text(game.name)
                        .fontWeight(.bold)
                        .lineLimit(2)
                        .foregroundStyle(.white)
                    
                    HStack(alignment: .center, spacing: 2) {
                        Group {
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                            Text(String(format: "%.1f", game.rating))
                        }
                        .font(.system(size: 14))
                        .foregroundStyle(.white)
                        
                    }
                }
                Spacer(minLength: 24)
                Text(game.genres?[0].name ?? "Unknown")
                    .font(.system(size: 14))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(.red.opacity(0.7))
                    .foregroundStyle(.white)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 8)
                    )
                    
                
            }
            .padding(.horizontal)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
}

#Preview {
    NewGameCard(game: Game.gamePreview)
}

@ViewBuilder
func LoadingNewView() -> some View {
    ZStack {
        Image(systemName: "photo.on.rectangle.angled")
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
    }
    .frame(width: 100, height: 100)
    .background(.gray)
    .clipShape(RoundedRectangle(cornerRadius: 10))
    .padding(.trailing, 8)
}

@ViewBuilder
func BrokenNewView() -> some View {
    ZStack {
        Image(systemName: "circle.filled.pattern.diagonalline.rectangle")
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
    }
    .frame(width: 100, height: 100)
    .background(.gray)
    .clipShape(RoundedRectangle(cornerRadius: 10))
    .padding(.trailing, 8)
}
