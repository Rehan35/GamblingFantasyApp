//
//  BetInformation.swift
//  High Stakes
//
//  Created by Rehan Parwani on 12/16/24.
//

import SwiftUI

struct BetInformation: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var isCasinoRoyale: Bool = true
    @State var dollarBet: String = "20"
    
    var body: some View {
        VStack {
            Text("Payouts")
                .font(.title2)
                .bold()
                .padding(.top)
            Spacer()
            HStack {
                Button(action: {
                    isCasinoRoyale = false
                }) {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Royale Reserve")
                                .foregroundStyle(Color.switchPalette)
                            Image(systemName: !isCasinoRoyale ? "checkmark.circle.fill" : "circle")
                                .foregroundStyle(Color.cubeGreen)
                        }
                        Divider()
                            .frame(width: 150)
                        Text("You must hit **2** out of the 3 in\nthe entry.")
                            .padding(.vertical, 5)
                            .multilineTextAlignment(.leading)
                        
                            .font(.caption)
                        VStack {
                            HStack {
                                Text("3 Correct")
                                Text("2.25X")
                                    .foregroundStyle(Color.cubeGreen)
                            }
                            
                            HStack {
                                Text("2 Correct")
                                Text("1.25X")
                                    .foregroundStyle(Color.switchPalette)
                            }
                        }
                        .padding(.top, 5)
                        .font(.callout)
                        .bold()
                    }
                    .foregroundStyle(Color("AppPrimary"))
                }
                
                Divider()
                    .frame(height: 150)
                
                Button(action: {
                    isCasinoRoyale = true
                }) {
                    VStack(alignment: .trailing) {
                        HStack {
                            Image(systemName: isCasinoRoyale ? "checkmark.circle.fill" : "circle")
                                .foregroundStyle(Color.cubeGreen)
                            Text("Casino Royale")
                                .foregroundStyle(Color.cubeGreen)
                        }
                        Divider()
                            .frame(width: 150)
                        Text("You must hit **3** out of the 3 in\nthe entry.")
                            .padding(.vertical, 5)
                            .multilineTextAlignment(.trailing)
                        
                            .font(.caption)
                        VStack {
                            HStack {
                                Text("3 Correct")
                                Text("5X")
                                    .foregroundStyle(Color.cubeGreen)
                            }
                            
                            HStack {
                                Text("3 Correct")
                                Text("5X")
                                    .foregroundStyle(Color.cubeGreen)
                            }
                            .opacity(0.0)
                        }
                        .padding(.top, 5)
                        .font(.callout)
                        .bold()
                    }
                    .foregroundStyle(Color("AppPrimary"))
                }
                
            }
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Entry:")
                    HStack {
                        Text("$")
                        TextField("Bet", text: $dollarBet)
                            .font(.callout)
                            .keyboardType(.decimalPad)
                            .bold()
                    }
                }
                .padding(7)
                .frame(width: 90, height: 65)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.app, lineWidth: 2.0)
                )
                
                VStack(alignment: .leading) {
                    Text("To Win:")
                    HStack {
                        Text("$420.50")
                            .font(.callout)
                            .bold()
                    }
                }
                .padding(7)
                .frame(width: 90, height: 65)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.app)
                        .frame(width: 90, height: 65)
                )
                
                Spacer()
                
                VStack {
                    Text("Balance: $440.50")
                        .font(.callout)
                        .bold()
                    Text(isCasinoRoyale ? "Casino Royale" : "Royale Reserve")
                        .bold()
                        .foregroundStyle(isCasinoRoyale ? Color.cubeGreen : Color.switchPalette)
                }
                
            }
            .padding(.horizontal, 30)
            
            Spacer()
        }
        
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Spacer()
                Text("Create Deck")
                    .foregroundStyle(Color("AppPrimary"))
                    .font(.title2)
                    .bold()
                Spacer()
            }
            .padding(5)
        }
        .buttonBorderShape(.roundedRectangle(radius: 10))
        .buttonStyle(.borderedProminent)
        .tint(Color.app)
        .padding(.horizontal)
    }
}

#Preview {
    BetInformation()
}
