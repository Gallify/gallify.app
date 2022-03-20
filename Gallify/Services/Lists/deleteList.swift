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
    @MainActor
    func deleteArtFromPlaylist(art_id: String, playlist: Playlist) async {
                                    
        do {
            print("PLAYLIST ID RECEIVED IN DELETE = ", playlist.playlist_id)
            print("ART ID RECEIVED IN DELETE = ", art_id)
            
            let doc = try await FirestoreQuery.db.collection("playlists").document(playlist.playlist_id).updateData([
                "art": FieldValue.arrayRemove([art_id])
            ])
            
            //DispatchQueue.main.async {
                playlistArt.removeAll { art in
                    art.artId == art_id
                }

//
        }
        catch{
            print("Error")
        }
    }
    
    func deletePlaylistFromLibrary(playlist_id: String) async {
        do {
   
            let doc = try await FirestoreQuery.db.collection("users").document((Auth.auth().currentUser?.uid)!).updateData(
                ["Library" : FieldValue.arrayRemove([playlist_id])]
            )
            userLibrary.removeAll { pl in
                pl.playlist_id == playlist_id
            }
        }
        catch{
            print("Error delete playlist from user library")
        }
    }
    
    
}
