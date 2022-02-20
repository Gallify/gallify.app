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
    func fetchData() {
        
        //call firebase here.
        
        for art in self.artworkThatsPlaying {

            models.append(Model(name: art.name, thumbnail_url: art.thumbnail, content_url: art.content_url)) //all the art parameters.

        }

    }
    
    func clearModelEntitiesFromMemory() {
        for model in models {
            model.modelEntity = nil
        }
    }
    
    
    
}
