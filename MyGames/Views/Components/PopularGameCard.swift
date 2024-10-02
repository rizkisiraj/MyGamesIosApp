//
//  PopularGameCard.swift
//  MyGames
//
//  Created by Rizki Siraj on 16/06/24.
//

import SwiftUI

struct PopularGameCard: View {
    var game: Game
    var gameImageUrl: URL {
        URL(string: game.background_image ?? "")!
    }
    
    var body: some View {
        ZStack(alignment:.topLeading) {
            AsyncImage(url: gameImageUrl) { phase in
                switch(phase) {
                case .empty:
                    LoadingPopularView()
                    
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300, height: 200)
                        .overlay {
                            Color(.black).opacity(0.5)
                        }
                        .clipped()
                    
                case .failure( _):
                    BrokenPopularView()
                    
                @unknown default:
                    EmptyView()

                }
            }
                
            VStack(alignment: .leading) {
                Text(String(format: "%.1f", game.rating))
                    .font(.system(size: 16))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(.red.opacity(0.7))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Spacer()
                Text(game.name)
                    .font(.title3)
                    .lineLimit(1)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.white)
            }
            .padding(8)
        }
        .frame(width: 300, height: 200)
        .background(.black)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    PopularGameCard(
        game: Game.gamePreview)
//    LoadingView()
}

@ViewBuilder
func LoadingPopularView() -> some View {
    ZStack {
        Image(systemName: "photo.on.rectangle.angled")
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
    }
    .frame(width: 300, height: 200)
    .background(.gray)
    .clipShape(RoundedRectangle(cornerRadius: 10))
}

@ViewBuilder
func BrokenPopularView() -> some View {
    ZStack {
        Image(systemName: "circle.filled.pattern.diagonalline.rectangle")
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
    }
    .frame(width: 300, height: 200)
    .background(.gray)
    .clipShape(RoundedRectangle(cornerRadius: 10))
}
