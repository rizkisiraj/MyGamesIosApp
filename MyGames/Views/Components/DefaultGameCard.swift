//
//  DefaultGameCard.swift
//  MyGames
//
//  Created by Rizki Siraj on 18/06/24.
//

import SwiftUI

struct DefaultGameCard: View {
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Image(.redDeadRedemption2ReviewRrar)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 60)
                    .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 4))
                
                Text("13 Feb, 2023")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            VStack(alignment: .leading) {
                Text("Red Dead Redemption")
                Text("Action")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding(.vertical, 8)
            
        }
        .listRowSeparator(.hidden)
    }
}

#Preview {
    DefaultGameCard()
}
