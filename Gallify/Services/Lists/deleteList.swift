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
//            for art in playlistArt {
//                playlist.art.append(art.artId)
//            }
//            for pl in userLibrary {
//                if pl.name == playlist.name {
//                    pl.playlist_id = playlist.playlist_id
//                }
//            }
            //}
            
            for art in playlist.art {
                print("art in playlistArt after deleting \(art_id) ", art)
            }

//
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
                pl.playlist_id == playlist_id
            }
        }
        catch{
            print("Error delete playlist from user library")
        }
    }
    
    
}
