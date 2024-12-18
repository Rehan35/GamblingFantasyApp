//
//  HeadToHead.swift
//  High Stakes
//
//  Created by Rehan Parwani on 12/15/24.
//


import SwiftUI

struct HeadToHead: View {
    
    @State var viewProps: Bool = false
    @ObservedObject var event: Event
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Image("\(event.home_team)")
                        .resizable()
                        .frame(width: 70, height: 70)
                    Text("\(event.home_team)")
                        .font(.callout)
                        .bold()
                        .multilineTextAlignment(.center)
                }
                
                Spacer()
                VStack {
                    Image("\(event.away_team)")
                        .resizable()
                        .frame(width: 70, height: 70)
                    Text("\(event.away_team)")
                        .font(.callout)
                        .bold()
                }
            }
            .foregroundStyle(Color("AppPrimary"))
            
            HStack {
                
                
                HStack {
                    Text("Total Payout: $3,285.33")
                }
                .font(.caption)
                .foregroundStyle(Color("AppPrimary"))
                .bold()
                
                Spacer()
                
                Text(event.getDateString())
                    .font(.caption)
                    .foregroundStyle(Color.cubeGreen)
                
            }
            .padding(.top, 10)
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.offWhite)
                .padding(.horizontal, 15)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
        )
                
    }
}

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
    static let darkStart = Color(red: 50 / 255, green: 60 / 255, blue: 65 / 255)
    static let darkEnd = Color(red: 25 / 255, green: 25 / 255, blue: 30 / 255)
    static let darkRed = Color("DeepRed")
    static let cubeGreen = Color("CubePalette")
}

#Preview {
    HeadToHead(event: TestingVariables.event1)
}
