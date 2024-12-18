//
//  PropShimmer.swift
//  High Stakes
//
//  Created by Rehan Parwani on 12/16/24.
//


import SwiftUI

struct IndividualPropListShimmer: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "square.fill")
                    .scaleEffect(5)
                    .frame(width: 135, height: 75)
                    .shadow(radius: 5)
                    .foregroundStyle(.secondary)
                    .opacity(0.4)
                
                Spacer()
                
                HStack {
                    Button(action: {
                        
                    }) {
                        VStack {
                            CapsuleShimmer(width: 60, height: 10, opacity: 0.4)
                            CapsuleShimmer(width: 50, height: 10, opacity: 0.4)
                        }
                    }
                    
                    Divider()
                        .frame(height: 30)
                    
                    Button(action: {
                        
                    }) {
                        VStack {
                            CapsuleShimmer(width: 60, height: 10, opacity: 0.4)
                            CapsuleShimmer(width: 50, height: 10, opacity: 0.4)
                        }
                    }
                }
                .foregroundStyle(Color("AppPrimary"))
                .padding(.trailing, 20)
            }
            
            HStack {
                CapsuleShimmer(width: 100, height: 10, opacity: 0.4)
                    .padding(.leading, 20)
                
                Spacer()
                
                CapsuleShimmer(width: 100, height: 15, opacity: 0.4)
                    .padding(.trailing, 20)
                
            }
            
            Divider()
        }
        .shimmering()
    }
}

struct IndividualPropShimmer: View {
    var body: some View {
        VStack {
            Image(systemName: "square.fill")
                .scaleEffect(9)
                .frame(width: 275, height: 200)
                .shadow(radius: 5)
                .foregroundStyle(Color.secondary)
                .opacity(0.4)
            CapsuleShimmer(width: 200, height: 10, opacity: 0.4)
            HStack {
                CapsuleShimmer(width: 75, height: 10, opacity: 0.4)
            }
            .padding(10)
            .neumorphicBackground(cornerRadius: 10.0)
            
            Divider()
                .frame(width: 250)
            
            HStack {
                VStack {
                    CapsuleShimmer(width: 60, height: 10, opacity: 0.4)
                    CapsuleShimmer(width: 50, height: 10, opacity: 0.4)
                }
                .padding(.trailing, 50)
                
                Divider()
                    .frame(height: 30)
                
                VStack {
                    CapsuleShimmer(width: 60, height: 10, opacity: 0.4)
                    CapsuleShimmer(width: 50, height: 10, opacity: 0.4)
                }
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
        .shimmering()
    }
}

#Preview {
    IndividualPropListShimmer()
}
