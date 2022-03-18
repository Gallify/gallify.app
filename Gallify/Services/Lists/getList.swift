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

        }
        catch{
            print("Error")
        }
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
    
    
    /*
     gets a playlist given id.
     */
    func getPlaylist(playlist_id: String) async {
        let userId = Auth.auth().currentUser?.uid
        
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
                //
            }
            catch{
                print("Error in getPLaylistArt")
            }
        }
//
        
        self.playlistArt = art_array
        
//        await FirestoreQuery.db.collection("art").document(art_id)
//            .addSnapshotListener { queryDocumentSnapshot, error in
//                if error == nil { //if no errors
//                    if let document = queryDocumentSnapshot{
//                        //update list in main thread.
//                        DispatchQueue.main.async{
//                            //set retrieved document to @published data object
//                            self.playlistArt.append(try! document.data(as: Art.self)!) //this is forceful, and assumes this will always work...
//                        }
//
//                    }
//                    else{
//                        print("Error: There aren't any documents, getPlaylists()")
//                        return
//                    }
////                }
////                else{
////                    print("Error: Can't get document, getPlaylists()")
////                    return
////                }
//      }
//
//    }
    
        }
    
}

