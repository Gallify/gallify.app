//
//  getList.swift
//  Gallify
//
//  Created by Patron on 5/23/22.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

extension FirestoreQuery {
    
    /**
        Gets all art that have not been approved yet
        Stores it in an array form to be displayed in approved screen
        Unapproved = 2, approved = 1, rejected = 0
     */
    func getArtInReview() async {
        
//        if(self.getNext){ //makes query get next batch of art for review
//            self.inReviewQuery = try? await self.inReviewQuery.start(afterDocument: self.lastDoc)
//
//        }
//        else{ //This is the first batch to be fetched
            self.inReviewQuery = try await FirestoreQuery.db.collection("art").whereField("searchType", isEqualTo: 2)
                                                            .limit(to: 3)
//        }
        
    
        var inReviewArtArr = [Art]()
        
        try await self.inReviewQuery.addSnapshotListener() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    var i = 0
                    inReviewArtArr = querySnapshot!.documents.compactMap { querySnapshot -> Art? in
                             return try? querySnapshot.data(as: Art.self)
                    }
//                  self.lastDoc = querySnapshot!.documents.last //get last document for later.
//                  print("LAST DOC ART NAME =", self.lastDoc.data()["name"])
//                  self.getNext = true
                    self.artInReview = inReviewArtArr
                }
        }
        
    }
    
    
}
