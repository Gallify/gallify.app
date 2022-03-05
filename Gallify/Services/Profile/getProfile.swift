//
//  getProfile.swift
//  Gallify
//
//  Created by Tejvir Mann on 1/17/22.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

extension FirestoreQuery {
    
    
    /*
     This function is getUser and getfeaturedPlaylist combined.
     */
    func getData() async {
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
    
    /*
     This function is getUser and stores user data in 'data'
     */
    func getUser() async {
        let userEmail = Auth.auth().currentUser?.email
        print("EMAIL GET USER")
        print(userEmail)
        do {
            let doc = try await FirestoreQuery.db.collection("users")
                .document(userEmail ?? "info@gallify.app")
                .getDocument().data(as: User.self)
            
            guard let theUser = doc else{
                throw DatabaseError.failed
            }
            
            self.data = theUser
            
        }
        catch{
            print("Error")
        }
    }
    
    //pwe
    func getUserData() async {
        let userEmail = Auth.auth().currentUser?.email
        print("EMAILjj")
        print(userEmail)

        do {
            let doc = try await FirestoreQuery.db.collection("users")
                .document(userEmail ?? "info@gallify.app")
                .getDocument().data(as: User.self)

            print("DOC")
            print(doc)
            guard let theUser = doc else{
                throw DatabaseError.failed
                print("HIHIHI")
            }

            self.data = theUser
            
            print("DATA")
            print(self.data.email)

        }
        catch{
            print("Error")
        }
    }
    
    
    
    /*
     Input: Library Array.
     
     Output: Published Library variable now contains array of playlist elements.
     
     This method needs to be checked.
     */
    func getUserLibrary_old(library_ids: [String]) {
        self.userLibrary.removeAll()
        for library_id in library_ids {
            FirestoreQuery.db.collection("playlists").document(library_id) //If user can't get email, we need alternate fix.
                .addSnapshotListener { queryDocumentSnapshot, error in
                    if error == nil { //if no errors
                        if let document = queryDocumentSnapshot{
                            //update list in main thread.
                            DispatchQueue.main.async{
                                //set retrieved document to @published data object
                                self.userLibrary.append(try! document.data(as: Playlist.self)!) //this is forceful, and assumes this will always work...
                            }
                            
                        }
                        else{
                            print("Error: There aren't any documents, getPlaylists()")
                            return
                        }
                    }
                    else{
                        print("Error: Can't get document, getPlaylists()")
                        return
                    }
          }
            
            
        }
    }
    
    /*
     async version
     
     getUser must be called first
     
     */
    func getUserLibrary() async {
        
        if !(userLibrary.isEmpty){ //if featured playlist isnt empty, then return.
            return
        }
       
        //self.featuredArt.removeAll()
        
        var playlist_array = [Playlist]()
        
        for playlist_id in data.Library {
            do {
                let doc = try await FirestoreQuery.db.collection("art")
                    .document(playlist_id)
                    .getDocument().data(as: Playlist.self)
                
                guard let thePlaylist = doc else{
                    throw DatabaseError.failed
                }
                
               // self.featuredArt.append(theArt)
                //art_array.append(doc!)
                playlist_array.append(thePlaylist)
                print("APPENDING to playlist_array in firestore query => ", thePlaylist.name)
                //
            }
            catch{
                print("Error")
            }
        }
        
        self.userLibrary = playlist_array
        
    }
    
    //Other Profile
    
    /*
     This function is getUser and getfeaturedPlaylist combined.
     */
    func getOtherData(user_id: String) async {
        
        do {
            let doc = try await FirestoreQuery.db.collection("users")
                .document(user_id)
                .getDocument().data(as: User.self)
            
            guard let theUser = doc else{
                throw DatabaseError.failed
            }
            
            self.otherUserData = theUser
            
            //
            
            let doc2 = try await FirestoreQuery.db.collection("playlists")
                .document(otherUserData.featured)
                .getDocument().data(as: Playlist.self)
            
                
            guard let thefeaturedPlaylist = doc2 else{
                throw DatabaseError.failed
            }

            self.otherFeaturedPlaylist = thefeaturedPlaylist
            
            //
            
        }
        catch{
            print("Error")
        }
    }
    
    /*
     This function is getUser and stores user data in 'data'
     */
    func getOtherUser(user_id: String) async {
        let userEmail = Auth.auth().currentUser?.email
        
        do {
            let doc = try await FirestoreQuery.db.collection("users")
                .document(user_id)
                .getDocument().data(as: User.self)
            
            guard let theUser = doc else{
                throw DatabaseError.failed
            }
            
            self.otherUserData = theUser
            
        }
        catch{
            print("Error")
        }
    }
    
    /*
     Input: Library Array.
     
     Output: Published Library variable now contains array of playlist elements.
     
     This method needs to be checked.
     */
    func getOtherLibrary_old(library_ids: [String]) {
        self.userLibrary.removeAll()
        for library_id in library_ids {
            FirestoreQuery.db.collection("playlists").document(library_id) //If user can't get email, we need alternate fix.
                .addSnapshotListener { queryDocumentSnapshot, error in
                    if error == nil { //if no errors
                        if let document = queryDocumentSnapshot{
                            //update list in main thread.
                            DispatchQueue.main.async{
                                //set retrieved document to @published data object
                                self.otherLibrary.append(try! document.data(as: Playlist.self)!) //this is forceful, and assumes this will always work...
                            }
                            
                        }
                        else{
                            print("Error: There aren't any documents, getPlaylists()")
                            return
                        }
                    }
                    else{
                        print("Error: Can't get document, getPlaylists()")
                        return
                    }
          }
            
            
        }
    }
    
    /*
     async version
     
     getUser must be called first
     
     */
    func getOtherLibrary() async {
        
        if !(otherLibrary.isEmpty){ //if featured playlist isnt empty, then return.
            return
        }
       
        //self.featuredArt.removeAll()
        
        var playlist_array = [Playlist]()
        
        for playlist_id in otherUserData.Library {
            do {
                let doc = try await FirestoreQuery.db.collection("art")
                    .document(playlist_id)
                    .getDocument().data(as: Playlist.self)
                
                guard let thePlaylist = doc else{
                    throw DatabaseError.failed
                }
                
               // self.featuredArt.append(theArt)
                //art_array.append(doc!)
                playlist_array.append(thePlaylist)
                
                //
            }
            catch{
                print("Error")
            }
        }
        
        self.otherLibrary = playlist_array
        
    }
    
    
    
    
    
    
    
    
    
    
}
