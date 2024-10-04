//
//  FavoriteGamesView.swift
//  MyGames
//
//  Created by Rizki Siraj on 18/06/24.
//

import SwiftUI

struct FavoriteGamesView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \GameDataModel.id, ascending: true)],
        animation: .default)
    private var items: FetchedResults<GameDataModel>
    
    var body: some View {
        NavigationStack {
            List(items) {item in
                NavigationLink(destination: DetailView(id: Int(item.id))) {
                    DefaultGameCard(title: item.title ?? "", background_image: item.background_image ?? "")
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
