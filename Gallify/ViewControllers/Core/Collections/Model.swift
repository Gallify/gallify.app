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

class Model: Encodable, Decodable {
    
    enum CodingKeys: CodingKey {
        case art
        //case scale compensation
        //case transforms array.
        case modelEntity
        case modelAnchor
        case contentLoaded
        
    }
    
    @Published var art : Art
    @Published var modelURL : URL?
    @Published var modelEntity: ModelEntity?
    @Published var modelAnchor: ARAnchor?
    @Published var contentLoaded: Bool
    @Published var isLoading: Bool?
    private var cancellable: AnyCancellable?
    
    init(artwork: Art) {
        art = artwork
        contentLoaded = false
        isLoading = false
        
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        art = try container.decode(Art.self, forKey: .art)
        contentLoaded = try container.decode(Bool.self, forKey: .contentLoaded)
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(art, forKey: .art)
        //try container.encode(contentLoaded, forKey: .contentLoaded)
    }
    
    //Create a method to async load model Entity
    func asyncLoadModelEntity(handler: @escaping (_ completed: Bool, _ error: Error?) -> Void){
        if(self.art.contentType == 1 && self.contentLoaded==false){
            FirebaseStorageHelper.asyncDownloadToFilesystem(relativePath: "models/\(self.art.storageName)") { localUrl in
                print("LOCAL URL")
                print(localUrl)
                self.isLoading = true
                self.cancellable = ModelEntity.loadModelAsync(contentsOf: localUrl)
                    .sink(receiveCompletion: { loadCompletion in
                        
                        switch loadCompletion {
                        case .failure(let error): print("Unable to load modelEntityfor \(self.art.name). Error: \(error.localizedDescription)")
                            handler(false, error)
                        case .finished:
                            break
                        }
                            
                    }, receiveValue: { modelEntity in
                        
                        self.modelURL = localUrl
                        print("MODEL URL L")
                        print(self.modelURL)
                        self.modelEntity = modelEntity
                       // self.modelEntity?.scale *= self.scaleCompensation //scale?
                        
                        handler(true, nil)
                        
                       
                        print("modelEntity for \(self.art.name) has been loaded.")
                        
                    })
            }
        }
        else{
            handler(true, nil)
        }
        
    }
    
    
    
    
    
    
    
    
 
    
    
    

}

