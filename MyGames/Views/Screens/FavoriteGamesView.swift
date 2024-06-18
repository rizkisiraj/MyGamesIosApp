//
//  FavoriteGamesView.swift
//  MyGames
//
//  Created by Rizki Siraj on 18/06/24.
//

import SwiftUI

struct FavoriteGamesView: View {
    var body: some View {
        List {
            ForEach((1...10).reversed(), id: \.self) {_ in 
                  DefaultGameCard()
            }
            
        }
        .listStyle(.plain)
    }
}

#Preview {
    FavoriteGamesView()
}
