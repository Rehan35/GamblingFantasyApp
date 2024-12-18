//
//  AllEventPropsList.swift
//  High Stakes
//
//  Created by Rehan Parwani on 12/15/24.
//

import SwiftUI

struct AllEventPropsList: View {
    
    let cards = ["Jayson Tatum Test", "CurryTestImage", "Kyrie Irving Test Image", "Lebron James Image", "Shai Test Image"]
    
    @State var listView: Bool = true
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Menu {
                    Button(action: {
                        listView = true
                    }) {
                        Label("List", systemImage: "list.bullet.below.rectangle") // Icon and text for option 1
                    }
                    
                    Button(action: {
                        listView = false
                    }) {
                        Label("Card", systemImage: "lanyardcard.fill") // Icon and text for option 2
                    }
                } label: {
                    Image(systemName: "list.star")
                        .padding(.trailing)
                        .foregroundStyle(Color.app)
                }
            }
            
            if listView {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        AllEventPropIndividual(isComplete: false, didHit: false)
                            .padding(.top)
                        AllEventPropIndividual(isComplete: true, didHit: true)
                            .padding(.top)
                        AllEventPropIndividual(isComplete: true, didHit: false)
                            .padding(.top)
                    }
                }
            } else {
                GeometryReader { geometry in
                    TabView {
                        ForEach(cards.indices, id: \.self) { index in
                            IndividualProp(imageName: cards[index], royaleProp: TestingVariables.royaleProp1)
                                .frame(width: geometry.size.width * 0.7, height: geometry.size.height * 0.8)
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never)) // Disable page indicator dots
                    .frame(width: geometry.size.width, height: geometry.size.height)
                }
            }
        }
    }
}

#Preview {
    AllEventPropsList()
}
