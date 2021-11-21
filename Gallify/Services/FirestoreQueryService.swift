//
//  FirestoreQuerysService.swift
//  Gallify
//
//  Created by Shruti Sharma on 11/7/21.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class FirestoreQuery{
    
    private let db = Firestore.firestore()
    private var data = [String:Any]()
    
    init() {}
    
    func decode<T : Decodable>(fromDictionary: [String : Any]) throws -> T {
        let data = try JSONSerialization.data(withJSONObject: fromDictionary)
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    func query(email: String) -> [String:Any] {
        db.collection("users").whereField("email", isEqualTo:email)
            .getDocuments() { [self] (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        //self.data = document.data().map(String.init(describing:)) ?? "nil"
                        self.data = document.data()
                    }
                }
        }
        return data
    }
    
    //get data for page. Home. Discover. Profile.
    func pagequery(page: String){
        
    }
    
}
