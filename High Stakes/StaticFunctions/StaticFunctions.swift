//
//  StaticFUnctions.swift
//  High Stakes
//
//  Created by Rehan Parwani on 12/17/24.
//


import Foundation

struct StaticFunctions {
    static func getDoubleString(_ double: Double, _ decimalPlaces: Int) -> String {
        return String(format: "%.\(decimalPlaces)f", double)
    }
}
