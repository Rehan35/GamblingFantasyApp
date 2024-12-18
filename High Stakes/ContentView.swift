//
//  ContentView.swift
//  High Stakes
//
//  Created by Rehan Parwani on 12/14/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @ObservedObject var playersViewModel: Players = Players.shared
    @ObservedObject var teamsViewModel: Teams = Teams.shared

    var body: some View {
        VStack {
            SportsList()
                .onAppear {
                    Task {
                        teamsViewModel.fetchAllTeamNames()
                        await playersViewModel.fetchAllPlayers()
                    }
                }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
