//
//  ModelDeletionManager.swift
//
//  Created by Sourish on 12/12/21.
//

import SwiftUI
import RealityKit

class ModelDeletionManager: ObservableObject {
    @Published var entitySelectedForDeletion: ModelEntity? = nil {
        willSet(newValue) {
            // Clearing entitySelectedForDeletion
            
            if self.entitySelectedForDeletion == nil, let newlySelectedModelEntity = newValue {
                // Selecting new entitySelectedForDeletion, no prior selection
                print("Selecting new entitySelectedForDeletion, no prior selection")
                
                // Highlight newlySelectedModelEntity
                let component = ModelDebugOptionsComponent(visualizationMode: .lightingDiffuse)
                newlySelectedModelEntity.modelDebugOptions = component
            } else if let previouslySelectedModelEntity = self.entitySelectedForDeletion, let newlySelectedModelEntity = newValue {
                // Selecting new entitySelectedForDeletion, had a prior selection
                print("Selecting new entitySelectedForDeletion, had a prior selection")
                
                // Un-highlight previouslySelectedModelEntity
                previouslySelectedModelEntity.modelDebugOptions = nil
                
                // Highlight newlySelectedModelEntity
                let component = ModelDebugOptionsComponent(visualizationMode: .lightingDiffuse)
                newlySelectedModelEntity.modelDebugOptions = component
            } else if newValue == nil {
                // Clearing entitySelectedForDeletion
                print("Clearing entitySelectedForDeletion")
                
                self.entitySelectedForDeletion?.modelDebugOptions = nil
            }
        }
    }
}
