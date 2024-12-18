//
//  CapsuleShimmer.swift
//  High Stakes
//
//  Created by Rehan Parwani on 12/16/24.
//

import SwiftUI

struct CapsuleShimmer: View {
    let width: CGFloat
    let height: CGFloat
    let opacity: Double
    var body: some View {
        Capsule()
            .frame(width: width, height: height)
            .foregroundStyle(Color.secondary)
            .opacity(opacity)
    }
}
