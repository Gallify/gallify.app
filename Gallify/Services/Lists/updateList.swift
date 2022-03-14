//
//  updatePlaylist.swift
//  Gallify
//
//  Created by Tejvir Mann on 1/17/22.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

extension FirestoreQuery {
    
    /*
     updates the playlist/collection. 
     */
    func updateArtPlaylist(playlist_id: String, art_array: [Art]) async {
                                            
        do {
            
            //get updated art_id array based on art_array
            var new_art_ids = [String]()
           
            for art_element in art_array{
                new_art_ids.append(art_element.art_id)
            }
            
            let doc = try await FirestoreQuery.db.collection("playlists").document(playlist_id).updateData([
                "art": new_art_ids
                ])
            self.playlistArt = art_array
        }
        catch{
            print("Error")
        }
    }
    
}
