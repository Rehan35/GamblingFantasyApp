//
//  SportsPropViewModel.swift
//  High Stakes
//
//  Created by Rehan Parwani on 12/16/24.
//

import Foundation


class EventsPropViewModel: ObservableObject {
    static var shared = EventsPropViewModel()
    @Published var isLoadingProps: Bool = true
    @Published var gameID: String = ""
    @Published var props: [RoyaleProp] = []
    
    init() {
        
    }
    
    init(royaleProps: [RoyaleProp]) {
        self.props = royaleProps
    }
    
    
    @MainActor
    func fetchNBAProps(sport: APISport, markets: [String], region: Regions, oddsFormat: OddsFormat, eventID: String, bookmakers: Bookmakers) async -> Bool {
        do {
            let props: PropsResponse? = try await ServerCommunicator.shared.callMyServer<PropsResponse?>(path: "/api/get_event_odds", httpMethod: .post, params: ["sport":sport.rawValue, "markets": markets, "region": region.rawValue, "oddsFormat": oddsFormat.rawValue, "eventID": eventID, "bookmakers": bookmakers.rawValue])
            if let props = props {
                for prop in props.data.filter({ $0.outcomes.count%2 == 0 }) {
                    for index in stride(from: 0, to: prop.outcomes.count, by: 2) {
                        let firstProp = prop.outcomes[index]
                        let secondProp = (index + 1 < prop.outcomes.count) ? prop.outcomes[index + 1] : nil
                        
                        if let second = secondProp {
                            let firstOption = PropOptions(rawValue: firstProp.option1)
                            let secondOption = PropOptions(rawValue: second.option1)
                            
                            let royaleProp = RoyaleProp(name: firstProp.name, prop1: PropBet(price: firstProp.price, point: firstProp.point, propOptionType: firstOption), prop2: PropBet(price: second.price, point: second.point, propOptionType: secondOption), selectedOption: .none, propName: PropName.findPropName(match: prop.key))
                            DispatchQueue.main.async {
                                self.props.append(royaleProp)
                            }
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.isLoadingProps = false
                }
                return true
            }
            return false
        } catch {
            print(error)
            DispatchQueue.main.async {
                self.isLoadingProps = false
            }
        }
        
        return false
    }
    
}
