//
//  DetailView.swift
//  MyGames
//
//  Created by Rizki Siraj on 18/06/24.
//

import SwiftUI
import CoreData

struct DetailView: View {
    @Environment(\.managedObjectContext) var viewContext
    @StateObject var viewModel: GameDetailVM
    @State private var isLiked: Bool = false
    
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
                
                HStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        Text(viewModel.game?.name ?? "Placeholder")
                            .font(.title3)
                            .fontWeight(.bold)
                        .redacted(reason: viewModel.isLoading ? .placeholder : [])
                        
                        HStack(alignment: .center) {
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                            Text(String(viewModel.game?.rating ?? 0))
                                .redacted(reason: viewModel.isLoading ? .placeholder : [])
                        }
                    }
                    
                    Spacer(minLength: 16)
                    
                    Button {
                        if(isLiked) {
                            return
                        }
                        
                        saveGame()
                    } label: {
                        Image(systemName: isLiked ? "heart.fill" : "heart")
                            .font(.title)
                            .foregroundStyle(.red)
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
        .onAppear {
            isLiked = doesObjectExist(id: viewModel.id)
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func doesObjectExist(id: Int) -> Bool {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "GameDataModel")
            fetchRequest.predicate = NSPredicate(format: "id == %d", Int64(id))
            fetchRequest.fetchLimit = 1

            do {
                let count = try viewContext.count(for: fetchRequest)
                return count > 0
            } catch {
                print("Fetch error: \(error)")
                return false
            }
    }
    
    func saveGame() {
        let gameToSave = GameDataModel(context: self.viewContext)
        gameToSave.id = Int64(viewModel.id)
        gameToSave.background_image = viewModel.game?.background_image
        gameToSave.released = viewModel.game?.released
        gameToSave.title = viewModel.game?.name
        
        do {
            try self.viewContext.save()
            self.isLiked = true
            print("game saved!")
        } catch {
            print("whoops \(error.localizedDescription)")
        }
    }
}

#Preview {
    DetailView(id: 3498)
}
