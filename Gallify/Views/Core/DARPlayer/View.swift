//
//  View.swift
//  Reale
//
//  Created by Sahil Srivastava on 5/26/22.
//

import Foundation
import SwiftUI

extension View {
    
    /// Adjusts object proportions based off screen resolution
    /// - Parameter input: based on iPhone 11 Pro screen
    /// - Parameter scaling: set vertical if we scale based on height, horizontal if we scale based on width
    /// - Returns: Adjusted proportions for any screen (based on v param)
    public func magik(_ input: CGFloat, _ scaling: MagikScaling = .horizontal) -> CGFloat {
        // Check scaling type
        switch scaling {
        case .horizontal:
            let width = UIScreen.main.bounds.width
            let keyWidth: CGFloat = 375.0 // iPhone 11 Pro width pt
            let x: CGFloat = input / keyWidth
            return width * x
        case .vertical:
            let height = UIScreen.main.bounds.height
            let keyHeight: CGFloat = 812.0 // iPhone 11 Pro height pt
            let y: CGFloat = input / keyHeight
            return height * y
        }
    }
}

public enum MagikScaling {
    case horizontal
    case vertical
}


struct LoadingIcon: View {
    // Loading anim
    @State var rotating = false
    @State var pullIn = false
    @State var extendOut = false
    
    var body: some View {
        Circle()
            .trim(from: pullIn ? 0.4 : 0.3, to: extendOut ? 0.6 : 1)
            .stroke(Color(red: 1, green: 1, blue: 1), lineWidth: magik(3))
            .frame(width: magik(25), height: magik(25))
            .rotationEffect(.degrees(rotating ? 360 : 0))
            .onDisappear() {
                self.rotating = false
                self.pullIn = false
                self.extendOut = false
            }
            .onAppear() {
                withAnimation(Animation.linear(duration: 1.0).repeatForever(autoreverses: false)) {
                    self.rotating = true
                }
                withAnimation(Animation.linear(duration: 0.9).delay(0.05).repeatForever(autoreverses: true)) {
                    self.pullIn = true
                }
                withAnimation(Animation.linear(duration: 0.9).delay(0.05).repeatForever(autoreverses: true)) {
                    self.extendOut = true
                }
            }
    }
}
