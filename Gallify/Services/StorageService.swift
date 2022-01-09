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

    static func saveProfileImage(uid:String, imageData: Data, metaData: StorageMetadata){
        let uploadRef = Storage.storage().reference(withPath: "profileImages/" + uid)
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
        
    }
