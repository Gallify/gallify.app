//
//  Art.swift
//  Gallify
//
//  Created by Tejvir Mann on 8/18/21.
//


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
        case artwork_url //g o n e
        case popularity
        case share_url
        case art_id //if add to playlist
        case content_type
        case price
        case likes
        case genre
        case time //when released
        case location
        case creator_url
        case searchType //when search, need to know artist, collection, or art
        
        
    }

    @Published var art_id : String
    @Published var name: String
    @Published var creator: String
    @Published var content_url: String
    @Published var thumbnail: String
    @Published var collection_coverart_url: String
    @Published var popularity: Int
    @Published var artwork_url: String
    @Published var share_url: String
    @Published var content_type: Int
    @Published var price: Int
    @Published var likes: Int
    @Published var genre: String
    @Published var time: Int
    @Published var location: String
    @Published var creator_url: String
    @Published var searchType: String

    
    init() {

        art_id = ""
        name = ""
        creator = ""
        content_url = ""
        thumbnail = ""
        collection_coverart_url = ""
        popularity = 0
        artwork_url = ""
        share_url = ""
        content_type = 0
        price = 0
        likes = 0
        time = 0
        genre = ""
        location = ""
        creator_url = ""
        searchType = ""
        

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
        artwork_url = try container.decode(String.self, forKey: .artwork_url)
        share_url = try container.decode(String.self, forKey: .share_url)
        content_type = try container.decode(Int.self, forKey: .content_type)
        price = try container.decode(Int.self, forKey: .price)
        likes = try container.decode(Int.self, forKey: .likes)
        genre = try container.decode(String.self, forKey: .genre)
        time = try container.decode(Int.self, forKey: .time)
        location = try container.decode(String.self, forKey: .location)
        creator_url = try container.decode(String.self, forKey: .creator_url)
        searchType = try container.decode(String.self, forKey: .searchType)


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
        try container.encode(artwork_url, forKey: .artwork_url)
        try container.encode(share_url, forKey: .share_url)
        try container.encode(content_type, forKey: .content_type)
        try container.encode(price, forKey: .price)
        try container.encode(likes, forKey: .likes)
        try container.encode(genre, forKey: .genre)
        try container.encode(time, forKey: .time)
        try container.encode(location, forKey: .location)
        try container.encode(creator_url, forKey: .creator_url)
        try container.encode(searchType, forKey: .searchType)

    }
}
