//
//  StorageService.swift
//  Gallify
//
//  Created by Shruti Sharma on 10/30/21.
//
import Foundation
import FirebaseCore
import FirebaseStorage
import FirebaseAuth
import FirebaseFirestore
import UIKit
import SwiftUI


class StorageService : ObservableObject {
    
    static func saveProfileImage(email:String, imageData: Data, metaData: StorageMetadata){
        let uploadRef = Storage.storage().reference(withPath: "profileImages/" + email)
        metaData.contentType = "image/jpeg"
        uploadRef.putData(imageData, metadata: metaData) {
            (StorageMetadata, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            uploadRef.downloadURL {
                (url, error) in
                //Save to image url in firestore.
                let db = Firestore.firestore()
                let docRef = db.collection("users").document(Auth.auth().currentUser!.email!)
                docRef.updateData([
                    "profileImageUrl" : url?.absoluteString
                ]){  err in
                        if let err = err {
                            print("Error updating document: \(err)")
                        } else {
                            print("Document successfully updated with image url \(url)")
                        }
                    }

                }
            }
            
        }
    
    @MainActor
    static func uploadArtImage(image: Data, playlist: Playlist) async {
        let uploadRef = Storage.storage().reference(withPath: "Art/" + (Auth.auth().currentUser?.email)! + "/" + "images/")
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpeg"
        var imgUrl = ""
        uploadRef.putData(image, metadata: metaData) {
            (StorageMetadata, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            uploadRef.downloadURL {
                (url, error) in
                imgUrl = url!.absoluteString
            }
        }
        var new_art = Art()
        new_art.thumbnail = imgUrl
//        await FirestoreQuery().addArtToArtCollection(art: new_art, playlistId: playlist.id)//had to create a new instance of Firestore Query because environment object wasn't being accepted, not sure if this is right
    }
        
}
