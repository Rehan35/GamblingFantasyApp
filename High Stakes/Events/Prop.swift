//
//  Prop.swift
//  High Stakes
//
//  Created by Rehan Parwani on 12/15/24.
//

import SwiftUI

enum PropOptions: RawRepresentable {
    case over
    case under
    case none
    case yes
    case no
    case custom(String)
    
    var rawValue: String {
        switch self {
        case .over:
            return "Over"
        case .under:
            return "Under"
        case .custom(let value):
            return value
        case .none:
            return "None"
        case .yes:
            return "Yes"
        case .no:
            return "No"
        }
    }
    
    init(rawValue: String) {
        switch rawValue {
        case "Over":
            self = .over
        case "Under":
            self = .under
        case "Yes":
            self = .yes
        case "No":
            self = .no
        case "None":
            self = .none
        default:
            if let nickname = Teams.shared.teamsNicknameMap[rawValue] {
                self = .custom(nickname)
            } else {
                self = .custom(rawValue)
            }
        }
    }
}


struct IndividualProp: View {
    let imageName: String?
    @State var selectedOption: PropOptions = PropOptions.none
    
    @ObservedObject var royaleProp: RoyaleProp
    @ObservedObject var playersViewModel = Players.shared
    
    
    var body: some View {
        VStack {
            if let image = playersViewModel.playersImageMap[royaleProp.name] {
                Image(uiImage: image)
                    .scaleEffect(0.2)
                    .frame(width: 275, height: 200)
                    .shadow(radius: 5)
            } else {
                Image("nba-logo")
                    .cornerRadius(20)
                    .scaleEffect(0.2)
                    .frame(width: 100, height: 200)
                    .shadow(radius: 5)
                    .foregroundStyle(.secondary)
                    .shimmering()
            }
            Text(royaleProp.name)
                .font(.title2)
                .bold()
            HStack {
                if royaleProp.prop1.point != 0 {
                    Text("\(StaticFunctions.getDoubleString(royaleProp.prop1.point, 1))")
                        .font(.title2)
                        .bold()
                }
                Text("\(royaleProp.propName.name)")
                    .font(.title3)
            }
            .padding(10)
            .neumorphicBackground(cornerRadius: 10.0)
            
            Divider()
                .frame(width: 250)
            
            HStack {
                VStack {
                    Text("\(royaleProp.prop1.propOptionType.rawValue)")
                        .bold()
                    Text("\(royaleProp.prop1.price > 0 ? "+" : "")\(StaticFunctions.getDoubleString(royaleProp.prop1.price, 0))")
                        .foregroundStyle(royaleProp.prop1.price > 0 ? Color.green : Color.red)
                        .bold()
                }
                .padding(selectedOption == royaleProp.prop1.propOptionType ? 10 : 0)
                .neumorphicBackground(cornerRadius: 10.0, displayBackground: selectedOption == royaleProp.prop1.propOptionType)
                .padding(.trailing, 50)
                
                Divider()
                    .frame(height: 30)
                
                VStack {
                    Text("\(royaleProp.prop2.propOptionType.rawValue)")
                        .bold()
                    Text("\(royaleProp.prop2.price > 0 ? "+" : "")\(StaticFunctions.getDoubleString(royaleProp.prop2.price, 0))")
                        .foregroundStyle(royaleProp.prop2.price > 0 ? Color.green : Color.red)
                        .bold()
                }
                .padding(selectedOption == royaleProp.prop2.propOptionType ? 10 : 0)
                .neumorphicBackground(cornerRadius: 10.0, displayBackground: selectedOption == royaleProp.prop2.propOptionType)
                .padding(.leading, 50)
            }
            .padding(.top, 10)
            .font(.title3)
        }
        .padding(15)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.offWhite)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.offWhite)
                        .padding(.horizontal, 15)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                )
        )
    }
}

#Preview {
    IndividualProp(imageName: "CurryTestImage", royaleProp: TestingVariables.royaleProp1)
}
