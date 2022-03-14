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
            print("PLAYLIST ID RECEIVED IN DELETE = ", playlist_id)
            print("ART ID RECEIVED IN DELETE = ", art_id)
            let doc = try await FirestoreQuery.db.collection("playlists").document(playlist_id).updateData([
                "art": FieldValue.arrayRemove([art_id])
                ])
//            var i = 0
//            for art in playlistArt {
//                if (art.art_id == art_id) {
//                    playlistArt.remove(at: i)
//                }
//                i=i+1
//            }
//            playlistArt.removeAll { art in
//                art.art_id == art_id
//            }
            playlistArt = playlistArt.filter { art in
                art.art_id != art_id
            }
        }
        catch{
            print("Error")
        }
    }
    
    func deletePlaylistFromLibrary(playlist_id: String) async {
        do {
            
            let doc = try await FirestoreQuery.db.collection("users").document((Auth.auth().currentUser?.email!)!).updateData(
                ["Library" : FieldValue.arrayRemove([playlist_id])]
            )
            userLibrary.removeAll { pl in
                pl.id == playlist_id
            }
        }
        catch{
            print("Error delete playlist from user library")
        }
    }
    
    
}
