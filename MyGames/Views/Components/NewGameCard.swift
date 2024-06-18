//
//  NewGameCard.swift
//  MyGames
//
//  Created by Rizki Siraj on 16/06/24.
//

import SwiftUI

struct NewGameCard: View {
    var body: some View {
        ZStack(alignment: .center) {
            Image(.redDeadRedemption2ReviewRrar)
                .resizable()
                .scaledToFill()
                .frame(height: 124)
                .overlay {
                    Color(.black).opacity(0.6)
                }
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 16))
            HStack(alignment: .center) {
                Image(.redDeadRedemption2ReviewRrar)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipped()
                    .clipShape(
                        RoundedRectangle(cornerRadius: 10)
                    )
                    .padding(.trailing, 8)
                VStack(alignment: .leading ,spacing: 4) {
                    Text("Red Dead Redemption 2")
                        .lineLimit(2)
                        .foregroundStyle(.white)
                    HStack(alignment: .center, spacing: 2) {
                        Group {
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                            Text("4.6")
                        }
                        .font(.system(size: 14))
                        .foregroundStyle(.white)
                    }
                }
                Spacer(minLength: 24)
                Text("Action")
                    .font(.system(size: 14))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(.red.opacity(0.7))
                    .foregroundStyle(.white)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 8)
                    )
                
            }
            .padding(.horizontal)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
}

#Preview {
    NewGameCard()
}
