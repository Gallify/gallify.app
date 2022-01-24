//
//  get.swift
//  Gallify
//
//  Created by Tejvir Mann on 1/12/22.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

@MainActor
extension FirestoreQuery {
    // new functionality to add to SomeType goes here
    
    
    @MainActor
    @available(iOS 15.0.0, *)
    func loaditems_selfprofile(){
        async{
            try await getUser_await()
            print("async")
            print(data.featured)
            try await getFeaturedPlaylist_await(playlist_id: data.featured)
            print("featured playlist async")
            //try await getFeaturedPlaylist_await(playlist_id: data.featured)
            print("featured playlist async 2")
            
        }
    }
    
//    @MainActor
//    @available(iOS 15.0.0, *)
//    func loaditems_selfprofile_featured(a: String){
//        async{
//            try await getFeaturedPlaylist_await(playlist_id: a)
//        }
//    }
    
    func getFeaturedArt_await(playlist_id: String) async {
        print("PLAYLIST ID")
        print(playlist_id)
        let docRef = try await FirestoreQuery.db.collection("playlists").document(playlist_id).getDocument {
            (document, error) in
           let result = Result {
            try document?.data(as: Playlist.self)
           }
           switch result {
           case .success(let playlist):
             if let playlist = playlist {
               // A `User` value was successfully initialized from the DocumentSnapshot
               //set data to user in the main thread since call is completed in background
               DispatchQueue.main.async {
                   self.featuredPlaylist = playlist
                   //print(self.featuredPlaylist.art)
               }
             } else {
               // A nil value was successfully initialized from the DocumentSnapshot,
               // or the DocumentSnapshot was nil.
               print("Document does not exist")
             }
           case .failure(let error):
             // A `User` value could not be initialized from the DocumentSnapshot.
             print("Error decoding user: \(error)")
           }
         }
    }
    
    
    func getFeaturedPlaylist_await(playlist_id: String) async {
        print("PLAYLIST ID")
        print(playlist_id)
        let docRef = try await FirestoreQuery.db.collection("playlists").document(playlist_id).getDocument {
            (document, error) in
           let result = Result {
            try document?.data(as: Playlist.self)
           }
           switch result {
           case .success(let playlist):
             if let playlist = playlist {
               // A `User` value was successfully initialized from the DocumentSnapshot
               //set data to user in the main thread since call is completed in background
               DispatchQueue.main.async {
                   self.featuredPlaylist = playlist
                   print("INSIDE FEATURED PLAYLIST, here is featured playlist art")
                   print(self.featuredPlaylist.art)
               }
             } else {
               // A nil value was successfully initialized from the DocumentSnapshot,
               // or the DocumentSnapshot was nil.
               print("Document does not exist")
             }
           case .failure(let error):
             // A `User` value could not be initialized from the DocumentSnapshot.
             print("Error decoding user: \(error)")
           }
         }
    }
    
    
  //  @available(iOS 15.0.0, *)
    func getUser_await() async {
        let userEmail = Auth.auth().currentUser?.email
      
        
        let docRef = try await FirestoreQuery.db.collection("users").document(userEmail ?? "info@gallify.app").getDocument { (document, error) in
           let result = Result {
            try document?.data(as: User.self)
           }
           switch result {
           case .success(let user):
             if let user = user {
               // A `User` value was successfully initialized from the DocumentSnapshot
               //set data to user in the main thread since call is completed in background
               DispatchQueue.main.async {
                 self.data = user
               }
             } else {
               // A nil value was successfully initialized from the DocumentSnapshot,
               // or the DocumentSnapshot was nil.
               print("Document does not exist")
             }
           case .failure(let error):
             // A `User` value could not be initialized from the DocumentSnapshot.
             print("Error decoding user: \(error)")
           }
         }  
    }
    
    func getUser_await2() async throws -> User {
        let userEmail = Auth.auth().currentUser?.email
      
        
        let docRef = try await FirestoreQuery.db.collection("users").document(userEmail ?? "info@gallify.app").getDocument { (document, error) in
           let result = Result {
            try document?.data(as: User.self)
           }
           switch result {
           case .success(let user):
             if let user = user {
               // A `User` value was successfully initialized from the DocumentSnapshot
               //set data to user in the main thread since call is completed in background
               DispatchQueue.main.async {
                 self.data = user
               }
             } else {
               // A nil value was successfully initialized from the DocumentSnapshot,
               // or the DocumentSnapshot was nil.
               print("Document does not exist")
             }
           case .failure(let error):
             // A `User` value could not be initialized from the DocumentSnapshot.
             print("Error decoding user: \(error)")
           }
         }
        
        return self.data
    }
    
    enum DatabaseError: String, Error{
        case failed = "failed"
    }
    
    func fetchData() async {
        let userEmail = Auth.auth().currentUser?.email
        
        do {
            let doc = try await FirestoreQuery.db.collection("users")
                .document(userEmail ?? "info@gallify.app")
                .getDocument().data(as: User.self)
            
            guard let theUser = doc else{
                throw DatabaseError.failed
            }
            
            self.data = theUser
            
            //
            
            let doc2 = try await FirestoreQuery.db.collection("playlists")
                .document(data.featured)
                .getDocument().data(as: Playlist.self)
            
                
            guard let thefeaturedPlaylist = doc2 else{
                throw DatabaseError.failed
            }

            self.featuredPlaylist = thefeaturedPlaylist
            
            //
            
        }
        catch{
            print("Error")
        }
    }
    
    func fetchArt() async {
        
        if !(featuredArt.isEmpty){ //if featured playlist isnt empty, then return.
            return
        }
       
        //self.featuredArt.removeAll()
        
        var art_array = [Art]()
        
        for art_id in featuredPlaylist.art {
            do {
                let doc = try await FirestoreQuery.db.collection("art")
                    .document(art_id)
                    .getDocument().data(as: Art.self)
                
                guard let theArt = doc else{
                    throw DatabaseError.failed
                }
                
               // self.featuredArt.append(theArt)
                //art_array.append(doc!)
                art_array.append(theArt)
                
                //
            }
            catch{
                print("Error")
            }
        }
        
        self.featuredArt = art_array
        
    }
    
//    func fetchFollowers(uid: String) async {
//        let uid = (Auth.auth().currentUser?.uid)!
//
//        if uid != nil {
//            do {
//
//                let doc = try! await FirestoreQuery.db.collection("users")
//                    .document(uid).collection("profile").document("followers")
//                    .getDocument().data(as: Followers.self)
//
//                guard let followerList = doc else {
//                     throw DatabaseError.failed
//                }
//
//                self.followers.followers = followerList.followers
//                print("FOLLOWERS ARRAY = ", self.followers.followers)
//            }
//            catch{
//                print("Error")
//            }
//        }
//
//    }
  
  
    
    
}
