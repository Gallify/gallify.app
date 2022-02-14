//
//  PlacementSettings.swift
//  Gallify
//
//  Created by Tejvir Mann on 12/5/21.
//

import SwiftUI
import RealityKit
import Combine
import ARKit

struct ModelAnchor {
    var model: Model
    var anchor: ARAnchor?
}

class PlacementSettings: ObservableObject {
    
    //when the user selects a model in BrowseView, this property is set.
    @Published var selectedModel: Model? {
        willSet(newValue){ //to log changes to value
            print("Setting selected Model to: \(String(describing: newValue?.name))")
        }
    }
    

    
    //This property contains a record of placed models in the scene
    @Published var recentlyPlaced: [Model] = []
    
    var modelsConfirmedForPlacement: [ModelAnchor] = []
    
    
    // This property retains the cancellable object for our SceneEvents.Update subscriber
    var sceneObserver: Cancellable?
    
}
