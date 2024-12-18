//
//  SwipableTestView.swift
//  High Stakes
//
//  Created by Rehan Parwani on 12/15/24.
//


import SwiftUI

struct SwipeableView: View {
//    @State private var cardStack: [String] = ["Jayson Tatum Test", "CurryTestImage", "Kyrie Irving Test Image", "Lebron James Image", "Shai Test Image"]
    @State private var dragOffset: CGSize = .zero
    @State private var topCardIndex: Int = 0
    
    @ObservedObject var eventsPropsViewModel: EventsPropViewModel
    var body: some View {
        VStack {
            
            if eventsPropsViewModel.isLoadingProps {
                IndividualPropShimmer()
            } else {
                ZStack {
                    if topCardIndex == eventsPropsViewModel.props.count {
                        if eventsPropsViewModel.props.count == 0 {
                            VStack {
                                Image(systemName: "camera.metering.none")
                                    .foregroundStyle(Color("CubePalette"))
                                    .bold()
                                    .imageScale(.large)
                                    .padding(30)
                                    .popNeumorphicBackground()
                                Text("Props have not been set yet.\nCome back soon!")
                                    .font(.title3)
                                    .bold()
                                    .foregroundStyle(Color("CubePalette"))
                                    .multilineTextAlignment(.center)
                                    .padding(.top, 5)
                            }
                        } else {
                            VStack {
                                Image(systemName: "checkmark")
                                    .foregroundStyle(Color("CubePalette"))
                                    .bold()
                                    .imageScale(.large)
                                    .padding(30)
                                    .popNeumorphicBackground()
                                Text("All props have been\ncompleted")
                                    .font(.title3)
                                    .bold()
                                    .foregroundStyle(Color("CubePalette"))
                                    .multilineTextAlignment(.center)
                                    .padding(.top, 5)
                            }
                        }
                    } else {
                        ForEach(eventsPropsViewModel.props.indices.reversed(), id: \.self) { index in
                            let royaleProp = eventsPropsViewModel.props[index]
                            if index >= topCardIndex {
                                VStack {
                                    if topCardIndex == index {
                                        Text("\(royaleProp.propName.title)")
                                            .foregroundStyle(Color.cubeGreen)
                                            .font(.title)
                                            .bold()
                                    }
                                    IndividualProp(imageName: "", royaleProp: royaleProp)
                                        .offset(index == topCardIndex ? dragOffset : .zero)
                                        .scaleEffect(index == topCardIndex ? 1.0 : 0.9)
                                        .rotationEffect(index == topCardIndex ? Angle(degrees: Double(-dragOffset.width / 30)) : .zero)
                                        .gesture(
                                            DragGesture()
                                                .onChanged { gesture in
                                                    if index == topCardIndex {
                                                        dragOffset = gesture.translation
                                                    }
                                                }
                                                .onEnded { gesture in
                                                    if index == topCardIndex {
                                                        handleSwipe(gesture: gesture)
                                                    }
                                                }
                                        )
                                        .animation(.spring(), value: dragOffset)
                                }
                            }
                        }
                    }
                }
                .padding()
            }
            
        }
    }

    private func handleSwipe(gesture: DragGesture.Value) {
        let horizontalSwipeThreshold: CGFloat = 150
        let verticalSwipeThreshold: CGFloat = 100

        let horizontalTranslation = gesture.translation.width
        let verticalTranslation = gesture.translation.height

        let isHorizontalSwipe = abs(horizontalTranslation) > abs(verticalTranslation)

        if isHorizontalSwipe && abs(horizontalTranslation) > horizontalSwipeThreshold {
            handleHorizontalSwipe(direction: horizontalTranslation > 0 ? "right" : "left")
        } else if !isHorizontalSwipe && abs(verticalTranslation) > verticalSwipeThreshold {
            handleVerticalSwipe(direction: verticalTranslation < 0 ? "up" : "down")
        } else {
            withAnimation {
                dragOffset = .zero // Reset if swipe isn't strong enough
            }
        }
    }

    private func handleHorizontalSwipe(direction: String) {
//        print("Swiped \(direction) on card \(cardStack[topCardIndex])")
        performHapticFeedback()
//        withAnimation {
            dragOffset = direction == "right"
                ? CGSize(width: 1000, height: 0)  // Swipe right
                : CGSize(width: -1000, height: 0) // Swipe left
//        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            topCardIndex += 1
            dragOffset = .zero
        }
    }

    private func handleVerticalSwipe(direction: String) {
//        print("Swiped \(direction) on card \(cardStack[topCardIndex])")
        performHapticFeedback()

        if direction == "up" {
                withAnimation {
                    dragOffset = CGSize(width: 0, height: -1000) // Swipe up animation
                }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//                    withAnimation(.default) {
//                        let currentCard = eventsPropsViewModel.props.remove(at: topCardIndex)
//                        eventsPropsViewModel.props.append(currentCard)
                        topCardIndex += 1
                        // Reset drag offset
                        dragOffset = .zero
//                    }
                }
        } else if direction == "down" {
//            withAnimation {
                dragOffset = CGSize(width: 0, height: 1000) // Swipe down
//            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                topCardIndex = max(0, topCardIndex - 1) // Go back to previous card
                dragOffset = .zero
            }
        }
    }

    private func performHapticFeedback() {
        let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
        impactFeedback.impactOccurred()
    }
}



struct SwipeableView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeableView(eventsPropsViewModel: TestingVariables.eventPropsViewModel)
    }
}
