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
    func addArtToPlaylist(art: Art, the_playlist: Playlist) async {
                                            
        do {
            
            print("PLAYLIST ID = ", the_playlist.playlistId, "ART ID = ", art.artId)
            let doc = try await FirestoreQuery.db.collection("playlists").document(the_playlist.playlistId).updateData([
                "art": FieldValue.arrayUnion([art.artId])
                ])
            
            
            /* Don't need this. Because the collection will always stay the same once minted. 
            //if user is creator, and adding to their own collection. Update "Collection" tab.
            if(self.data.uid == art.creatorId){
                if(the_playlist.playlistType == "Gallify Collection"){
                    let artDoc = try await FirestoreQuery.db.collection("art").document(art.artId).updateData([
                        "collection": the_playlist.playlistId])
                }
            }
            */
            
                
        }
        catch{
            print("Error")
        }
    }
    
    func checkIfalreadyLiked(art: Art) async {
        let docRef = try await FirestoreQuery.db.collection("users").document(Auth.auth().currentUser?.uid ?? "help")
            .collection("profile").whereField("liked", arrayContains: art.artId)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                    
                    DispatchQueue.main.async {
                        self.isLiked = false
                    }
                    
                } else {
                    print("Current art has already been liked by user!")
                    
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                    }
                    
                    DispatchQueue.main.async {
                        self.isLiked = true
                    }
                    
                    
                }
        }
//        return self.isLiked
        
    }
    
    func addArtToPlaylist(art: Art, playlistName: String) async {
        
        print(art)
        
        do {
            
            for p in userLibrary {
                if p.name == playlistName {
                    try await FirestoreQuery.db.collection("playlists").document(p.playlistId).updateData([
                        "art" : FieldValue.arrayUnion([art.artId])
                    ])
                    //add to liked_art subcollection
                    if(p.name == "Liked") {                         try await FirestoreQuery.db.collection("users").document(Auth.auth().currentUser?.uid ?? "help")
                            .collection("profile")
                            .document("liked_art")
                            .updateData(["liked" : FieldValue.arrayUnion([art.artId])])
                    }
                }
            }
            
            //reload library
            self.likedArt.append(art)
            
            
        } catch {
            print("Error adding art to Liked PLaylist in user library")
        }
    }
    
    
    //adds playlist to library
    func addPlaylistToLibrary(playlist: Playlist) {

        do {
            try FirestoreQuery.db.collection("users").document((Auth.auth().currentUser?.uid)!).updateData(["Library" : FieldValue.arrayUnion([playlist.playlistId])])
        } catch {
            print("Error adding playlist to library")
        }
        self.userLibrary.append(playlist)
        
    }
    
    /*
        Creates new empty playlist
        calls addPlaylistToLibrary
     */
    func create_playlist(name: String, privacy: Int, type: String) async -> String  {
        
        let time = timeNow()
        print(time)
        
        
        let newPlaylist = Playlist(newName: name, pri: privacy, type: type, the_creator: self.data)
    
        let docRef = try! await Firestore.firestore().collection("playlists").document()
        newPlaylist.playlistId = docRef.documentID

        newPlaylist.creatorUrl = self.data.uid
        newPlaylist.creatorRef = self.data.uid
        newPlaylist.createdDate = time
        newPlaylist.modifiedDate = time

        do {
          try await docRef.setData(from: newPlaylist)
        } catch {
            print("Error creating new playlist in postList")
        }
        
        //update library with new playlist
        addPlaylistToLibrary(playlist: newPlaylist)
        
        return docRef.documentID
    }
    
    
    func createLikedDocument(art: Art) async {
        let docRef = FirestoreQuery.db.collection("liked").document(art.artId)
        var liked = Liked()
        liked.artId = art.artId
        liked.userId = Auth.auth().currentUser?.uid ?? ""
        let date = Date.now
        liked.time =  timeNow()
        do {
            try await docRef.setData(from: liked)
        } catch {
            print("Error creating document for liked art \(error.localizedDescription)")
        }
        
        //increase likes counter by 1 in firestore doc
        var prevLikes = art.likes
        do {
            let artDoc = try await FirestoreQuery.db.collection("art").document(art.artId)
                .updateData([
                    "likes" : prevLikes + 1
                ])
        } catch {
            print("Couldn't increase likes for art");
        }
        
        //update likes locally
        self.artThatsPlaying.likes = self.artThatsPlaying.likes + 1
        
    }
    /**
        Reduces art likes by 1
     */
    func unlikeArt(art: Art) async {
        var prevLikes = art.likes
        do {
            let artDoc = try await FirestoreQuery.db.collection("art").document(art.artId)
                .updateData([
                    "likes" : prevLikes - 1
                ])
        } catch {
            print("Couldn't increase likes for art");
        }
        
        //update likes locally
        self.artThatsPlaying.likes = self.artThatsPlaying.likes - 1
    }
   
    
    /*
    /*
        Add art to art collection
        */
    func addArtToArtCollection(art: Art, playlistId: String, img: String) async {
           print("IMG URL IN ADD TO ART COLLECTION = ", img)
           do {
               
               let doc = try FirestoreQuery.db.collection("art").document()
               art.artId = doc.documentID
               art.thumbnailUrl = img
               print("NEW ART THUMBNAIL = ", art.thumbnailUrl)
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
                         await self.addArtToArtCollection(art: new_art, playlistId: playlist.playlistId, img: url!.absoluteString)//had to create a new instance of Firestore Query because environment object wasn't being accepted, not sure if this is right
                     }
                 }
            }
        }
       
    }
     */
}
