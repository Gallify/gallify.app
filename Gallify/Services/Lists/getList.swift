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
    
    func getFeaturedPlaylist() async {
        let useremail = Auth.auth().currentUser?.email
        
        if !(self.userLibrary.isEmpty) {
            for playlist in self.userLibrary {
                if playlist.name == "Featured" {
                    DispatchQueue.main.async {
                       
                        self.featuredPlaylist = playlist
                        print("IS FEATURED PLAYLIST's ART EMPTY in get featured playlist? --->", self.featuredPlaylist.art.isEmpty)
                    }
//                    do {
//                        let doc2 = try await FirestoreQuery.db.collection("playlists")
//                            .document(playlist.id)
//                            .getDocument().data(as: Playlist.self)
//                        guard let thefeaturedPlaylist = doc2 else{
//                            throw DatabaseError.failed
//                        }
//                        DispatchQueue.main.async {
//
//                            self.featuredPlaylist = thefeaturedPlaylist
//                            print("IS FEATURED PLAYLIST's ART EMPTY in get featured playlist? --->", self.featuredPlaylist.art.isEmpty)
//                        }
//                    }catch {
//                        print("Error fetching Featured playlist")
//                    }

                }
            }
        } else {
            return
        }
//        do {
//            let doc2 = try await FirestoreQuery.db.collection("playlists")
//                .document(data.featured)
//                .getDocument().data(as: Playlist.self)
//
//
//            guard let thefeaturedPlaylist = doc2 else{
//                throw DatabaseError.failed
//            }
//
//            self.featuredPlaylist = thefeaturedPlaylist
//
//        }
//        catch{
//            print("Error")
//        }
//    }
    
    
}
    /*
     Featured Art = the art elements per featured playlist, not just the ids.
     */
    func getFeaturedArt() async {
        
        if !(featuredArt.isEmpty){ //if featured playlist isnt empty, then return.
            return
        }
       
        //self.featuredArt.removeAll()
        
        var art_array = [Art]()
        print("IS FEATURED PLAYLIST's ART EMPTY in get featured art? --->", featuredPlaylist.art.isEmpty)
        for art_id in await featuredPlaylist.art {
            do {
                let doc = try await FirestoreQuery.db.collection("art")
                    .document(art_id)
                    .getDocument().data(as: Art.self)
                
                guard let theArt = doc else{
                    throw DatabaseError.failed
                }

                self.featuredArt.append(theArt)
                print("APPENDING ART ---> ", theArt.art_id)
                //art_array.append(doc!)
                art_array.append(theArt)
                
                //
            }
            catch{
                print("Error")
            }
        }
        
//        self.featuredArt = art_array
        
    }
    
    
    /*
     gets a playlist given id.
     */
    func getPlaylist(playlist_id: String) async {
        let userEmail = Auth.auth().currentUser?.email
        
        do {
            let doc2 = try await FirestoreQuery.db.collection("playlists")
                .document(playlist_id)
                .getDocument().data(as: Playlist.self)
            
                
            guard let thePlaylist = doc2 else{
                throw DatabaseError.failed
            }

            self.playlist = thePlaylist
            
        }
        catch{
            print("Error")
        }
    }
    
    /*
     gets aret percurrent playlist.
     
     Always needs to be called after getPlaylist()
     */
    @MainActor
    func getPlaylistArt(playlist: Playlist) async {
        
//        if !(playlistArt.isEmpty){ //if featured playlist isnt empty, then return.
//            return
//        }
       
        //self.featuredArt.removeAll()
        
        var art_array = [Art]()
        
        for art_id in playlist.art {
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
                self.playlistArt = art_array
                //
            }
            catch{
                print("Error")
            }
        }
        
        self.playlistArt = art_array
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
