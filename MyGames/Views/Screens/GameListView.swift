//
//  GameListView.swift
//  MyGames
//
//  Created by Rizki Siraj on 04/06/24.
//

import SwiftUI

struct GameListView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Popular Games")
                        .font(.title)
                        .fontWeight(.bold)
                    ScrollView(.horizontal,showsIndicators: false){
                        LazyHStack {
                            PopularGameCard()
                            PopularGameCard()
                        }
                        
                    }
                    Text("New Games")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top)
                    
                    LazyVStack(spacing: 16) {
                        NewGameCard()
                        NewGameCard()
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    GameListView()
}
