//
//  FirestoreSubcollectionService.swift
//  Gallify
//
//  Created by Shruti Sharma on 12/26/21.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class FirestoreSubcollectionsServices : ObservableObject {
    
    let db = Firestore.firestore()
    let currentUserId = Auth.auth().currentUser?.uid
    
    //Adds current user's uid in the list of followers for a particular user
    func addCurrentUserAsFollowerOf(uid: String) {
        let subdocRef = db.collection("users").document(uid).collection("profile").document("followers")
        subdocRef.updateData([
            "followers": FieldValue.arrayUnion([currentUserId])
        ])
        
    }
    
    //adds new playlist to PlayList collection
    //updates list of playlist ids in users playlists subcollection with new playlist
    /*
     AKA ADD TO LIBRARY AKA LIBRARY = COLLECTION
     */
    func addToPlaylists(playlist : Playlist) {
    
        let docRef = db.collection("playlists").document()
        do {
            try docRef.setData(from: playlist)
            
        }catch {
            
        }
        let playlistDocRef = db.collection("playlists").whereField("name", isEqualTo: playlist.name)
            .getDocuments() { (querySnapshot, err) in
               if let err = err {
                   print("Error getting documents: \(err)")
               } else {
                   for document in querySnapshot!.documents {
                       //print("\(document.documentID) => \(document.data())")
                       self.db.collection("users").document(self.currentUserId!).collection("home").document("library").updateData([
                        "playlists" : FieldValue.arrayUnion([document.documentID])]
                       )
                   }
               }
            }
        
    }
    
    func addPlaylistToMuseum(playlist: Playlist, museum: String) {
        db.collection("museums").document(museum).updateData(["Playlist" : FieldValue.arrayUnion([playlist.name])])
    }

//    func addPlaylistToLibrary(type: String, user: String){
//
//    }
}
