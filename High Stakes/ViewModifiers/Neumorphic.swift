//
//  Neumorphic.swift
//  High Stakes
//
//  Created by Rehan Parwani on 12/15/24.
//

import SwiftUI

struct NeumorphicBackgroundModifier: ViewModifier {
    var cornerRadius: CGFloat
    var displayBackground: Bool

    func body(content: Content) -> some View {
        if displayBackground {
            content
                .background(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(Color.offWhite) // Use a custom or system-defined color
                        .overlay(
                            RoundedRectangle(cornerRadius: cornerRadius)
                                .stroke(Color.gray, lineWidth: 4)
                                .blur(radius: 4)
                                .offset(x: 2, y: 2)
                                .mask(
                                    RoundedRectangle(cornerRadius: cornerRadius)
                                        .fill(
                                            LinearGradient(
                                                gradient: Gradient(colors: [Color.black, Color.clear]),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            )
                                        )
                                )
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: cornerRadius)
                                .stroke(Color.white, lineWidth: 8)
                                .blur(radius: 4)
                                .offset(x: -2, y: -2)
                                .mask(
                                    RoundedRectangle(cornerRadius: cornerRadius)
                                        .fill(
                                            LinearGradient(
                                                gradient: Gradient(colors: [Color.clear, Color.black]),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            )
                                        )
                                )
                        )
                )
        } else {
            content
        }
    }
}

enum Shapes {
    case rectangle
    case circle
}

struct PopOutNeumorphicBackground: ViewModifier {
    var displayBackground: Bool
    var shape: Shapes = Shapes.circle
    

    func body(content: Content) -> some View {
        if displayBackground {
            content
                .background(
                    getShape()
                        .fill(Color.offWhite)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                )
        } else {
            content
        }
    }
    
    func getShape() -> AnyShape {
        switch shape {
        case .circle:
            return AnyShape(Circle())
        case .rectangle:
            return AnyShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

extension View {
    func neumorphicBackground(cornerRadius: CGFloat = 10, displayBackground: Bool = true) -> some View {
        self.modifier(NeumorphicBackgroundModifier(cornerRadius: cornerRadius, displayBackground: displayBackground))
    }
    
    func popNeumorphicBackground(displayBackground: Bool = true) -> some View {
        self.modifier(PopOutNeumorphicBackground(displayBackground: displayBackground))
    }
    
    func popNeumorphicBackground(displayBackground: Bool = true, shape: Shapes) -> some View {
        self.modifier(PopOutNeumorphicBackground(displayBackground: displayBackground, shape: shape))
    }
}
