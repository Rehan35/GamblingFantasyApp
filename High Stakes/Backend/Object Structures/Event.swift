//
//  Event.swift
//  High Stakes
//
//  Created by Rehan Parwani on 12/16/24.
//

import Foundation

class Event: ObservableObject, Identifiable, Codable {
    let id: String
    let sport_key: String
    let sport_title: String
    let commence_time: String
    let home_team: String
    let away_team: String
    
    init(id: String, sport_key: String, sport_title: String, commence_time: String, home_team: String, away_team: String) {
        self.id = id
        self.sport_key = sport_key
        self.sport_title = sport_title
        self.commence_time = commence_time
        self.home_team = home_team
        self.away_team = away_team
    }
    
    func getDateString() -> String {
        let isoDateString = commence_time

        // Create a DateFormatter to parse the ISO string
        let isoFormatter = ISO8601DateFormatter()
        if let date = isoFormatter.date(from: isoDateString) {
            
            // Create another DateFormatter for the desired output
            let outputFormatter = DateFormatter()
            outputFormatter.dateStyle = .short     // Full date (e.g., December 25, 2024)
            outputFormatter.timeStyle = .short    // Short time (e.g., 5:00 PM)
            outputFormatter.timeZone = TimeZone.current // Set to the device's time zone
            
            // Convert the date into a formatted string
            return outputFormatter.string(from: date)
        } else {
            return ""
        }
    }
}

struct Events: Codable {
    var success: Bool
    var data: [Event]
}
