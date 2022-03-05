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
            
            print("PLAYLIST ID = ", playlist_id, "ART ID = ", art.art_id)
            let doc = try await FirestoreQuery.db.collection("playlists").document(playlist_id).updateData([
                "art": FieldValue.arrayUnion([art.art_id])
                ])
            self.playlistArt.append(art)
            self.art = art
        }
        catch{
            print("Error")
        }
    }
    
    
    //adds playlist to library
    func addPlaylistToLibrary(playlist: Playlist) {

        do {
            try FirestoreQuery.db.collection("users").document((Auth.auth().currentUser?.email)!).updateData(["Library" : FieldValue.arrayUnion([playlist.id])])
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
        newPlaylist.id = docRef.documentID
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
    func addArtToArtCollection(art: Art, playlistId: String) async {
                                        
           do {
               
               let doc = try FirestoreQuery.db.collection("art").document()
               art.art_id = doc.documentID
               try doc.setData(from: art)
               await addArtToPlaylist(art: art, playlist_id: playlistId)
           }
           catch{
               print("Error uploading art image")
           }
       }
    
    @MainActor
    func uploadArtImage(image: Data, playlist: Playlist) async {
        let uploadRef = Storage.storage().reference(withPath: "Art/" + (Auth.auth().currentUser?.email)! + "/" + "images/")
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpeg"
        var imgUrl = ""
        uploadRef.putData(image, metadata: metaData) {
            (StorageMetadata, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            uploadRef.downloadURL {
                (url, error) in
                imgUrl = url!.absoluteString
            }
        }
        var new_art = Art()
        new_art.thumbnail = imgUrl
        await addArtToArtCollection(art: new_art, playlistId: playlist.id)//had to create a new instance of Firestore Query because environment object wasn't being accepted, not sure if this is right
    }
}
