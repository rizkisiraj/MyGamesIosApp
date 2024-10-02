//
//  SearchView.swift
//  MyGames
//
//  Created by Rizki Siraj on 18/06/24.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = GameSearchVM()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.games, id: \.id) { game in
                    HStack {
                        AsyncImage(url: URL(string: game.background_image ?? "")) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 70, height: 70)
                                .clipped()
                                .clipShape(RoundedRectangle(cornerRadius: 4))
                        } placeholder: {
                            Color.gray
                                .frame(width: 70, height: 70)
                                .clipped()
                                .clipShape(RoundedRectangle(cornerRadius: 4))
                            
                        }
                        VStack(alignment: .leading) {
                            Text(game.name)
                                .padding(.bottom, 4)
                            Text("Action")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        
                    }
                    .listRowSeparator(.hidden)
                }
                switch viewModel.state {
                    case .good:
                        Color.clear
                            .onAppear {
                                Task {
                                    await viewModel.loadMore()
                                }
                            }
                    case .isLoading:
                        ProgressView()
                            .progressViewStyle(.circular)
                            .frame(maxWidth: .infinity)
                    case .loadedAll:
                        EmptyView()
                    case .error(let message):
                        Text(message)
                            .foregroundColor(.pink)
                }
            }
            .listStyle(.plain)
            .searchable(text: $viewModel.searchTerm)
            .navigationTitle("Search Games")
        }
        
    }
}

#Preview {
    NavigationStack {
        SearchView()
    }
    .preferredColorScheme(.dark)
    
}
