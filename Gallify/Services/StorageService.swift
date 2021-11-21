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
import UIKit
import SwiftUI


class StorageService {
    static var storageRoot = Storage.storage()
    static var storageProfile = storageRoot.reference(forURL: "gs://gallify-64bbb.appspot.com/profileImages")
    
    static func storageProfileId(userId: String) -> StorageReference {
        return storageProfile.child(userId)
    }
    
    static func saveProfileImage(email:String, imageData: Data, metaData: StorageMetadata) {
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
                if let metaImageUrl = url?.absoluteString {
                    if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest() {
                        changeRequest.photoURL = url
                        changeRequest.commitChanges {
                            (error) in
                            if error != nil {
                                print(error!.localizedDescription)
                                return
                            }
                        }
                    }
                }
                
            }
        }
        
    }
    
    
}
