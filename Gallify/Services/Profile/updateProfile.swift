//
//  updateProfile.swift
//  Gallify
//
//  Created by Tejvir Mann on 1/17/22.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

extension FirestoreQuery {
    
    /*
     Follow a user
     */
    func follow(otherUserId: String) async{
        
        //this method
            
            //Adds otheruser to current user following list.
            //increases follower count.
            //Adds current user to other user's followers list.
            //Increases Current users following count
        
        
        let userId = Auth.auth().currentUser?.uid
        let new_following = self.data.following + 1
        let new_followers = self.otherUserData.followers + 1
        
        
        //Adds otheruser to current user following list.
        do {
            let doc = try await FirestoreQuery.db.collection("users").document(userId!).collection("profile").document("following")
                .updateData(["following": FieldValue.arrayUnion([otherUserId])]) { err in
                if let err = err {
                    print("Error adding otherUser to current users 'following' list: \(err)")
                } else {
                    print("Document successfully updated. Added other user to current users following list.")
                }
            }
            
        }
        catch{
            print("Error adding other user to current user following list")
        }
        
        
        //Adds current user to other user's followers list.
        do {
            let doc = try await FirestoreQuery.db.collection("users").document(otherUserId).collection("profile").document("followers")
                .updateData(["followers": FieldValue.arrayUnion([userId!])]) { err in
                if let err = err {
                    print("Error adding otherUser to current users 'following' list: \(err)")
                } else {
                    print("Document successfully updated. Added other user to current users following list.")
                }
            }
        
        }
        catch{
            print("Error adding other user to current user following list")
        }
        
        
        //increases following count.
        do {
            let doc = try await FirestoreQuery.db.collection("users").document(userId!)
                .updateData(["following": new_following]) { err in
                if let err = err {
                    print("Error problem incrementing current users following: \(err)")
                } else {
                    print("Document successfully updated. incremented current users following.")
                }
            }
        
        }
        catch{
            print("Error adding other user to current user following list")
        }
        
        //increases followers count.
        do {
            let doc = try await FirestoreQuery.db.collection("users").document(otherUserId)
                .updateData(["followers": new_followers]) { err in
                if let err = err {
                    print("Error problem incrementing other users followers: \(err)")
                } else {
                    print("Document successfully updated. incremented other users followers.")
                }
            }
        
        }
        catch{
            print("Error adding other user to current user following list")
        }
        
        DispatchQueue.main.async {
            self.data.following = self.data.following + 1
            self.otherUserData.followers = self.otherUserData.followers + 1
        }
        
        
        
        
        
    }
    
    
    

    /*
     Unfollow a user
     */
    func unfollow(otherUserId: String) async{
        
        //this method
            
            //removes otheruser to current user following list.
            //decreases follower count.
            //removes current user to other user's followers list.
            //decreases Current users following count
        
        
        let userId = Auth.auth().currentUser?.uid
        let new_following = self.data.following - 1
        let new_followers = self.otherUserData.followers - 1
        
        
        //removes otheruser to current user following list.
        do {
            let doc = try await FirestoreQuery.db.collection("users").document(userId!).collection("profile").document("following")
                .updateData(["following": FieldValue.arrayRemove([otherUserId])]) { err in
                if let err = err {
                    print("Error unadding otherUser to current users 'following' list: \(err)")
                } else {
                    print("Document successfully updated. un-Added other user to current users following list.")
                }
            }
            
        }
        catch{
            print("Error unadding other user to current user following list")
        }
        
        
        //removes current user to other user's followers list.
        do {
            let doc = try await FirestoreQuery.db.collection("users").document(otherUserId).collection("profile").document("followers")
                .updateData(["followers": FieldValue.arrayRemove([userId!])]) { err in
                if let err = err {
                    print("Error unadding otherUser to current users 'following' list: \(err)")
                } else {
                    print("Document successfully updated. un-Added other user to current users following list.")
                }
            }
        
        }
        catch{
            print("Error unadding other user to current user following list")
        }
        
        
        //decreases following count.
        do {
            let doc = try await FirestoreQuery.db.collection("users").document(userId!)
                .updateData(["following": new_following]) { err in
                if let err = err {
                    print("Error problem decrementing current users following: \(err)")
                } else {
                    print("Document successfully updated. decremented current users following.")
                }
            }
        
        }
        catch{
            print("Error unadding other user to current user following list")
        }
        
        //decreases followers count.
        do {
            let doc = try await FirestoreQuery.db.collection("users").document(otherUserId)
                .updateData(["followers": new_followers]) { err in
                if let err = err {
                    print("Error problem decrementing other users followers: \(err)")
                } else {
                    print("Document successfully updated. decremented other users followers.")
                }
            }
        
        }
        catch{
            print("Error unadding other user to current user following list")
        }
        
        DispatchQueue.main.async {
            self.data.following = self.data.following - 1
            self.otherUserData.followers = self.otherUserData.followers - 1
        }
        
    
    }
    
    
}
