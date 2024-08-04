//
//  DetailView.swift
//  MyGames
//
//  Created by Rizki Siraj on 18/06/24.
//

import SwiftUI

struct DetailView: View {
    @StateObject var viewModel: GameDetailVM
    
    init(id: Int) {
        _viewModel = StateObject(wrappedValue: GameDetailVM(id: id))
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16) {
                ZStack(alignment: .bottomTrailing) {
                    AsyncImage(url: URL(string:viewModel.game?.background_image ?? "")) { phase in
                        switch(phase) {
                        case .empty:
                            Rectangle()
                                .foregroundStyle(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 200, maxHeight: 200)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .padding(.bottom, 8)
                            
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 200, maxHeight: 200)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .padding(.bottom, 8)
                            
                        case .failure( _):
                            Rectangle()
                                .foregroundStyle(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 200, maxHeight: 200)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .padding(.bottom, 8)
                        @unknown default:
                            EmptyView()
                        }
                        
                    }
                    
                    HStack {
                        ForEach(viewModel.game?.genres ?? [], id: \.id) { genre in
                            Text(genre.name)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 4)
                                .background(.red.opacity(0.8))
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(.red, lineWidth: 1)
                                    )
                            
                        }
                        
                    }
                    .padding()
                }
                
                HStack(alignment: .top) {
                    Text(viewModel.game?.name ?? "Placeholder")
                        .font(.title3)
                        .fontWeight(.bold)
                        .redacted(reason: viewModel.isLoading ? .placeholder : [])
                    
                    Spacer(minLength: 16)
                    
                    HStack(alignment: .center) {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                        Text(String(viewModel.game?.rating ?? 0))
                            .redacted(reason: viewModel.isLoading ? .placeholder : [])
                    }
                }
                
                HStack(spacing: 16) {
                    HStack(spacing: 0){
                        Image(systemName: "gamecontroller")
                        Text("\(viewModel.game?.playtime ?? 0)hr ")
                            .padding(.leading, 8)
                            .fontWeight(.bold)
                            .redacted(reason: viewModel.isLoading ? .placeholder : [])
                        Text("Playtime")
                            .redacted(reason: viewModel.isLoading ? .placeholder : [])
                    }
                    
                    HStack(spacing: 0){
                        Image(systemName: "text.bubble")
                        Text("\(NumberUtils.formatRatingCount(viewModel.game?.ratings_count ?? 0)) ")
                            .padding(.leading, 8)
                            .fontWeight(.bold)
                            .redacted(reason: viewModel.isLoading ? .placeholder : [])
                        Text("Ratings")
                            .redacted(reason: viewModel.isLoading ? .placeholder : [])
                    }
                    
                    Spacer()
                }
                
                Text(viewModel.game?.description_raw ?? "description for this shit my mand")
                    .redacted(reason: viewModel.isLoading ? .placeholder : [])
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(viewModel.screenshots, id: \.id) { screenshot in
                            AsyncImage(url: URL(string: screenshot.image)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 200, height: 130)
                                    .clipped()
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            } placeholder: {
                                Color.gray.frame(width: 200, height: 130).clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                        }
                        
                        
                        Image(.redDeadRedemption2ReviewRrar)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 130)
                            .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                Spacer()
            }
        }
        .padding()
        .task {
            await viewModel.fetchData()
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailView(id: 3498)
}
