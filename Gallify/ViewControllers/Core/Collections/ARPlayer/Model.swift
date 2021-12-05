//
//  Model.swift
//  Gallify
//
//  Created by Tejvir Mann on 12/5/21.
//

import SwiftUI
import RealityKit
import Combine

enum ModelCategory: CaseIterable{
    case table
    case chair
    case decor
    
    var label: String{
        get {
            switch self{
            case .table:
                return "Tables"
            case .chair:
                return "Chairs"
            case .decor:
                return "Decor"
            }
        }
    }
}

class Model {
    var name: String
    var category: ModelCategory
    var thumbnail: UIImage
    var modelEntity: ModelEntity?
    var scaleCompensation: Float
    
    init(name: String, category: ModelCategory, scaleCompensation: Float = 1.0){
        self.name = name
        self.category = category
        self.thumbnail = UIImage(named: name) ?? UIImage(systemName: "photo")!
        self.scaleCompensation = scaleCompensation
    }
    
    //Todo: Create a method to async load model Entity
}

//you may want a more elegant solution
struct Models{
    var all: [Model] = []
    
    init(){
        //tables
        let cake = Model(name: "cake", category: .table, scaleCompensation: 0.32/100)
        let gangster = Model(name: "gangster", category: .table, scaleCompensation: 0.32/100)
        let astro = Model(name: "astro", category: .table, scaleCompensation: 0.32/100)
        let nike = Model(name: "nike", category: .table, scaleCompensation: 0.32/100)
        let pegasus = Model(name: "pegasus", category: .table, scaleCompensation: 0.32/100)
        
        self.all += [cake, gangster, astro, nike, pegasus]
        
        let cake2 = Model(name: "cake", category: .chair, scaleCompensation: 0.32/100)
        let gangster2 = Model(name: "gangster", category: .chair, scaleCompensation: 0.32/100)
        let astro2 = Model(name: "astro", category: .chair, scaleCompensation: 0.32/100)
        let nike2 = Model(name: "nike", category: .chair, scaleCompensation: 0.32/100)
        let pegasus2 = Model(name: "pegasus", category: .chair, scaleCompensation: 0.32/100)
        
        self.all += [cake2, gangster2, astro2, nike2, pegasus2]
    
        let cake3 = Model(name: "cake", category: .decor, scaleCompensation: 0.32/100)
        let gangster3 = Model(name: "gangster", category: .decor, scaleCompensation: 0.32/100)
        let astro3 = Model(name: "astro", category: .decor, scaleCompensation: 0.32/100)
        let nike3 = Model(name: "nike", category: .decor, scaleCompensation: 0.32/100)
        let pegasus3 = Model(name: "pegasus", category: .decor, scaleCompensation: 0.32/100)
        
        self.all += [cake3, gangster3, astro3, nike3, pegasus3]
       
    }
    
    func get(category: ModelCategory) -> [Model]{
        return all.filter({$0.category==category})
    }
    
}
