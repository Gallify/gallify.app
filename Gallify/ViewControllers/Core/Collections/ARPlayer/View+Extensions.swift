//
//  View+Extensions.swift
//  Gallify
//
//  Created by Tejvir Mann on 12/10/21.
//

import SwiftUI

extension View {
    @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true: self.hidden()
        case false: self
        }
    }
}
