//
//  ARViewModel.swift
//  Reale
//
//  Created by Sahil Srivastava on 5/26/22.
//

import Foundation
import RealityKit
import Combine
import SwiftUI

class ARViewModel: ObservableObject {
    
    @AppStorage("ARViewModel.sceneUnderstanding") var sceneUnderstanding: Bool = true
    
    @Published private(set)var selectedModel: ARModel?
    @Published private(set)var placedModel: ARModel?
    @Published var models: [ARModel]
    @Published var pauseAR = false
    
    init() {
         self.models = [ARModel(name: "chair_swan"), ARModel(name: "toy_robot_vintage"), ARModel(name: "elephant"), ARVideoModel(name: "testt"), ARModel(name: "toy_biplane"), ARModel(name: "toy_car"), ARModel(name: "toy_drummer")]
        
    }
    
//    func loadModels(models: [Model]) {
//        self.models = models
//    }
    
    func select(model: ARModel) {
        selectedModel = model
    }
    
    func place(model: ARModel) {
        placedModel = model
    }
    
    func clearSelected() {
        selectedModel = nil
    }
    
    func clearPlace() {
        placedModel = nil
    }
}
