//
//  Prop.swift
//  High Stakes
//
//  Created by Rehan Parwani on 12/16/24.
//

import Foundation

struct PropName {
    let name: String
    let title: String
    let key: String
    
    
    static func findPropName(match: String) -> PropName {
        if let name = NBAProp.nbaProps.first(where: { $0.key == match }) {
            return name
        }
        return PropName(name: "", title: "", key: "")
    }
    
    static let h2h = PropName(name: "Head To Head", title: "Win", key: "h2h")
    static let totals = PropName(name: "", title: "Totals", key: "totals")
    static let spreads = PropName(name: "Spread", title: "Spreads", key: "spreads")
}

struct PropBet {
    let price: Double
    let point: Double
    let propOptionType: PropOptions
}

class RoyaleProp: ObservableObject {
    let name: String
    let prop1: PropBet
    let prop2: PropBet
    @Published var selectedOption: PropOptions = .none
    @Published var propName: PropName
    
    init(name: String, prop1: PropBet, prop2: PropBet, selectedOption: PropOptions, propName: PropName) {
        self.name = name
        self.prop1 = prop1
        self.prop2 = prop2
        self.selectedOption = selectedOption
        self.propName = propName
    }
    
}

struct Prop: Codable {
    let name: String
    let option1: String
    let price: Double
    var point: Double = 0.0
    
    enum CodingKeys: String, CodingKey {
        case name = "description"
        case option1 = "name"
        case price = "price"
        case point = "point"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.option1 = try container.decodeIfPresent(String.self, forKey: .option1) ?? ""
        self.price = try container.decodeIfPresent(Double.self, forKey: .price) ?? 0.0
        self.point = try container.decodeIfPresent(Double.self, forKey: .point) ?? 0.0
    }
}

struct PropsResponse: Codable {
    var success: Bool
    var data: [Props]
}

struct Props: Codable {
    var key: String
    var outcomes: [Prop]
}
