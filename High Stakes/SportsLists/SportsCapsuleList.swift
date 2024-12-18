//
//  SportsCapsuleList.swift
//  High Stakes
//
//  Created by Rehan Parwani on 12/14/24.
//

import SwiftUI

struct SportsList: View {
    let sportsList = Sport.sports
    
    @State var selectedSport: SportName = .basketball
    @ObservedObject var eventsViewModel: EventsViewModel = EventsViewModel.shared
    
    var body: some View {
        VStack {
            if eventsViewModel.isLoadingEvents {
                ShimmerCardsList()
            } else {
                NavigationStack {
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(sportsList, id: \.id) { sport in
                                    SportsCapsule(sport: sport, selectedSport: $selectedSport)
                                    .padding(.vertical, 5)
                                    .padding(.horizontal, 5)
                                }
                            }
                        }
                        .padding(.top, 5)
                        
                        EventsList()
                    }
                    .overlay(
                        VStack {
                            Spacer()
                            Button(action: {
                                
                            }) {
                                Image("BetMoney")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                    .padding()
                                    .background(
                                        Circle()
                                            .fill(Color("AppColor"))
                                            .stroke(Color("AppPrimary"), lineWidth: 3.0)
                                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                                    )
                            }
                        }
                    )
                }
            }
        }
        .onAppear {
            Task {
                await eventsViewModel.fetchEvents()
            }
        }
    }
}

#Preview {
    SportsList()
}
