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

class Model: ObservableObject, Identifiable {
    
    var id: String = UUID().uuidString
    var name: String
    var category: ModelCategory
    @Published var thumbnail: UIImage
    var modelEntity: ModelEntity?
    var scaleCompensation: Float
    
    private var cancellable: AnyCancellable?
    
    init(name: String, category: ModelCategory, scaleCompensation: Float = 1.0){
        self.name = name
        self.category = category
        self.thumbnail = UIImage(systemName: "photo")!
        self.scaleCompensation = scaleCompensation
        
        FirebaseStorageHelper.asyncDownloadToFilesystem(relativePath: "thumbnail/\(self.name).png") { localUrl in
            do {
                let imageData = try Data(contentsOf: localUrl)
                self.thumbnail = UIImage(data: imageData) ?? self.thumbnail
            } catch {
                print("Error loading image: \(error.localizedDescription)")
            }
        }
    }
    
    //Create a method to async load model Entity
    func asyncLoadModelEntity(handler: @escaping (_ completed: Bool, _ error: Error?) -> Void){
        FirebaseStorageHelper.asyncDownloadToFilesystem(relativePath: "models/\(self.name).usdz") { localUrl in
            self.cancellable = ModelEntity.loadModelAsync(contentsOf: localUrl)
                .sink(receiveCompletion: {loadCompletion in
                    
                    switch loadCompletion {
                    case .failure(let error): print("Unable to load modelEntityfor \(self.name). Error: \(error.localizedDescription)")
                        handler(false, error)
                    case .finished:
                        break
                    }
                        
                }, receiveValue: { modelEntity in
                    
                    self.modelEntity = modelEntity
                    self.modelEntity?.scale *= self.scaleCompensation //scale?
                    
                    handler(true, nil)
                    
                    print("modelEntity for \(self.name) has been loaded.")
                    
                })
            }
        }
}

