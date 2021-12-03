//
//  ARPlayerContainer.swift
//  Gallify
//
//  Created by Tejvir Mann on 12/3/21.
//

import Foundation
import SwiftUI
import RealityKit

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}
