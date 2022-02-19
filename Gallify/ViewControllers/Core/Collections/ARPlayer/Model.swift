//
//  Model.swift
//  Gallify
//
//  Created by Sourish Kundu on 2/12/22.
//

import SwiftUI
import ARKit
import RealityKit
import Combine

class Model {
    var name: String
    var thumbnail: UIImage
    var modelEntity: ModelEntity?
    
    var modelAnchor: ARAnchor?
    
    private var cancellable: AnyCancellable?
    
    init(name: String) {
        self.name = name
        self.thumbnail = UIImage(named: name) ?? UIImage(systemName: "photo")!
    }
    
    // TODO: Create a method to async load modelEntity
    func asyncLoadModelEntity(handler: @escaping (_ completed: Bool, _ error: Error?) -> Void) {
        self.modelAnchor = nil
        
        let filename = self.name + ".usdz"
        
        self.cancellable = ModelEntity.loadModelAsync(named: filename)
            .sink { loadCompletion in
                switch loadCompletion {
                case .failure(let error): print("Unable to loadmodelEntity for \(filename). Error: \(error.localizedDescription)")
                    handler(false, error)
                case .finished:
                    break
                }
            } receiveValue: { modelEntity in
                self.modelEntity = modelEntity
                handler(true, nil)
                print("modelEntity for \(self.name) has been loaded.")
            }

    }
    
    func asyncLoadModelEntity_url(handler: @escaping (_ completed: Bool, _ error: Error?) -> Void) {
        self.modelAnchor = nil
        
        let filename = self.name + ".usdz"
      
       // let url = URL(string: "urlString")
        let fileUrl = NSURL(string: "https://developer.apple.com/augmented-reality/quick-look/models/drummertoy/toy_drummer.usdz")
        self.cancellable = ModelEntity.loadModelAsync(contentsOf: fileUrl! as URL)
            .sink { loadCompletion in
                switch loadCompletion {
                case .failure(let error): print("Unable to loadmodelEntity for \(filename). Error: \(error.localizedDescription)")
                    handler(false, error)
                case .finished:
                    break
                }
            } receiveValue: { modelEntity in
                self.modelEntity = modelEntity
                handler(true, nil)
                print("modelEntity for \(self.name) has been loaded.")
            }

    }
}
