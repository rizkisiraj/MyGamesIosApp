//
//  ContentView.swift
//  MyGames
//
//  Created by Rizki Siraj on 01/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            GameListView()
                .tabItem {
                    Label("Games", systemImage: "gamecontroller.fill")
                }
            
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            FavoriteGamesView()
                .tabItem {
                    Label("Saved", systemImage: "bookmark.fill")
                }
        }
        .tint(.red)
        
    }
}

#Preview {
        ContentView()
}
