//
//  getARPlayer.swift
//  Gallify
//
//  Created by Tejvir Mann on 2/17/22.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

extension FirestoreQuery {
    
    func fetchData() {
        
        //call firebase here.
        
        for art in self.artworkThatsPlaying {
            
           
            models.append(Model(name: "air_force"))
        }

        
        models += [
            Model(name: "air_force"),
            Model(name: "gramophone"),
            Model(name: "toy_biplane"),
            Model(name: "toy_drummer"),
            Model(name: "toy_robot_vintage"),
            Model(name: "tv_retro")
        ]
    }
    
    func clearModelEntitiesFromMemory() {
        for model in models {
            model.modelEntity = nil
        }
    }
    
    
    
}
