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
import FirebaseFirestore


class StorageService {
    
     static let db = Firestore.firestore()

//    struct profileURL {
//        static var url: Any
//    }
    
    public var url = ""
    
    static func saveProfileImage(email:String, imageData: Data, metaData: StorageMetadata) {
        let uploadRef = Storage.storage().reference(withPath: "profileImages/" + email)
      //  let testurl = profileURL.url
        //var profileUrl: String? //why '?' well..?
        
        //profileUrl = "gs://gallify-64bbb.appspot.com/profileImages/" + email
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
                   // let db = Firestore.firestore()
                    db.collection("users").document(Auth.auth().currentUser!.email!).setData([
                                            "profileImageUrl": metaImageUrl
                    ]){ err in
                        if let err = err {
                            print("Error writing document: \(err)")
                        } else {
                            print("Document successfully written!")
                        }
                    }
                }
            }
            
            
 
    }
  }
}
