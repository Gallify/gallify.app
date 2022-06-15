//
//  updatePlaylist.swift
//  Gallify
//
//  Created by Tejvir Mann on 1/17/22.
//
import Foundation
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage
import SwiftUI

extension FirestoreQuery {
    
    /*
     updates the playlist/collection.
     */
    func updateArtPlaylist(playlist_id: String, art_array: [Art]) async {
                                            
        do {
            
            //get updated art_id array based on art_array
            var new_art_ids = [String]()
           
            for art_element in art_array{
                print(art_element.artId)
                new_art_ids.append(art_element.artId)
            }
            
            let doc = try await FirestoreQuery.db.collection("playlists").document(playlist_id).updateData([
                "art": new_art_ids
                ])
        }
        catch{
            print("Error")
        }
        
        
    }
    
    func updatePlaylistImage(image: Data, uid: String) async {

        let uploadRef = Storage.storage().reference(withPath: "playlistImages/" + uid)

        //let uploadRef = Storage.storage().reference(withPath: "playlistImages/" + (Auth.auth().currentUser?.uid)!)

        let metaData = StorageMetadata()
        metaData.contentType = "image/jpeg"
        
        await uploadRef.putData(image, metadata: metaData) {
            (StorageMetadata, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            uploadRef.downloadURL {
                (url, error) in
                //Save to image url in firestore.
                let db = Firestore.firestore()
                let docRef = db.collection("playlists").document(uid)
                docRef.updateData([
                    "coverArtUrl" : url?.absoluteString
                ]){  err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    } else {
                        print("Document successfully updated with image url \(url)")
                    }
                }

            }
        }
    }
    
    /*
     This method updates the privacy of a playlist or collection.
     */
    func updatePlaylistPrivacy(playlist_id: String) async {
        do {
            
            if(playlist.privacy == 0){
                let doc = try await FirestoreQuery.db.collection("playlists").document(playlist_id).updateData([
                    "privacy": 1
                ]) { err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    } else {
                        print("Document successfully updated")
                    }
                }
                self.playlist.privacy = 1
            }
            else{
                let doc = try await FirestoreQuery.db.collection("playlists").document(playlist_id).updateData([
                    "privacy": 0
                ]) { err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    } else {
                        print("Document successfully updated")
                    }
                }
                self.playlist.privacy = 0
            }
   
            
           
        }
        catch{
            print("Error making playlist/collection public/private")
        }
    }
    
    /*
     This method updates the playlist or collection type
     */
    func updatePlaylistType(newType: String) async {
        do {
            
            if(newType == "Gallify Collection"){
                if(allArtYours()){
                    if(playlist.playlistType != "Gallify Collection"){
                        let doc = try await FirestoreQuery.db.collection("playlists").document(self.playlist.playlistId).updateData([
                            "playlistType": "Gallify Collection"
                        ]) { err in
                            if let err = err {
                                print("Error updating document: \(err)")
                            } else {
                                print("Document successfully updated")
                            }
                        }
                        DispatchQueue.main.async {
                            self.playlist.playlistType = "Gallify Collection"
                        }
                        
                    }
                    
                }
            }
            else{
                let doc = try await FirestoreQuery.db.collection("playlists").document(self.playlist.playlistId).updateData([
                    "playlistType": "Playlist"
                ]) { err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    } else {
                        print("Document successfully updated")
                    }
                }
                DispatchQueue.main.async {
                    self.playlist.playlistType = "Playlist"
                }
                
            }
   
            
           
        }
        catch{
            print("Error making playlist/collection public/private")
        }
    }
    
    /*
     This method updates the playlist or collection type. Helper method for updatePlaylistType()
     */
    func allArtYours() -> Bool {
        //checks the selected playlist
        
        for art in self.playlistArt{
            if(data.uid != art.creatorId || data.uid != art.ownerId ){
                return false
            }
        }
       
        return true
    }
    
    //add new given playlist to given museum
    func updateMuseum(playlist: Playlist, museum: String) {
        let museumDocRef = FirestoreQuery.db.collection("museums").whereField("name", isEqualTo: museum).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting document: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    document.reference.updateData(["playlist" : FieldValue.arrayUnion([playlist.id])])
                }
            }
        }
    }
    
    
}
