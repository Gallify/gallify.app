//
//  updateSettings.swift
//  Gallify
//
//  Created by Tejvir Mann on 1/17/22.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage
import UIKit
import SwiftUI

extension FirestoreQuery {

    func updateUsername(username: String) async {
        print("NEW USERNAME = ",username)
        do {
            try await FirestoreQuery.db.collection("users").document((Auth.auth().currentUser?.email)!).updateData(
                ["username" : username]
            )
            self.data.username = username
            
        } catch {
            print("Error updating username")
        }
    }
    
    func updateName(first: String, last: String) async {
        do {
            try await FirestoreQuery.db.collection("users").document((Auth.auth().currentUser?.email)!).updateData(
                ["firstName" : first]
            )
            self.data.firstName = first
            try await FirestoreQuery.db.collection("users").document((Auth.auth().currentUser?.email)!).updateData(
                ["lastName" : last]
            )
            self.data.lastName = last
            
        } catch {
            print("Error updating username")
        }
    }
    
    func updateProfileImage(image: Data) {
        let uploadRef = Storage.storage().reference(withPath: "profileImages/" + (Auth.auth().currentUser?.email)!)
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpeg"
        
        uploadRef.putData(image, metadata: metaData) {
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
    
    func updateDescription(desc:String, art_id: String) async {
        do {
            try await FirestoreQuery.db.collection("art").document(art_id).updateData(
                ["description" : desc]
            )
            self.art.description = desc //not sure if this is the art I should be working with
        } catch {
            print("Error updating description of art")
        }
    }
    
}
