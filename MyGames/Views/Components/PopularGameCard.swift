//
//  PopularGameCard.swift
//  MyGames
//
//  Created by Rizki Siraj on 16/06/24.
//

import SwiftUI

struct PopularGameCard: View {
    var body: some View {
        ZStack(alignment:.topLeading) {
            Image(.redDeadRedemption2ReviewRrar)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 200)
                .overlay {
                    Color(.black).opacity(0.5)
                }
                .clipped()
                
            VStack(alignment: .leading) {
                Text("4.6")
                    .font(.system(size: 16))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(.red.opacity(0.7))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Spacer()
                Text("Red Dead Redemption 2")
                    .font(.title3)
                    .lineLimit(1)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.white)
            }
            .padding(8)
        }
        .frame(width: 300, height: 200)
        .background(.black)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    PopularGameCard()
}
