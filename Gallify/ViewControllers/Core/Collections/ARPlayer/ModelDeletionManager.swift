//
//  ModelDeletionManager.swift
//  Gallify
//
//  Created by Apple on 03/01/22.
//

import SwiftUI
import RealityKit


class ModelDeletionManager: ObservableObject{
    @Published var entitySelectedForDeletion: ModelEntity? = nil{
        willSet(newValue){
            if self.entitySelectedForDeletion == nil, let newlySelectedModelEntity = newValue{
                print("Selecting new entity for deletion. No Priors!")
                let component = ModelDebugOptionsComponent(visualizationMode: .lightingDiffuse)
                newlySelectedModelEntity.modelDebugOptions = component
            } else if let previouslySelectedModelEntity = self.entitySelectedForDeletion, let newlySelectedModelEntity = newValue {
                print("Selecting new entity for deletion. No Priors!")
                previouslySelectedModelEntity.modelDebugOptions = nil
                let component = ModelDebugOptionsComponent(visualizationMode: .lightingDiffuse)
                newlySelectedModelEntity.modelDebugOptions = component
            } else if newValue == nil {
                print("Clearing the entity")
                self.entitySelectedForDeletion?.modelDebugOptions = nil
                
            }
            
        }
    }
    
}
