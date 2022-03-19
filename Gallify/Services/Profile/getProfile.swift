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
        let userId = Auth.auth().currentUser?.uid
        
        do {
            let doc = try await FirestoreQuery.db.collection("users")
                .document(userId ?? "info@gallify.app")
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
        let userId = Auth.auth().currentUser?.uid
        print("EMAIL GET USER")
        //print(userEmail)
        do {
            let doc = try await FirestoreQuery.db.collection("users")
                .document(userId ?? "info@gallify.app")
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
        let userId = Auth.auth().currentUser?.uid
        print("EMAILjj")
       // print(userEmail)

        do {
            let doc = try await FirestoreQuery.db.collection("users")
                .document(userId ?? "info@gallify.app")
                .getDocument()
                .data(as: User.self)

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
     
     getUser must be called first.
     Untested.
     
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
        //let userId = Auth.auth().currentUser?.uid
        print("USERID")
        print(user_id)
        
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
     Untested
     
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
     Does not work
     
     */
    func getOtherLibrary_async() async {
        
        if !(otherLibrary.isEmpty){ //if featured playlist isnt empty, then return.
            return
        }
       
        //self.featuredArt.removeAll()
        
        var playlist_array = [Playlist]()
        
        for playlist_id in otherUserData.Library {
            do {
                print("PLAYLIST ID")
                print(playlist_id)
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
    
    func getOtherLibrary_old_2() {
        
        var the_otherLibrary = [Playlist]()
        
        for library_id in self.otherUserData.Library {
            FirestoreQuery.db.collection("playlists").document(library_id) //If user can't get email, we need alternate fix.
                .addSnapshotListener { queryDocumentSnapshot, error in
                    if error == nil { //if no errors
                        if let document = queryDocumentSnapshot{
                            //update list in main thread.
                            DispatchQueue.main.async{
                                //set retrieved document to @published data object
                                print("document")
                                print(document)
                                print(library_id)
                                
                                
                                the_otherLibrary.append(try! document.data(as: Playlist.self)!) //this is forceful, and assumes this will always work...
                            }
                            
                        }
                        else{
                            print("Error: There aren't any documents, otherlibrary()")
                            return
                        }
                    }
                    else{
                        print("Error: Can't get document, otherlibrary()")
                        return
                    }
          }
  
        }
        
        if(self.otherLibrary as NSArray == the_otherLibrary as NSArray){
            
        }
        else{
            DispatchQueue.main.async{
                self.otherLibrary = the_otherLibrary
            }
            
        }
        
        
        
        
    }
    
    /*
     getOtherLibrary for the other profile
     
     This works.
     */
    func getOtherLibrary() async {
        
//        if !(featuredArt.isEmpty){ //if featured playlist isnt empty, then return.
//            return
//        }
       
        //self.featuredArt.removeAll()
        
        var other_library_array = [Playlist]()
        
        for playlist_id in otherUserData.Library {
            do {
                let doc = try await FirestoreQuery.db.collection("playlists")
                    .document(playlist_id)
                    .getDocument().data(as: Playlist.self)
                
                guard let thePlaylist = doc else{
                    throw DatabaseError.failed
                }
                
               // self.featuredArt.append(theArt)
                //art_array.append(doc!)
                other_library_array.append(thePlaylist)
                
                //
            }
            catch{
                print("Error")
            }
        }
        
        
        //if old is not same as new then ...
        self.otherLibrary = other_library_array
        
    }

    
    
    
    
    
    
    
    
    
    
}
