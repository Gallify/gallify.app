//
//  postPLaylist.swift
//  Gallify
//
//  Created by Tejvir Mann on 1/17/22.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage
import UIKit
import SwiftUI

extension FirestoreQuery {
    
    /*
     Adds art to playlist/collection. can't add multiple of the same art id.
     */
    func addArtToPlaylist(art: Art, playlist_id: String) async {
                                            
        do {
            
            print("PLAYLIST ID = ", playlist_id, "ART ID = ", art.artId)
            let doc = try await FirestoreQuery.db.collection("playlists").document(playlist_id).updateData([
                "art": FieldValue.arrayUnion([art.artId])
                ])
            
        }
        catch{
            print("Error")
        }
    }
    
    
    //adds playlist to library
    func addPlaylistToLibrary(playlist: Playlist) {

        do {
            try FirestoreQuery.db.collection("users").document((Auth.auth().currentUser?.uid)!).updateData(["Library" : FieldValue.arrayUnion([playlist.playlist_id])])
        } catch {
            print("Error adding playlist to library")
        }
        self.userLibrary.append(playlist)
        
    }
    
    /*
        Creates new empty playlist
        calls addPlaylistToLibrary
     */
    func create_playlist(name: String, privacy: Int, type: String) {
        
        let newPlaylist = Playlist(newName: name, pri: privacy, type: type)
    
        let docRef = try! Firestore.firestore().collection("playlists").document()
        newPlaylist.playlist_id = docRef.documentID
        do {
          try docRef.setData(from: newPlaylist)
        } catch {
            print("Error creating new playlist in postList")
        }
        
        //update library with new playlist
        addPlaylistToLibrary(playlist: newPlaylist)
        
    }
    
    /*
        Add art to art collection
        */
    func addArtToArtCollection(art: Art, playlistId: String, img: String) async {
           print("IMG URL IN ADD TO ART COLLECTION = ", img)
           do {
               
               let doc = try FirestoreQuery.db.collection("art").document()
               art.artId = doc.documentID
               art.thumbnail = img
               print("NEW ART THUMBNAIL = ", art.thumbnail)
               try doc.setData(from: art)
               await addArtToPlaylist(art: art, playlist_id: playlistId)
           }
           catch{
               print("Error uploading art image")
           }
       }
    
    func uploadArtImage(image: Data, playlist: Playlist) async {
        let uploadRef = Storage.storage().reference(withPath: "Art/" + (Auth.auth().currentUser?.email)! + "/" + "images/" + UUID().uuidString)
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpeg"
        var imgUrl = ""
        await uploadRef.putData(image, metadata: metaData) {
            (StorageMetadata, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            uploadRef.downloadURL { (url, error) in
                if let error = error {
                   // Handle any errors
                    print("ERROR DOWNLOADING IMAGE URL")
                 } else {
                     Task {
                         var new_art = Art()
                         await self.addArtToArtCollection(art: new_art, playlistId: playlist.playlist_id, img: url!.absoluteString)//had to create a new instance of Firestore Query because environment object wasn't being accepted, not sure if this is right
                     }
                 }
            }
        }
       
    }
}
