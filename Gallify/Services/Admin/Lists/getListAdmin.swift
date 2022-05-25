//
//  getList.swift
//  Gallify
//
//  Created by Patron on 5/23/22.
//

import Foundation

extension FirestoreQuery {
    
    /**
        Gets all art that have not been approved yet
        Stores it in an array form to be displayed in approved screen
        Unapproved = 2, approved = 1
     */
    func getArtInReview() async {
        
        if(self.getNext){ //makes query get next batch of art for review
            self.inReviewQuery = try? await self.inReviewQuery.start(afterDocument: self.lastDoc)
        }
        else{ //This is the first batch to be fetched
            self.inReviewQuery = try await FirestoreQuery.db.collection("art").whereField("searchType", isEqualTo: 2)
                              .order(by: "popularity", descending: true)
                              .limit(to: 11)
        }
        
    
        var inReviewArtArr = [Art]()
        
        try await self.inReviewQuery.addSnapshotListener() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    var i = 0
                    inReviewArtArr = querySnapshot!.documents.compactMap { querySnapshot -> Art? in
                             return try? querySnapshot.data(as: Art.self)
                    }
                    //print("is inReviewArtArr empty ? ", inReviewArtArr.isEmpty)
//                    for art in inReviewArtArr {
//                        print(art.name, " " , art.artId)
//                        i += 1
//                    }
                    self.lastDoc = querySnapshot!.documents.last //get last document for later.
                    self.getNext = true
                    self.artInReview = inReviewArtArr
                }
        }
        
    }
    
    func approveArt() async{
        
    }
}
