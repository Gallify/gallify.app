//
//  getPlaylist.swift
//  Gallify
//
//  Created by Tejvir Mann on 1/17/22.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

extension FirestoreQuery {
    
    //pwe
    func getFeaturedPlaylist() async {
        let userId = Auth.auth().currentUser?.uid

        do {
            let doc2 = try await FirestoreQuery.db.collection("playlists")
                .document(data.featured)
                .getDocument().data(as: Playlist.self)


            guard let thefeaturedPlaylist = doc2 else{
                throw DatabaseError.failed
            }

            self.featuredPlaylist = thefeaturedPlaylist
            DispatchQueue.main.async{
                self.featuredPlaylist = thefeaturedPlaylist
            }

        }
        catch{
            print("Error")
        }
    }
    
    /*
     Featured Art = the art elements per featured playlist, not just the ids.
     */
    func getFeaturedArt() async {
        
//        if !(featuredArt.isEmpty){ //if featured playlist isnt empty, then return.
//            return
//        }
       
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
        
        //self.featuredArt = art_array //before
        
        //this only updates the array if it is different.
        if(self.featuredArt as NSArray == art_array as NSArray){
            
        }
        else{
            self.featuredArt = art_array
            print("FEATURED ART")
            print(self.featuredArt.count)

            //if old is not same as new then ...
//            DispatchQueue.main.async{
//                self.featuredArt = art_array
//            }
           // self.featuredArt = art_array
        }
        
    }
    
    
    /*
     gets a playlist given id.
     */
    func getPlaylist(playlist_id: String) async {
        let userId = Auth.auth().currentUser?.uid
        
        do {
            
            let dataDescription = try await FirestoreQuery.db.collection("playlists")
                .document(playlist_id)
                .getDocument()
            
           // print(doc3.getData())
            
            let dataDescription2 = dataDescription.data().map(String.init(describing:)) ?? "nil"
            print("Cached document datao: \(dataDescription2)")
            
            let doc2 = try await FirestoreQuery.db.collection("playlists")
                .document(playlist_id)
                .getDocument().data(as: Playlist.self)
            
                
            guard let thePlaylist = doc2 else{
                throw DatabaseError.failed
            }

           
           self.playlist = thePlaylist
            
        }
        catch{
            print("Error in getPlaylist while fetching playlist with id \(playlist_id)")
        }
    }
    
    
    /*
     gets a playlist given id. This is used in ReelDescription only!
     */
    func getReelPlaylist(playlist_id: String) async -> Playlist {
        let userId = Auth.auth().currentUser?.uid
        var reelPlaylist = Playlist()
        
        do {
            let doc2 = try await FirestoreQuery.db.collection("playlists")
                .document(playlist_id)
                .getDocument().data(as: Playlist.self)
            
                
            guard let thePlaylist = doc2 else{
                throw DatabaseError.failed
            }

            reelPlaylist = thePlaylist
            
        }
        catch{
            print("Error")
        }
        
        return reelPlaylist
    }
    
    /*
     gets art for current playlist.
     
     Always needs to be called after getPlaylist()
     */
    func getPlaylistArt(playlist: Playlist) async {
        print("playlist IN GET PLAYLIST ART = ", playlist.name)
    
        print("is art array in playlist empty? ", playlist.art.isEmpty)
//        if !(playlistArt.isEmpty){ //if featured playlist isnt empty, then return.
//            return
//        }
        for art in playlist.art {
            print("art in playlist art = ", art)
        }
        
        var art_array = [Art]()
        
        print(playlist.art.count)
        
        for art_id in playlist.art {
            do {
                
                let doc = try await FirestoreQuery.db.collection("art")
                    .document(art_id)
                    .getDocument().data(as: Art.self)
                
                print("Art Doc")
                print(doc)
                guard let theArt = doc else{
                    throw DatabaseError.failed
                }
                
                art_array.append(theArt)
                
                //
            }
            catch{
                print("Error in getPlaylistArt \(error.localizedDescription)")
            }
        }
        
        self.playlistArt = art_array

    }
    
    //pwe
    func getOtherFeaturedPlaylist() async {
       

        do {
            let doc2 = try await FirestoreQuery.db.collection("playlists")
                .document(otherUserData.featured)
                .getDocument().data(as: Playlist.self)


            guard let thefeaturedPlaylist = doc2 else{
                throw DatabaseError.failed
            }

            self.otherFeaturedPlaylist = thefeaturedPlaylist

        }
        catch{
            print("Error")
        }
    }
    
    /*
     Featured Art = the art elements per featured playlist, not just the ids.
     */
    func getOtherFeaturedArt() async {
        
//        if !(featuredArt.isEmpty){ //if featured playlist isnt empty, then return.
//            return
//        }
       
        //self.featuredArt.removeAll()
        
        var art_array = [Art]()
        
        for art_id in otherFeaturedPlaylist.art {
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
        
        
        //if old is not same as new then ...
        self.otherFeaturedArt = art_array
        
    }
    
    /*
     06/20/22
     This function calls the gallify.api via /v0/timenow to get the current time.
     
     Also in login view model. Kind of inefficient if you ask me.
     
     Unix
     */
    func timeNow() -> Int {
        
        var time = 0
        let apiAddress = "https://api.gallify.app/v0/timenow/"
        let url = URL(string: apiAddress)!
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            //get data
            //print(data)
            guard let jsonData = data,
                let response = response as? HTTPURLResponse,
                error == nil else {      // check for fundamental networking error
                print("error", error ?? "Unknown error")
                return
            }

            guard (200 ... 299) ~= response.statusCode else { // check for http errors
                print("statusCode should be 2xx, but is \(response.statusCode)")
                print("response = \(response)")
                return
            }

            let responseString = String(data: jsonData, encoding: .utf8)
            time = Int(responseString ?? "0")!
//            print(time)
//            print("responseString = \(responseString)")
            
        }
        task.resume()
        
        print(time)
        return time

    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
