//
//  deletePlaylist.swift
//  Gallify
//
//  Created by Tejvir Mann on 1/17/22.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage

extension FirestoreQuery {
    
    /*
     updates the playlist
     */
    //@MainActor
    func deleteArtFromPlaylist(art_id: String, playlist: Playlist) async {
                                    
        do {
           
            let doc = try await FirestoreQuery.db.collection("playlists").document(playlist.playlistId).updateData([
                "art": FieldValue.arrayRemove([art_id])
            ])
            
            if(playlist.name == "Liked") {
                //delete from Liked document also
                await deleteFromLikedCollection(id: art_id)
            }
            
            //DispatchQueue.main.async {
                playlistArt.removeAll { art in
                    art.artId == art_id
                }
        
        }
        catch{
            print("Error while delete art from \(playlist.name)")
        }
    }

    func deleteFromLikedCollection(id: String) async {
        FirestoreQuery.db.collection("liked").whereField("artId", isEqualTo: id).getDocuments { (snapshot, error) in
            for document in snapshot!.documents {
                let docId = document.documentID
                FirestoreQuery.db.collection("liked").document(docId).delete { err in
                        if let err = err {
                            print("Error updating document: \(err)")
                        } else {
                            print("Document successfully updated")
                        }
                }
            }
        }
    }
    
    func deletePlaylistFromLibrary(playlist_id: String) async {
        do {
   
            let doc = try await FirestoreQuery.db.collection("users").document((Auth.auth().currentUser?.uid)!).updateData(
                ["Library" : FieldValue.arrayRemove([playlist_id])]
            )
            userLibrary.removeAll { pl in
                pl.playlistId == playlist_id
            }

            
            //set local variable to ""
            playlist.coverArtUrl = ""
            
            //delete cover art url from firestore doc
            let playlistRef = FirestoreQuery.db.collection("playlists").document(playlist_id)
            try await playlistRef.updateData(["coverArtUrl" : ""])
            
            //delete cover art image from storage
            let storage = Storage.storage()
            let url = "gs://gallify-64bbb.appspot.com/playlistImages/" + playlistRef.documentID
            let storageRef = storage.reference(forURL: url)
            
            //Removes image from storage
            storageRef.delete { error in
                if let error = error {
                    print(error)
                } else {
                    // File deleted successfully
                }
            }
           

             self.data.Library.removeAll { pl in //data.library and userlibrary both need to have the proper playlist id removed.
                 pl == playlist_id
             }
            
            await self.getUserLibrary()
            
//             //assumes firestorequery.playlist is the playlist to delete
//             if(self.data.uid == self.playlist.creatorUrl){
//                 await deletePlaylistFromCollection(playlist_id: playlist_id)
//             }
            

        }
        catch{
            print("Error delete playlist from user library")
        }
    }
    
    /*
     This deletes playlist from the entire playlist collection.
     */
    func deletePlaylistFromCollection(playlist_id: String) async {
        do {
   
            let doc = try await FirestoreQuery.db.collection("playlists").document(playlist_id).delete() { err in
                if let err = err {
                    print("Error removing document: \(err)")
                } else {
                    print("Document successfully removed!")
                }
            }
            
        }
        catch{
            print("Error delete playlist from collection")
        }
    }
    
    
}
