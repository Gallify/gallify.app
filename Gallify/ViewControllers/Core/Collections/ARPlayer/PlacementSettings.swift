//
//  PlacementSettings.swift
//  Gallify
//
//  Created by Sourish Kundu on 2/12/22.
//

import SwiftUI
import RealityKit
import Combine

class PlacementSettings: ObservableObject {
    
    // When the user selects a model in ContentView, this property is set
    @Published var selectedModel: Model? {
        willSet(newValue) {
            print("Setting selectedModel to \(String(describing: newValue?.art.name))")
        }
    }
    
    // When the user taps confirm in PlacementView, the value of selectedModel is assigned to confirmedModel
    @Published var confirmedModel: Model? {
        willSet(newValue) {
            guard let model = newValue else {
                print("Clearing confirmedModel")
                return
            }
            
            print("Setting confirmedModel to \(model.art.name)")
        }
    }
    
    // This property retains the cancellable object for our SceneEvents.Update subscriber
    var sceneObserver: Cancellable?
}
