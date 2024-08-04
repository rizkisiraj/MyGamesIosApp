//
//  FavoriteGamesView.swift
//  MyGames
//
//  Created by Rizki Siraj on 18/06/24.
//

import SwiftUI

struct FavoriteGamesView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach((1...5).reversed(), id: \.self) {_ in 
                    NavigationLink(destination: DetailView(id: 3498)) {
                        DefaultGameCard()
                    }
                    
                }
                
            }
            .listStyle(.plain)
            .navigationTitle("Favorite Games")
        }
    }
}

#Preview {
    FavoriteGamesView()
}
