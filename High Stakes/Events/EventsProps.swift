//
//  EventsProps.swift
//  High Stakes
//
//  Created by Rehan Parwani on 12/15/24.
//

import SwiftUI
import TipKit


struct EventProps: View {
//    let pickerOptions = ["all","arrowtriangle.left.and.line.vertical.and.arrowtriangle.right","results"]
    @State var selectedOption: Int = 1
    let pickerOptions = ["All", "Swipe", "Results"]
    
    @ObservedObject var event: Event
    @StateObject var sportsEventsViewModel = EventsPropViewModel()
    
//    @State var displayBetInfo: Bool = false
    
    
    var body: some View {
        VStack {
            HeadToHead(event: event)
            
            Picker("Options", selection: $selectedOption) {
                ForEach(0..<pickerOptions.count, id: \.self) { index in
                    Text(pickerOptions[index]).tag(index)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            .padding(.top, 5)
            
            if selectedOption == 1 {
                Spacer()
                
                SwipeableView(eventsPropsViewModel: sportsEventsViewModel)
                
                Spacer()
            } else if selectedOption == 0  {
                AllEventPropsList()
            } else {
                
            }
        }
        .onAppear {
            Task {
//                NBAProp.nbaProps.prefix(upTo: 3)
                let markets = NBAProp.nbaProps.map({ return $0.key })
                print("Event ID: \(event.id)")
                let _ = await sportsEventsViewModel.fetchNBAProps(sport: APISport.nba, markets: markets, region: Regions.us, oddsFormat: OddsFormat.american, eventID: event.id, bookmakers: Bookmakers.draftkings)
            }
        }
    }
}

#Preview {
    EventProps(event: TestingVariables.event1)
}
