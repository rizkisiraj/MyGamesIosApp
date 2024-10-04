//
//  DefaultGameCard.swift
//  MyGames
//
//  Created by Rizki Siraj on 18/06/24.
//

import SwiftUI

struct DefaultGameCard: View {
    var title: String
    var background_image: String
    var genre: String?

    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: background_image)!) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 60)
                        .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                } placeholder: {
                    Color.gray
                        .frame(width: 100, height: 60)
                        .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                }
                
                Text("Feb 13, 2023")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            VStack(alignment: .leading) {
                Text(title)
                Text("Action")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding(.vertical, 8)
            
        }
        .listRowSeparator(.hidden)
    }
}

