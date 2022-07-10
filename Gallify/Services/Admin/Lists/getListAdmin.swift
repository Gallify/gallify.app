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
            self.inReviewQuery = try await FirestoreQuery.db.collection("art").whereField("searchType", isEqualTo: 2) //.limit(to: 4)
//        }


        var inReviewArtArr = [Art]()

        try await self.inReviewQuery.addSnapshotListener() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    //var i = 0
                    inReviewArtArr = querySnapshot!.documents.compactMap { querySnapshot -> Art? in
                             return try? querySnapshot.data(as: Art.self)
                    }
//                  self.lastDoc = querySnapshot!.documents.last //get last document for later.
//                    print("LAST DOC ART NAME =", self.lastDoc.data()["name"])
//                  self.getNext = true
                    self.artInReview = inReviewArtArr
                }
        }

    }


    /*
        Approves artwork
        Changes searchType field in Firestore Doc from 2 to 1
        Deletes art from Creator's Review playlist and adds to tbeir Created Playlist
     */
    func approveArt(art: Art) async{
        let docRef = FirestoreQuery.db.collection("art").document(art.artId)
        let otherUserId = art.creatorId

        //Change firestore doc searchType value
        docRef.updateData([
            "searchType" : 1
        ]) {  err in
            if let err = err {
                print("Error updating searchType in art document: \(err)")
            } else {
                print("art successfully approved")
            }
        }

        //remove art from local array
        artInReview.removeAll { artwork in
            art.artId == artwork.artId
        }

        //delete from Creator's Review Playlist and add to Created Playlist
        await getOtherUser(user_id: otherUserId)
        let reviewPlaylistId = self.otherUserData.review
        let createdPlaylistId = self.otherUserData.created
        let ownedPlaylistId = self.otherUserData.owned
//
        //Remove art from Review Doc
        do {
            try await
            FirestoreQuery.db.collection("playlists").document(reviewPlaylistId)
                .updateData([
                    "art" : FieldValue.arrayRemove([art.artId])
            ])
        }
        catch {
            print("Error deleting art from Review Playlist: \(error.localizedDescription)")
        }

//
        //add art to created doc
        do {
            try await FirestoreQuery.db.collection("playlists").document(createdPlaylistId).updateData([
                "art": FieldValue.arrayUnion([art.artId])
            ])

        } catch {
            print("Error adding art to created Playlist: \(error.localizedDescription)")
        }


        if(art.owner == otherUserId){ //added 06/19/22 by Tejvir
            //add art to created doc
            do {
                try await FirestoreQuery.db.collection("playlists").document(ownedPlaylistId).updateData([
                    "art": FieldValue.arrayUnion([art.artId])
                ])

            } catch {
                print("Error adding art to owned Playlist: \(error.localizedDescription)")
            }
        }
        
        await postArtToMarketplace(collectionId: art.collectionRef, artId: art.artId)
    }

    func rejectArt(art: Art) async {
        //delete from admin view
        //remove art from local array
        artInReview.removeAll { artwork in
            art.artId == artwork.artId
        }

        //change searchType in firestore from 2 to 0
        let docRef = FirestoreQuery.db.collection("art").document(art.artId)
        docRef.updateData([
            "searchType" : 0
        ]) {  err in
            if let err = err {
                print("Error updating searchType in art document: \(err)")
            } else {
                print("art rejected")
            }
        }

        //send an email to the user explaining why it was rejected
       // MailViewTest()

    }

}
