//
//  DetailView.swift
//  MyGames
//
//  Created by Rizki Siraj on 18/06/24.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 16) {
                Image(.redDeadRedemption2ReviewRrar)
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 200, maxHeight: 200)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.bottom, 8)
                
                HStack(alignment: .top) {
                    Text("Red Dead Redemption 2")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Spacer(minLength: 16)
                    
                    HStack(alignment: .center) {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                        Text("4.5")
                    }
                }
                
                HStack(spacing: 16) {
                    HStack(spacing: 0){
                        Image(systemName: "gamecontroller")
                        Text("5hr ")
                            .padding(.leading, 8)
                            .fontWeight(.bold)
                        Text("Playtime")
                    }
                    
                    HStack(spacing: 0){
                        Image(systemName: "text.bubble")
                        Text("3K ")
                            .padding(.leading, 8)
                            .fontWeight(.bold)
                        Text("Ratings")
                    }
                    
                    Spacer()
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        Image(.redDeadRedemption2ReviewRrar)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 130)
                            .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                        Image(.redDeadRedemption2ReviewRrar)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 130)
                            .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    DetailView()
        .preferredColorScheme(.dark)
}
