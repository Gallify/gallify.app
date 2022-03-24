//
//  ModelsViewModel.swift
//  Gallify
//
//  Created by Sourish Kundu on 2/12/22.
//

import Foundation

class ModelsViewModel: ObservableObject {
    @Published var models: [Model] = []
    
    
    func fetchData() {
        
        //call firebase here.
        
//        models += [
//            Model(name: "air_force"),
//            Model(name: "gramophone"),
//            Model(name: "toy_biplane"),
//            Model(name: "toy_drummer"),
//            Model(name: "toy_robot_vintage"),
//            Model(name: "tv_retro")
//        ]
    }
    
    func clearModelEntitiesFromMemory() {
        for model in models {
            model.modelEntity = nil
        }
    }
}
