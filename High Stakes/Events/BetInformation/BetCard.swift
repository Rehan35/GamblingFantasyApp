//
//  BetCard.swift
//  High Stakes
//
//  Created by Rehan Parwani on 12/16/24.
//


import SwiftUI

struct BetCard: View {
    @State var displayBettingInfo: Bool = false
    
    let options = ["Casino Royale", "Royale Reserve"]
    @State var selectedOption = 0
    
    @State var legBetTextField: String = ""
    
    var body: some View {
        HStack {
            if !displayBettingInfo {
                Text("\(options[selectedOption])")
                    .font(.callout)
                    .foregroundStyle(Color.cubeGreen)
            }
            Spacer()
            Text("Payout: $3285.33")
                .bold()
                .font(.callout)
                .foregroundStyle(Color.cubeGreen)
        }
        .padding(10)
        .popNeumorphicBackground(displayBackground: true, shape: .rectangle)
        .padding(.horizontal, 15)
        .padding(.top, 5)
    }
}
