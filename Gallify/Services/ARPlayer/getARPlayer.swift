//
//  getARPlayer.swift
//  Gallify
//
//  Created by Tejvir Mann on 2/17/22.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
import SDWebImageSwiftUI

extension FirestoreQuery {
    
    /*
     This methods fethches the data models and metadata from firebase.
     */
    func fetchModelData() async {
        
        //call firebase here.
        
        for art in self.artworkThatsPlaying {
            
            var model: Model
            
            model =  Model(artwork: art)
            
            //dispatchGroup.enter, .leave. notify after for loop. for await?
            
            self.models.append(model)
            
//            model.asyncLoadModelEntity { completed, error in
//                if completed {
//                    //select model for placement
//                    self.models.append(model)
//                    model.contentLoaded = true
//                }
//            }
        }
    }
    
    /*
     This methods sets the data for models from selected playlist
     */
    func setModelData() {
        
        //call firebase here.
        
        for art in self.artworkThatsPlaying {
            
            var model: Model
            
            model = Model(artwork: art)
            
            self.models.append(model)
            
        }
    }
    
    /*
     This method gets the 3d model for a single piece of art. 
     */
    func getModel(model: Model) {
        
        //call firebase here.
        
        model.asyncLoadModelEntity { completed, error in
            if completed {
                //select model for placement
                self.models.append(model)
                model.contentLoaded = true
            }
        }
    }
    
    
    func clearModels() {
        self.clearModelEntitiesFromMemory()
        self.models = []
    }
    
    func clearModelEntitiesFromMemory() {
        for model in models {
            model.modelEntity = nil
        }
    }
        
//    func asyncDownloadToFilesystem(relativePath: String, handler: @escaping (_ fileURL: URL) -> Void) {
//        let docsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//        let fileUrl = docsUrl.appendingPathComponent(relativePath)
//
//        if FileManager.default.fileExists(atPath: fileUrl.path) {
//            handler(fileUrl)
//            return
//        }
//
//        let storageRef = FirestoreQuery.cloudStorage.reference(withPath: relativePath)
//
//        storageRef.write(toFile: fileUrl) { url, error in
//            guard let localUrl = url else {
//                print("Firebase Storage: Error downloading file: \(relativePath)")
//                return
//            }
//            handler(localUrl)
//        }.resume()
//    }
    
    
    
}
