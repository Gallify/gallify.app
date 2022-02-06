//
//  deletePlaylist.swift
//  Gallify
//
//  Created by Tejvir Mann on 1/17/22.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

extension FirestoreQuery {
    
    /*
     updates the playlist
     */
    func deleteArtFromPlaylist(art_id: String, playlist_id: String) async {
                                    
        do {
            
            let doc = try await FirestoreQuery.db.collection("playlists").document(playlist_id).updateData([
                "art": FieldValue.arrayRemove([art_id])
                ])
        }
        catch{
            print("Error")
        }
    }
    
    
}
