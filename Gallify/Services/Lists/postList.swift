//
//  postPLaylist.swift
//  Gallify
//
//  Created by Tejvir Mann on 1/17/22.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

extension FirestoreQuery {
    
    /*
     Adds art to playlist/collection. can't add multiple of the same art id.
     */
    func addArtToPlaylist(art_id: String, playlist_id: String) async {
                                            
        do {
            
            let doc = try await FirestoreQuery.db.collection("playlists").document(playlist_id).updateData([
                "art": FieldValue.arrayUnion([art_id])
                ])
        }
        catch{
            print("Error")
        }
    }
    
    func addPlaylistToLibrary(){
        
    }
    
    
    
    
}
