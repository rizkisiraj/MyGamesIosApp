//
//  GameListView.swift
//  MyGames
//
//  Created by Rizki Siraj on 04/06/24.
//

import SwiftUI

struct GameListView: View {
    @StateObject var gameVM: GameVM = GameVM()
    
    private var horizontalGameList: [Game] {
        Array(gameVM.gamesArray.prefix(3))
    }
    
    private var verticalGameList: [Game] {
        Array(gameVM.gamesArray.suffix(4))
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Popular Games")
                        .font(.title)
                        .fontWeight(.bold)
                    ScrollView(.horizontal,showsIndicators: false){
                        LazyHStack {
                            if(gameVM.isLoading) {
                                Rectangle()
                                    .foregroundStyle(.gray.opacity(0.3))
                                    .frame(width: 300, height: 200)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .shimmer(when: .constant(true))
                                Rectangle()
                                    .foregroundStyle(.gray.opacity(0.3))
                                    .frame(width: 300, height: 200)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .shimmer(when: .constant(true))
                            }
                            
                            ForEach(horizontalGameList, id: \.id) { game in
                                PopularGameCard(game: game)
                            }
                        }
                        
                    }
                    .scrollDisabled(gameVM.isLoading)
                    Text("New Games")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top)
                    
                    LazyVStack(spacing: 16) {
                        if(gameVM.isLoading) {
                            HStack {
                                Rectangle()
                                    .foregroundStyle(.gray.opacity(0.6))
                                    .frame(width: 100, height: 100)
                                    .shimmer(when: .constant(true))
                                VStack(alignment: .leading) {
                                    Text("This title is still loading")
                                        .redacted(reason: /*@START_MENU_TOKEN@*/.placeholder/*@END_MENU_TOKEN@*/)
                                    Text("loading too")
                                        .redacted(reason: /*@START_MENU_TOKEN@*/.placeholder/*@END_MENU_TOKEN@*/)
                                }
                                
                                Spacer()
                            }
                            .padding(8)
                            
                            HStack {
                                Rectangle()
                                    .foregroundStyle(.gray.opacity(0.6))
                                    .frame(width: 100, height: 100)
                                    .shimmer(when: .constant(true))
                                VStack(alignment: .leading) {
                                    Text("This title is still loading")
                                        .redacted(reason: /*@START_MENU_TOKEN@*/.placeholder/*@END_MENU_TOKEN@*/)
                                    Text("loading too")
                                        .redacted(reason: /*@START_MENU_TOKEN@*/.placeholder/*@END_MENU_TOKEN@*/)
                                }
                                
                                Spacer()
                            }
                            .padding(8)
                            
                            HStack {
                                Rectangle()
                                    .foregroundStyle(.gray.opacity(0.6))
                                    .frame(width: 100, height: 100)
                                    .shimmer(when: .constant(true))
                                VStack(alignment: .leading) {
                                    Text("This title is still loading")
                                        .redacted(reason: /*@START_MENU_TOKEN@*/.placeholder/*@END_MENU_TOKEN@*/)
                                    Text("loading too")
                                        .redacted(reason: /*@START_MENU_TOKEN@*/.placeholder/*@END_MENU_TOKEN@*/)
                                }
                                
                                Spacer()
                            }
                            .padding(8)
                        }
                        ForEach(verticalGameList, id: \.id) { game in
                            NewGameCard(game: game)
                        }
                    }
                    
                }
                .padding()
            }
            .onAppear {
                Task {
                    await gameVM.fetchGames()
                }
            }
            .refreshable {
                print("system")
                await gameVM.fetchGames()
            }
        }
    }
}

#Preview {
    GameListView()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
