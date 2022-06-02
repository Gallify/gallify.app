//
//  Art.swift
//  Gallify
//
//  Created by Tejvir Mann on 8/18/21.
//
/*
 timestamp.
 Playlist: 3d model data. AR session data.
 
 */

import Foundation
import Swift
import FirebaseFirestore
import Firebase
import FirebaseFirestoreSwift
//import CodableFirebase


class Art: Encodable, Decodable, ObservableObject, Identifiable {
   
    enum CodingKeys: CodingKey {

        case artId
        case collection
        case collectionCoverartUrl
        case contentUrl
        case contentType
        case creator
        case creatorId
        //case createdDate
        case createdPrice
        
        case desc
        case forSale
        case forBid //NEW
        case genre
        case history
        //case latestHistoryDate
        //case latestPurchaseDate
        case likes
        case location
        case metadataUrl
        case name
        case owner
        case ownerId
        case popularity
        case price
        case buyNowPrice //NEW
        
        case searchType
        case shareUrl
        case storageName
        case thumbnailUrl
        case tokenId
        
        case unlockableContent
        case geoContent
        case claimableIfNearOnly
        case ownableIfNearOnly
        case licenseType
        case latestPurchasePrice
        case latestPrice
        case isListing
        case collectionRef
        case creatorRef
        case ownerRef

    }
    
    
    @Published var artId: String
    @Published var collection: String
    @Published var collectionCoverartUrl: String
    @Published var contentUrl: String
    @Published var contentType: Int
    @Published var creator: String
    @Published var creatorId: String
    //@Published var createdDate: Timestamp //String
    @Published var createdPrice: Double
    
    @Published var desc: String
    @Published var forSale: Bool
    @Published var forBid: Bool
    @Published var genre: String
    @Published var history: [String]
   // @Published var latestHistoryDate : Timestamp //String
    @Published var likes: Int
    @Published var location: String
    @Published var metadataUrl: String
    @Published var name: String
    @Published var owner: String
    @Published var ownerId: String
    @Published var popularity: Int
    @Published var price: String
    @Published var buyNowPrice: String
    
    @Published var searchType: Int
    @Published var shareUrl: String
    @Published var storageName: String
    @Published var thumbnailUrl: String
    @Published var tokenId: Int
    
    //new params as of 05/20/22
    @Published var unlockableContent: String
    @Published var geoContent: String
    @Published var claimableIfNearOnly: Bool
    @Published var ownableIfNearOnly: Bool
    @Published var licenseType: String
    @Published var latestPurchasePrice: String
    @Published var latestPrice: String
    //@Published var latestPurchaseDate: Timestamp
    @Published var isListing: Bool
    @Published var collectionRef: String
    @Published var creatorRef: String
    @Published var ownerRef: String

    

    init() {
    
        artId = ""
        collection = ""
        collectionCoverartUrl = ""
        contentUrl = ""
        contentType = 0
        creator = ""
        creatorId = ""
        //createdDate = Timestamp()
        createdPrice = 0
        desc = ""
        forSale = false
        forBid = false
        genre = ""
        history = [String]()
       // latestHistoryDate = Timestamp()
        likes = 0
        location = ""
        metadataUrl = ""
        name = ""
        owner = ""
        ownerId = ""
        popularity = 0
        price = ""
        buyNowPrice = ""
        
        searchType = 0
        shareUrl = ""
        storageName = ""
        thumbnailUrl = ""
        tokenId = 0
        
        // latestPurchaseDate = Timestamp()
        unlockableContent = ""
        geoContent = ""
        claimableIfNearOnly = false
        ownableIfNearOnly = false
        licenseType = ""
        latestPurchasePrice = ""
        latestPrice = ""
        isListing = true
        collectionRef = ""
        creatorRef = ""
        ownerRef = ""
        
       

    }


    required init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        artId = try container.decode(String.self, forKey: .artId)
        collection = try container.decode(String.self, forKey: .collection)
        collectionCoverartUrl = try container.decode(String.self, forKey: .collectionCoverartUrl)
        contentUrl = try container.decode(String.self, forKey: .contentUrl)
        contentType = try container.decode(Int.self, forKey: .contentType)
        creator = try container.decode(String.self, forKey: .creator)
        creatorId = try container.decode(String.self, forKey: .creatorId)
      //  createdDate = try container.decode(Timestamp.self, forKey: .createdDate) //Timestamp
        createdPrice = try container.decode(Double.self, forKey: .createdPrice)
        
        desc = try container.decode(String.self, forKey: .desc)
        forSale = try container.decode(Bool.self, forKey: .forSale)
        forBid = try container.decode(Bool.self, forKey: .forBid)
        genre = try container.decode(String.self, forKey: .genre)
        history = try container.decode([String].self, forKey: .history)
   //     latestHistoryDate = try container.decode(Timestamp.self, forKey: .latestHistoryDate)

        likes = try container.decode(Int.self, forKey: .likes)
        location = try container.decode(String.self, forKey: .location)
        metadataUrl = try container.decode(String.self, forKey: .metadataUrl)
        name = try container.decode(String.self, forKey: .name)
        owner = try container.decode(String.self, forKey: .owner)
        ownerId = try container.decode(String.self, forKey: .ownerId)
        popularity = try container.decode(Int.self, forKey: .popularity)
        price = try container.decode(String.self, forKey: .price)
        buyNowPrice = try container.decode(String.self, forKey: .buyNowPrice)
        
        searchType = try container.decode(Int.self, forKey: .searchType)
        shareUrl = try container.decode(String.self, forKey: .shareUrl)
        storageName = try container.decode(String.self, forKey: .storageName)
        thumbnailUrl = try container.decode(String.self, forKey: .thumbnailUrl)
        tokenId = try container.decode(Int.self, forKey: .tokenId)
        
        //latestPurchaseDate = try container.decode(Timestamp.self, forKey: .latestPurchaseDate)
        unlockableContent = try container.decode(String.self, forKey: .unlockableContent)
        geoContent = try container.decode(String.self, forKey: .geoContent)
        claimableIfNearOnly = try container.decode(Bool.self, forKey: .claimableIfNearOnly)
        ownableIfNearOnly = try container.decode(Bool.self, forKey: .ownableIfNearOnly)
        licenseType = try container.decode(String.self, forKey: .licenseType)
        latestPurchasePrice = try container.decode(String.self, forKey: .latestPurchasePrice)
        latestPrice = try container.decode(String.self, forKey: .latestPrice)
        isListing = try container.decode(Bool.self, forKey: .unlockableContent)
        collectionRef = try container.decode(String.self, forKey: .collectionRef)
        creatorRef = try container.decode(String.self, forKey: .creatorRef)
        ownerRef = try container.decode(String.self, forKey: .ownerRef)

        
    }
    
    
    func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
       
        try container.encode(artId, forKey: .artId)
        try container.encode(collection, forKey: .collection)
        try container.encode(collectionCoverartUrl, forKey: .collectionCoverartUrl)
        try container.encode(contentUrl, forKey: .contentUrl)
        try container.encode(contentType, forKey: .contentType)
        try container.encode(creator, forKey: .creator)
        try container.encode(creatorId, forKey: .creatorId)
      //  try container.encode(createdDate, forKey: .createdDate)
        try container.encode(createdPrice, forKey: .createdPrice)
        
        try container.encode(desc, forKey: .desc)
        try container.encode(forSale, forKey: .forSale)
        try container.encode(forBid, forKey: .forBid)
        try container.encode(genre, forKey: .genre)
        try container.encode(history, forKey: .history)
       // try container.encode(latestHistoryDate, forKey: .latestHistoryDate)
        try container.encode(likes, forKey: .likes)
        try container.encode(location, forKey: .location)
        try container.encode(metadataUrl, forKey: .metadataUrl)
        try container.encode(name, forKey: .name)
        try container.encode(owner, forKey: .owner)
        try container.encode(ownerId, forKey: .ownerId)
        try container.encode(popularity, forKey: .popularity)
        try container.encode(price, forKey: .price)
        try container.encode(buyNowPrice, forKey: .buyNowPrice)
        
        try container.encode(searchType, forKey: .searchType)
        try container.encode(shareUrl, forKey: .shareUrl)
        try container.encode(storageName, forKey: .storageName)
        try container.encode(thumbnailUrl, forKey: .thumbnailUrl)
        try container.encode(tokenId, forKey: .tokenId)
        
        //try container.encode(latestPurchaseDate, forKey: .latestPurchaseDate)
        try container.encode(unlockableContent, forKey: .unlockableContent)
        try container.encode(geoContent, forKey: .geoContent)
        try container.encode(claimableIfNearOnly, forKey: .claimableIfNearOnly)
        try container.encode(ownableIfNearOnly, forKey: .ownableIfNearOnly)
        try container.encode(licenseType, forKey: .licenseType)
        try container.encode(latestPrice, forKey: .latestPrice)
        try container.encode(latestPurchasePrice, forKey: .latestPurchasePrice)
        try container.encode(isListing, forKey: .isListing)
        try container.encode(collectionRef, forKey: .collectionRef)
        try container.encode(creatorRef, forKey: .creatorRef)
        try container.encode(ownerRef, forKey: .ownerRef)

        
    }
    
}
