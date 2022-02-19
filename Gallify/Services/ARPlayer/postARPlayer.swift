//
//  postARPlayer.swift
//  Gallify
//
//  Created by Tejvir Mann on 2/17/22.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

extension FirestoreQuery {
    
    /*
     Add art to art collection
     */
    func addArtToArtCollection(art_id: String) async {
                                            
        do {
            
            let doc = try await FirestoreQuery.db.collection("art").document(art_id).setData(from: Art())
              
        }
        catch{
            print("Error")
        }
    }
}
