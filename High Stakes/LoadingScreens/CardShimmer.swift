//
//  CardShimmer.swift
//  High Stakes
//
//  Created by Rehan Parwani on 12/16/24.
//

import SwiftUI

struct ShimmerCardsList: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(1..<7) { _ in
                        ShimmerCapsule()
                    }
                }
            }
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(1..<7) { _ in
                        ShimmerCard()
                    }
                }
            }
        }
    }
}

struct ShimmerCapsule: View {
    var body: some View {
        HStack {
            Image(systemName: "circle.fill")
                .frame(width: 35, height: 35)
                .foregroundStyle(.secondary)
            Capsule()
                .fill(Color.secondary)
                .frame(width: UIScreen.main.bounds.width/6.5, height: 10)
            
        }
        .padding(5)
        .background(
            Capsule()
                .stroke(Color.black, lineWidth: 0.5)
        )
        .padding(.horizontal, 5)
        .shimmering()
        
    }
}

struct ShimmerCard: View {
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Image(systemName: "circle.fill")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .foregroundStyle(.secondary)
                        .opacity(0.4)
                    Capsule()
                        .frame(width: 100, height: 10)
                        .foregroundStyle(.secondary)
                        .opacity(0.4)
                }
                
                Spacer()
                VStack {
                    Image(systemName: "circle.fill")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .foregroundStyle(.secondary)
                        .opacity(0.4)
                    Capsule()
                        .frame(width: 100, height: 10)
                        .foregroundStyle(.secondary)
                        .opacity(0.4)
                }
            }
            .foregroundStyle(Color("AppPrimary"))
            
            HStack {
                
                
                Capsule()
                    .frame(height: 10)
                    .foregroundStyle(.secondary)
                    .opacity(0.4)
                
                Spacer()
                
            }
            .padding(.top, 10)
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.offWhite)
                .padding(.horizontal, 15)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
        )
        .shimmering()
    }
}

#Preview {
    ShimmerCardsList()
}
