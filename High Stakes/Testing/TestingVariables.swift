//
//  TestingVariables.swift
//  High Stakes
//
//  Created by Rehan Parwani on 12/16/24.
//

struct TestingVariables {
    static let event1 = Event(id: "552b0679668ac1011ceb86524711c27b", sport_key: "basketball_nba", sport_title: "NBA", commence_time: "2024-12-25T17:00:00Z", home_team: "Sacramento Kings", away_team: "Los Angeles Lakers")
    static let royaleProp1 = RoyaleProp(name: "Stephen Curry", prop1: PropBet(price: 150, point: 32.5, propOptionType: .under), prop2: PropBet(price: -115, point: 32.5, propOptionType: .over), selectedOption: .none, propName: PropName(name: "Points", title: "Total Points", key: "player_points"))
    static let eventPropsViewModel = EventsPropViewModel(royaleProps: [royaleProp1, royaleProp1, royaleProp1, royaleProp1, royaleProp1, royaleProp1, royaleProp1, royaleProp1, royaleProp1])
}
