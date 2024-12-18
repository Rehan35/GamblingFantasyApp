//
//  PropNBA.swift
//  High Stakes
//
//  Created by Rehan Parwani on 12/16/24.
//


//player_assists_q1    1st Quarter Assists (Over/Under)
//player_threes    Threes (Over/Under)
//player_blocks    Blocks (Over/Under)
//player_steals    Steals (Over/Under)
//player_blocks_steals    Blocks + Steals (Over/Under)
//player_turnovers    Turnovers (Over/Under)
//player_points_rebounds_assists    Points + Rebounds + Assists (Over/Under)
//player_points_rebounds    Points + Rebounds (Over/Under)
//player_points_assists    Points + Assists (Over/Under)
//player_rebounds_assists    Rebounds + Assists (Over/Under)
//player_field_goals    Field Goals (Over/Under)
//player_frees_made    Frees made (Over/Under)
//player_frees_attempts    Frees attempted (Over/Under)
//player_first_basket    First Basket Scorer (Yes/No)
//player_double_double    Double Double (Yes/No)
//player_triple_double    Triple Double (Yes/No)
//player_method_of_first_basket    Method of First Basket (Various) --> ignore for now
//#

import SwiftUI



struct NBAProp {
    
    static let playerPoints = PropName(name: "Points", title: "Total Points", key: "player_points")
    static let playerAssists = PropName(name: "Assists", title: "Total Assists", key: "player_assists")
    static let playerRebounds = PropName(name: "Rebounds", title: "Total Assists", key: "player_rebounds")
    static let playerPointsQ1 = PropName(name: "Points", title: "1st Quarter Points", key: "player_points_q1")
    static let playerReboundsQ1 = PropName(name: "Rebounds", title: "1st Quarter Rebounds", key: "player_rebounds_q1")
    static let playerAssistsQ1 = PropName(name: "Assists", title: "1st Quarter Points", key: "player_assists_q1")
    static let playerThrees = PropName(name: "Threes", title: "1st Quarter Points", key: "player_threes")
    static let playerBlocks = PropName(name: "Blocks", title: "1st Quarter Points", key: "player_blocks")
    static let playerSteals = PropName(name: "Steals", title: "1st Quarter Points", key: "player_steals")
    static let playerBlocksSteals = PropName(name: "Blocks + Steals", title: "Blocks & Steals", key: "player_blocks_steals")
    static let playerTurnovers = PropName(name: "Turnovers", title: "Turnovers", key: "player_turnovers")
    static let playerPRA = PropName(name: "PRA", title: "Points + Rebounds + Assists", key: "player_points_rebounds_assists")
    static let playerPR = PropName(name: "PR", title: "Points + Rebounds", key: "player_points_rebounds")
    static let playerPA = PropName(name: "PA", title: "Points + Assists", key: "player_points_assists")
    static let playerFG = PropName(name: "FGM", title: "Field Goals Made", key: "player_field_goals")
    static let playerFTM = PropName(name: "FTM", title: "Free Throws Made", key: "player_frees_made")
    static let playerFTA = PropName(name: "FTA", title: "Free Throw Attempts", key: "player_frees_attempts")
//    static let playerFirstBasket = PropName(name: "Points", title: "1st Quarter Points", key: "player_first_basket")
//    static let playerDoubleDouble = PropName(name: "Points", title: "1st Quarter Points", key: "player_double_double")
//    static let playerTripleDouble = PropName(name: "Points", title: "1st Quarter Points", key: "player_triple_double")
    
    static let nbaProps = [PropName.h2h, PropName.totals, PropName.spreads, playerPoints, playerAssists, playerRebounds, playerPointsQ1, playerReboundsQ1, playerAssistsQ1, playerThrees, playerBlocks, playerSteals, playerBlocksSteals, playerTurnovers, playerPRA, playerPR, playerPA, playerFG, playerFTM, playerFTA, /*playerFirstBasket, playerDoubleDouble, playerTripleDouble*/]
}


