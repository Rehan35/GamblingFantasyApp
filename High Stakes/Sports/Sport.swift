//
//  Sport.swift
//  High Stakes
//
//  Created by Rehan Parwani on 12/14/24.
//

import Foundation

enum SportName {
    case basketball
    case football
    case baseball
    case hockey
    case soccer
    case collegebasketball
    case collegefootball
}

struct Sport: Identifiable {
    let name: String
    let imageIconName: String
    let sportCase: SportName
    let id: UUID = UUID()
    
    static let basketball = Sport(name: "Basketball", imageIconName: "basketball", sportCase: .basketball)
    static let football = Sport(name: "Football", imageIconName: "football", sportCase: .football)
    static let baseball = Sport(name: "Baseball", imageIconName: "baseball", sportCase: .baseball)
    static let hockey = Sport(name: "Hockey", imageIconName: "hockey", sportCase: .hockey)
    static let soccer = Sport(name: "Soccer", imageIconName: "soccer", sportCase: .soccer)
    static let collegebasketball = Sport(name: "College Basketball", imageIconName: "collegebasketball", sportCase: .collegebasketball)
    static let collegefootball = Sport(name: "College Football", imageIconName: "collegefootball", sportCase: .collegefootball)
    
    static let sports = [basketball, football, baseball, hockey, soccer, collegebasketball, collegefootball]
    
}
