//
//  getHome.swift
//  Gallify
//
//  Created by Tejvir Mann on 1/17/22.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

extension FirestoreQuery {
    
    /*
     
     */
    func getHome(){
        async{
            //getMuseumList. Gets a list of Museums. Made For You. Discover. Trending. Popular. Genres.
            try await getHomeMuseumList()
           
            //getMuseums. Gets all these Museums. List of Playlists
            try await getHomeMuseums()
            
            //getPlaylists. Gets all the data for the playlists. Called once per museum.
            try await getHomePlaylists()
        }
    }
    
    
    /*
     
     */
    func getHomeMuseumList() async {
        let userId = Auth.auth().currentUser?.uid
        
        do {
            
            let doc = try await FirestoreQuery.db.collection("users").document(userId ?? "help" ).collection("home")
                .document("home")
                .getDocument().data(as: MuseumList?.self)
            
            guard let theMuseumlist = doc else{
                throw DatabaseError.failed
            }
            
            self.homeMuseumList = theMuseumlist
            
        }
        catch{
            print("Error in getHomeMuseumList")
        }
    }
    
    /*
     
     */
    func getHomeMuseums() async {
        
        if !(homeMuseums.isEmpty){ //if featured playlist isnt empty, then return.
            return
        }
       
        //self.featuredArt.removeAll()
        
        var museum_array = [Museum]()
        
        for museum_id in homeMuseumList.museums {
            do {
                let doc = try await FirestoreQuery.db.collection("museums")
                    .document(museum_id)
                    .getDocument().data(as: Museum?.self)
                
                guard let theMuseum = doc else{
                    throw DatabaseError.failed
                }
                
               // self.featuredArt.append(theArt)
                //art_array.append(doc!)
                museum_array.append(theMuseum)
                
                //
            }
            catch{
                print("Error in getHomeMuseums")
            }
        }
        
        self.homeMuseums = museum_array
        
    }
    
    
    
    
    /*
     
     */
    func getHomePlaylists() async {
        
        if !(homePlaylists.isEmpty){ //if home playlist isnt empty, then return.
            return
        }
       
        //self.featuredArt.removeAll()
        var playlist_db_array = [[Playlist]]()
        for museum in homeMuseums {
            
            var playlist_array = [Playlist]()
           
            for playlist_id in museum.playlist {
                do {
                    let doc = try await FirestoreQuery.db.collection("playlists")
                        .document(playlist_id)
                        .getDocument().data(as: Playlist?.self)
                    
                    guard let thePlaylist = doc else{
                        throw DatabaseError.failed
                    }
                    
                    playlist_array.append(thePlaylist)
                    
                }
                catch{
                    print("Error in getHomePlaylists() \(error.localizedDescription)")
                }
            }
            playlist_db_array.append(playlist_array)
            
        }
        
        self.homePlaylists = playlist_db_array
    }
    
    
    /*
      Low Priority. Can pick location. ex. City. and a museum for that city pops up.
      */
     func getLocationMuseum() async {
     }
    
    
    
    
    
    
    
    
}
