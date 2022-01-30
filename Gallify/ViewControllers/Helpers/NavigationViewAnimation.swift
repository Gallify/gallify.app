//
//  NavigationViewAnimation.swift
//  Gallify
//
//  Created by Gianluca Profio on 10/23/21.
//

import Foundation
import SwiftUI

struct ThemeAnimationStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .transition(.scale)
    }
}

