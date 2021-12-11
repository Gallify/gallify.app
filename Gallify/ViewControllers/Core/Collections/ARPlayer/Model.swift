//
//  Model.swift
//  Gallify
//
//  Created by Tejvir Mann on 12/5/21.
//

import SwiftUI
import RealityKit
import Combine

enum ModelCategory: String, CaseIterable{
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

class Model: Identifiable {
    
    var id: String = UUID().uuidString
    var name: String
    var category: ModelCategory
    var thumbnail: UIImage
    var modelEntity: ModelEntity?
    var scaleCompensation: Float
    
    private var cancellable: AnyCancellable?
    
    init(name: String, category: ModelCategory, scaleCompensation: Float = 1.0){
        self.name = name
        self.category = category
        self.thumbnail = UIImage(named: name) ?? UIImage(systemName: "photo")!
        self.scaleCompensation = scaleCompensation
    }
    
    //Create a method to async load model Entity
    func asyncLoadModelEntity(){
        let filename = self.name + ".usdz" //how about .reality.
        
        self.cancellable = ModelEntity.loadModelAsync(named: filename)
            .sink(receiveCompletion: {loadCompletion in
                
                switch loadCompletion {
                case .failure(let error): print("Unable to load modelEntityfor \(filename). Error: \(error.localizedDescription)")
                case .finished:
                    break
                }
                    
            }, receiveValue: { modelEntity in
                
                self.modelEntity = modelEntity
                self.modelEntity?.scale *= self.scaleCompensation //scale? 
                
                print("modelEntity for \(self.name) has been loaded.")
                
            })
        }
}

