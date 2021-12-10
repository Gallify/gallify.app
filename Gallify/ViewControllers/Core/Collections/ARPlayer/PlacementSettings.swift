//
//  PlacementSettings.swift
//  Gallify
//
//  Created by Tejvir Mann on 12/5/21.
//

import SwiftUI
import RealityKit
import Combine

class PlacementSettings: ObservableObject {
    
    //when the user selects a model in BrowseView, this property is set.
    @Published var selectedModel: Model? {
        willSet(newValue){ //to log changes to value
            print("Setting selected Model to: \(String(describing: newValue?.name))")
        }
    }
    
    // When the user Taps confirm in PlacementView, the value of selectedModel is assigned to confirmed modek.
    @Published var confirmedModel: Model? {
        willSet(newValue){
            guard let model = newValue else {
                print("Clearing confirmed Model")
                return
            }
            
            print("Setting confirmedModel to \(model.name)")
            
            self.recentlyPlaced.append(model)
            
        }
    }
    
    //This property contains a record of placed models in the scene
    @Published var recentlyPlaced: [Model] = []
    
    // This property retains the cancellable object for our SceneEvents.Update subscriber
    var sceneObserver: Cancellable?
    
}
