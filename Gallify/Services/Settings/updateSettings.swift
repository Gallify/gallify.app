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
        do {
            try await FirestoreQuery.db.collection("users").document((Auth.auth().currentUser?.uid)!).updateData(
                ["username" : username]
            )
            data.username = username
            self.data.username = username
            
        } catch {
            print("Error updating username")
        }
    }
    
    
    func updateDisplayName(name: String) async {
        do {
            try await FirestoreQuery.db.collection("users").document((Auth.auth().currentUser?.uid)!).updateData(
                ["displayName" : name]
            )
            data.displayName = name
            self.data.displayName = name
            
        } catch {
            print("Error updating display name")
        }
    }
    
//    func updatefirstName(first: String) async {
//        do {
//            try await FirestoreQuery.db.collection("users").document((Auth.auth().currentUser?.uid)!).updateData(
//                ["firstName" : first]
//            )
//            data.firstName = first
//            self.data.firstName = first
//
//        } catch {
//            print("Error updating firstname")
//        }
//    }
//
//    func updateLastName(last: String) async {
//        do {
//            try await FirestoreQuery.db.collection("users").document((Auth.auth().currentUser?.uid)!).updateData(
//                ["lastName" : last]
//            )
//            data.lastName = last
//            self.data.lastName = last
//        } catch {
//            print("Error updating lastname")
//        }
//    }
    
    func updateUserDescription(desc : String) async {
        print(desc)
        do {
            try await FirestoreQuery.db.collection("users").document((Auth.auth().currentUser?.uid)!).updateData(
                ["description" : desc]
            )
            data.description = desc
            self.data.description = desc
        } catch {
            print("Error updating description of user bio/description \(error.localizedDescription)")
        }
    }
    
    func updateProfileImage(image: Data) async {
        let uploadRef = Storage.storage().reference(withPath: "profileImages/" + (Auth.auth().currentUser?.uid)!)
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpeg"
        
        await uploadRef.putData(image, metadata: metaData) {
            (StorageMetadata, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            uploadRef.downloadURL {
                (url, error) in
                //Save to image url in firestore.
                let db = Firestore.firestore()
                let docRef = db.collection("users").document(Auth.auth().currentUser!.uid)
                self.data.profileImageUrl = (url?.absoluteString)!
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
