//
//  SearchView.swift
//  MyGames
//
//  Created by Rizki Siraj on 18/06/24.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        NavigationStack {
            List {
                HStack {
                    Image(.redDeadRedemption2ReviewRrar)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                    
                    VStack(alignment: .leading) {
                        Text("Red Dead Redemption")
                            .padding(.bottom, 4)
                        Text("Action")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    
                }
                .listRowSeparator(.hidden)
                
                HStack {
                    Image(.redDeadRedemption2ReviewRrar)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                    
                    VStack(alignment: .leading) {
                        Text("Red Dead Redemption")
                            .padding(.bottom, 4)
                        Text("Action")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .searchable(text: .constant("Siraj"))
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
