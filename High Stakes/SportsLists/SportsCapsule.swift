//
//  SportsCapsule.swift
//  High Stakes
//
//  Created by Rehan Parwani on 12/14/24.
//

import SwiftUI


struct SportsCapsule: View {
    let sport: Sport
    
    @Binding var selectedSport: SportName
    
    var body: some View {
        Button(action: {
            withAnimation(.default) {
                selectedSport = sport.sportCase
            }
        }) {
            HStack {
                Image(sport.imageIconName)
                    .resizable()
                    .frame(width: 30, height: 30)
                Text(sport.name)
                    .foregroundStyle(selectedSport == sport.sportCase ? Color("AppSecondary") : Color("AppPrimary"))
                    .bold()
            }
            .padding(.horizontal)
            .frame(height: 40)
            .background(
                Capsule(style: .circular)
                    .fill(selectedSport == sport.sportCase ? Color("AppPrimary") : Color("AppSecondary"))
                    .stroke( Color("AppPrimary"), lineWidth: 2.0)
            )
        }
    }
}

#Preview {
    @Previewable @State var selectedSport: SportName = .baseball
    SportsCapsule(sport: Sport(name: "Basketball", imageIconName: "basketball", sportCase: SportName.basketball), selectedSport: $selectedSport)
}
