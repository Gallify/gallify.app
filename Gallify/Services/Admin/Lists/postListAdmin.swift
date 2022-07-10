//
//  postListAdmin.swift
//  Gallify
//
//  Created by Shruti on 6/17/22.
//

import Foundation

import FirebaseFirestore
import FirebaseAuth

extension FirestoreQuery {
    
///*
//    Approves artwork
//    Changes searchType field in Firestore Doc from 2 to 1
//    Deletes art from Creator's Review playlist and adds to tbeir Created Playlist
// */
//func approveArt(art: Art) async{
//    let docRef = FirestoreQuery.db.collection("art").document(art.artId)
//    let otherUserId = art.creatorId
//    
//    //Change firestore doc searchType value
//    docRef.updateData([
//        "searchType" : 1
//    ]) {  err in
//        if let err = err {
//            print("Error updating searchType in art document: \(err)")
//        } else {
//            print("art successfully approved")
//        }
//    }
//    
//    //remove art from local array
//    artInReview.removeAll { artwork in
//        art.artId == artwork.artId
//    }
//    
//    //delete from Creator's Review Playlist and add to Created Playlist
//    await getOtherUser(user_id: otherUserId)
//    let reviewPlaylistId = self.otherUserData.review
//    let createdPlaylistId = self.otherUserData.created
//    
//    //Remove art from Review Doc
//    do {
//        try await
//        FirestoreQuery.db.collection("playlists").document(reviewPlaylistId)
//            .updateData([
//                "art" : FieldValue.arrayRemove([art.artId])
//        ])
//    }
//    catch {
//        print("Error deleting art from Review Playlist: \(error.localizedDescription)")
//    }
//    
//
//    //add art to created doc
//    do {
//        try await FirestoreQuery.db.collection("playlists").document(createdPlaylistId).updateData([
//            "art": FieldValue.arrayUnion([art.artId])
//        ])
//        
//    } catch {
//        print("Error adding art to created Playlist: \(error.localizedDescription)")
//    }
//    
//    //Post to marketplace
//    await postArtToMarketplace(collectionId: art.collection, artId: art.artId)
//   
//}

func postArtToMarketplace(collectionId : String, artId:String) async  {
    let apiAddress = "https://api.gallify.app/v0/mint/\(collectionId)/\(artId)"
    let url = URL(string: apiAddress)!
//    let body = "\(collectionId)/\(artId)"
//
//    let finalBody = body.data(using: .utf8)
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
//    request.httpBody = finalBody

    
   // var request = URLRequest(url: url)
//    request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
    //request.httpMethod = "POST"
    
//    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//        if let error = error {
//            print( "DataTask error: " + error.localizedDescription + "\n")
//        } else if
//            let data = data,
//            let response = response as? HTTPURLResponse,
//            response.statusCode == 200 {
//                DispatchQueue.main.async {
//                    print("Successfully posted art to marketplace");
//                }
//            }
//    }
//    task.resume()
    
    URLSession.shared.dataTask(with: request){
               (data, response, error) in
               print(response as Any)
               if let error = error {
                   print(error)
                   return
               }
               guard let data = data else{
                   return
               }
               print(data, String(data: data, encoding: .utf8) ?? "*unknown encoding*")
               
           }.resume()
}
    
//func rejectArt(art: Art) async {
//    //delete from admin view
//    //remove art from local array
//    artInReview.removeAll { artwork in
//        art.artId == artwork.artId
//    }
//    
//    //change searchType in firestore from 2 to 0
//    let docRef = FirestoreQuery.db.collection("art").document(art.artId)
//    docRef.updateData([
//        "searchType" : 0
//    ]) {  err in
//        if let err = err {
//            print("Error updating searchType in art document: \(err)")
//        } else {
//            print("art rejected")
//        }
//    }
//}
    
}

