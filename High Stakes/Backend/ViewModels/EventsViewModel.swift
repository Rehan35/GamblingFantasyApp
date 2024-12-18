//
//  EventsViewModel.swift
//  High Stakes
//
//  Created by Rehan Parwani on 12/16/24.
//


import Foundation

enum APISport: String {
    
    case nba = "basketball_nba"
}

enum OddsFormat: String {
    case american = "american"
    case decimal = "decimal"
}

enum Regions: String {
    case us = "us"
    case us2 = "us2"
}

enum Bookmakers: String {
    case draftkings = "draftkings"
}

class EventsViewModel: ObservableObject {
    static var shared: EventsViewModel = EventsViewModel()
    @Published var events: [Event] = []
    @Published var isLoadingEvents: Bool = true
    
    @MainActor
    func fetchEvents() async -> Bool {
        do {
            let events: Events? = try await ServerCommunicator.shared.callMyServer<Events?>(path: "/api/get_events", httpMethod: .post, params: ["sport": APISport.nba.rawValue])
            
            if let events = events {
                self.isLoadingEvents = false
                self.events = events.data
                return events.success
            }
            return false
        } catch {
            print(error)
            return false
        }
    }
}
