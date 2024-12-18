//
//  AllEventPropIndividualList.swift
//  High Stakes
//
//  Created by Rehan Parwani on 12/15/24.
//


import SwiftUI

struct AllEventPropIndividual: View {
    
    @State var selectedOption = PropOptions.none
    @State var isComplete: Bool = false
    @State var didHit: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Image("CurryTestImage")
                    .scaleEffect(0.075)
                    .frame(width: 135, height: 75)
                    .shadow(radius: 5)
                
                Spacer()
                
                HStack {
                    Button(action: {
                        if selectedOption != .under {
                            selectedOption = .under
                        } else {
                            selectedOption = .none
                        }
                    }) {
                        VStack {
                            Text("Under")
                                .bold()
                            Text("-215")
                                .foregroundStyle(Color.red)
                                .bold()
                        }
                        .padding(selectedOption == .under ? 5 : 0)
                        .popNeumorphicBackground(displayBackground: selectedOption == .under, shape: .rectangle)
                    }
                    
                    Divider()
                        .frame(height: 30)
                    
                    Button(action: {
                        if selectedOption != .over {
                            selectedOption = .over
                        } else {
                            selectedOption = .none
                        }
                    }) {
                        VStack {
                            Text("Over")
                                .bold()
                            Text("+115")
                                .foregroundStyle(Color.green)
                                .bold()
                        }
                        .padding(selectedOption == .over ? 5 : 0)
                        .popNeumorphicBackground(displayBackground: selectedOption == .over, shape: .rectangle)
                    }
                }
                .foregroundStyle(Color("AppPrimary"))
                .padding(.trailing, 20)
            }
            
            HStack {
                Text("Stephen Curry")
                    .font(.callout)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.leading, 20)
                
                Spacer()
                
                Text("26.5 Points")
                    .padding(.trailing, 20)
                    .font(.title3)
                    .bold()
                    .foregroundStyle(Color("CubePalette"))
                
            }
            
            Divider()
        }
        .overlay(alignment: .topLeading, content: {
            getEventPropLeadingOverlay()
        })
    }
    
    func getEventPropLeadingOverlay() -> some View {
        VStack {
            if !isComplete {
                HStack {
                    Image(systemName: "clock.badge.fill")
                        .padding(.leading, 5)
                        .foregroundStyle(Color.app)
                        .font(.title2)
                }
                .offset(y: -20)
            } else {
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                        .padding(.leading, 5)
                        .foregroundStyle(didHit ? Color.cubeGreen : Color.darkRed)
                        .font(.title3)
                }
                .offset(y: -20)
            }
        }
    }
    
    func getBetPayout() -> Color {
        if isComplete {
            if didHit {
                return Color.cubeGreen
            } else {
                return Color.darkRed
            }
        }
        
        return Color.app
    }
}

#Preview {
    AllEventPropIndividual()
}
