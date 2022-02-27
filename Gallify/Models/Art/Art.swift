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

class Art: Encodable, Decodable, ObservableObject, Identifiable {

    enum CodingKeys: CodingKey {

        case name
        case creator
        case content_url 
        case thumbnail
        case collection_coverart_url
        //case artwork_url //g o n e
        case popularity
        case share_url
        case art_id //if add to playlist
        case content_type
        case price
        case likes
        case genre
        case location
        case creator_url
        case searchType //when search, need to know artist, collection, or art
        
        case owner
        case content_url_ipfs
        case price_url_ipfs
        case owner_url_ipfs
        case thumbnail_url_ipfs
        case collection
        case lastSoldPrice
        case lastSold_timestamp
        case created_timestamp //t
        case createdPrice
        case token_id
        case description
        
        
        
    }

    @Published var art_id : String
    @Published var name: String
    @Published var creator: String
    @Published var content_url: String
    @Published var thumbnail: String
    @Published var collection_coverart_url: String
    @Published var popularity: Int
    @Published var share_url: String
    @Published var content_type: Int
    @Published var price: Float
    @Published var likes: Int
    @Published var genre: String
    @Published var location: String
    @Published var creator_url: String
    @Published var searchType: String
    
    @Published var owner: String
    @Published var content_url_ipfs: String
    @Published var price_url_ipfs: String
    @Published var owner_url_ipfs: String
    @Published var thumbnail_url_ipfs: String
    @Published var collection: String
    @Published var lastSoldPrice: Float
    @Published var created_timestamp: Int
    @Published var lastSold_timestamp: Int
    @Published var createdPrice: Float
    @Published var token_id: String
    @Published var description: String

    
    init() {

        art_id = ""
        name = ""
        creator = ""
        content_url = ""
        thumbnail = ""
        collection_coverart_url = ""
        popularity = 0
        share_url = ""
        content_type = 0 // 0, 1, 2. 0 = image. 1 = 3d model. 2= unapproved. 
        price = 0
        likes = 0
        genre = ""
        location = ""
        creator_url = ""
        searchType = ""  //contains the filepath name of the model stored in firebase storage.
        
        //owner, collection, last sold, created date, tokenid. description, playlist, last sold, released, released price,token_id
        
        owner = ""
        content_url_ipfs = ""
        price_url_ipfs = ""
        owner_url_ipfs = ""
        thumbnail_url_ipfs = ""
        collection = ""
        lastSoldPrice = 0
        lastSold_timestamp = 0
        created_timestamp = 0 //t
        createdPrice = 0
        token_id = ""
        description = ""
        

    }

    required init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
     
        art_id = try container.decode(String.self, forKey: .art_id)
        name = try container.decode(String.self, forKey: .name)
        creator = try container.decode(String.self, forKey: .creator)
        content_url = try container.decode(String.self, forKey: .content_url)
        thumbnail = try container.decode(String.self, forKey: .thumbnail)
        collection_coverart_url = try container.decode(String.self, forKey: .collection_coverart_url)
        popularity = try container.decode(Int.self, forKey: .popularity)
        share_url = try container.decode(String.self, forKey: .share_url)
        content_type = try container.decode(Int.self, forKey: .content_type)
        price = try container.decode(Float.self, forKey: .price)
        likes = try container.decode(Int.self, forKey: .likes)
        genre = try container.decode(String.self, forKey: .genre)
        location = try container.decode(String.self, forKey: .location)
        creator_url = try container.decode(String.self, forKey: .creator_url)
        searchType = try container.decode(String.self, forKey: .searchType)
       
        owner = try container.decode(String.self, forKey: .owner)
        content_url_ipfs = try container.decode(String.self, forKey: .content_url_ipfs)
        price_url_ipfs = try container.decode(String.self, forKey: .price_url_ipfs)
        owner_url_ipfs = try container.decode(String.self, forKey: .owner_url_ipfs)
        thumbnail_url_ipfs = try container.decode(String.self, forKey: .thumbnail_url_ipfs)
        collection = try container.decode(String.self, forKey: .collection)
        lastSoldPrice = try container.decode(Float.self, forKey: .lastSoldPrice)
        lastSold_timestamp = try container.decode(Int.self, forKey: .lastSold_timestamp)
        created_timestamp = try container.decode(Int.self, forKey: .created_timestamp)
        createdPrice = try container.decode(Float.self, forKey: .createdPrice)
        token_id = try container.decode(String.self, forKey: .token_id)
        description = try container.decode(String.self, forKey: .description)
    }
    
    func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(art_id, forKey: .art_id)
        try container.encode(name, forKey: .name)
        try container.encode(creator, forKey: .creator)
        try container.encode(content_url, forKey: .content_url)
        try container.encode(thumbnail, forKey: .thumbnail)
        try container.encode(collection_coverart_url, forKey: .collection_coverart_url)
        try container.encode(popularity, forKey: .popularity)
        try container.encode(share_url, forKey: .share_url)
        try container.encode(content_type, forKey: .content_type)
        try container.encode(price, forKey: .price)
        try container.encode(likes, forKey: .likes)
        try container.encode(genre, forKey: .genre)
        try container.encode(location, forKey: .location)
        try container.encode(creator_url, forKey: .creator_url)
        try container.encode(searchType, forKey: .searchType)
        
        try container.encode(owner, forKey: .owner)
        try container.encode(content_url_ipfs, forKey: .content_url_ipfs)
        try container.encode(price_url_ipfs, forKey: .price_url_ipfs)
        try container.encode(owner_url_ipfs, forKey: .owner_url_ipfs)
        try container.encode(thumbnail_url_ipfs, forKey: .thumbnail_url_ipfs)
        try container.encode(collection, forKey: .collection)
        try container.encode(lastSoldPrice, forKey: .lastSoldPrice)
        try container.encode(lastSold_timestamp, forKey: .lastSold_timestamp)
        try container.encode(created_timestamp, forKey: .created_timestamp)
        try container.encode(createdPrice, forKey: .createdPrice)
        try container.encode(token_id, forKey: .token_id)
        try container.encode(description, forKey: .description)
    }
    
}
