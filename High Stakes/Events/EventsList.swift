//
//  EventsList.swift
//  High Stakes
//
//  Created by Rehan Parwani on 12/15/24.
//

import SwiftUI

struct EventsList: View {
    
    @ObservedObject var eventsViewModel = EventsViewModel.shared
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                ForEach(eventsViewModel.events) { event in
                    NavigationLink(destination: {
                        EventProps(event: event)
                    }, label: {
                        HeadToHead(event: event)
                            .padding(.vertical, 10)
                    })
                }
            }
        }
    }
}

#Preview {
    EventsList()
}
