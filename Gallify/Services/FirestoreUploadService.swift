//
//  FirestoreSubcollectionService.swift
//  Gallify
//
//  Created by Shruti Sharma on 12/26/21.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
import SwiftUI

class FirestoreUploadService {
    
    let db = Firestore.firestore()
    let currentUserId = (Auth.auth().currentUser?.uid)!
    
    @ObservedObject var firestoreQuery : FirestoreQuery = FirestoreQuery()

    //Adds current user's uid in the list of followers for a given user
    func follow(uid: String) {
        var followers = Followers()
        followers.followers.append(currentUserId)
        let subdocRef = db.collection("users").document(uid).collection("profile").document("followers")
        do {
            try subdocRef.setData(from: followers)
        } catch let error {
            print("Error writing user to Firestore: \(error)")
        }
        //update number of followers in followed person's profile
        db.collection("users").document(uid).updateData(["followers" : FieldValue.increment(Int64(1))])
        
        //update following field and doc
        addFollowing(uid: uid)
        
    }
    
    //remove current user from list of followers for given user
    func unfollow(uid: String) async {
        //fetch current followers and remove uid from list
        await firestoreQuery.fetchFollowers(uid: uid)
        var followersObj = firestoreQuery.followers
        var followersArr = followersObj.followers
        followersArr = followersArr.filter { id in
            return id == uid
        }
        
        //update followers doc
        followersObj = Followers(arr: followersArr)
        let subdocRef = db.collection("users").document(uid).collection("profile").document("followers")
        try! subdocRef.setData(from: followersObj)
        
        //decrement number of followers in followed person's profile
        try! await db.collection("users").document(uid).updateData(["followers" : followersArr.count])
        
        //update following field and doc
        await removeFollowing(uid: uid)
    }
    
    
    func addFollowing(uid: String) {
        var following = Following()
        following.following.append(uid)
        
        let subdocRef = db.collection("users").document(currentUserId).collection("profile").document("following")
        try! subdocRef.setData(from: following)
        
        //update number of following in followed person's profile
        db.collection("users").document(currentUserId).updateData(["following" : FieldValue.increment(Int64(1))])
    }
    
    func removeFollowing(uid: String) async{
        await firestoreQuery.fetchFollowers(uid: currentUserId)
        var followingObj = firestoreQuery.following
        var followingArr = followingObj.following
        followingArr = followingArr.filter { id in
            return id == uid
        }
        
        //update followers doc
        followingObj = Following(arr: followingArr)
        let subdocRef = db.collection("users").document(currentUserId).collection("profile").document("following")
        try! subdocRef.setData(from: followingObj)
        
        //decrement number of followers in followed person's profile
        try! await db.collection("users").document(currentUserId).updateData(["following" : followingArr.count])
    }
    
    //adds new playlist to PlayLists collection
    //updates specified museum
    func create_playlist(playlist : Playlist) {
    
        try! db.collection("playlists").document().setData(from: playlist)
            
        //update library with new playlist
        
        db.collection("users").document(currentUserId).updateData(["Library": FieldValue.arrayUnion([playlist.id])])
    }
    
    //add new given playlist to given museum
    func updateMuseum(playlist: Playlist, museum: String) {
        let museumDocRef = db.collection("museums").whereField("name", isEqualTo: museum).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting document: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    document.reference.updateData(["playlist" : FieldValue.arrayUnion([playlist.id])])
                }
            }
        }
    }
    
    //add new art to existing playlist
    //call updateMuseum function to add playlist id to specified Museum
    func addArtToPlayList(art: Art, playlistName: String) {
        
    }
    
    
    
}
