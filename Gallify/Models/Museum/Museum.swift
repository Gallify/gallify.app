/*
   Museum.swift
   Gallify
 
    A museum is an array of playlist elements. 
 
   Created by Tejvir Mann on 12/11/21.
 
 */


import Foundation
import Swift
import FirebaseFirestore

class Museum: Encodable, Decodable, ObservableObject, Identifiable {

    enum CodingKeys: CodingKey {

        case name
        case creator
        case creator_url
        case museum_type //collection, playlist, single, liked, recent activity, owned, query(call to art collection to get list of art documents)
        
        case share_url //this class doesn't need any of this. But I'm leaving it in!
        case auction
        case auction_start
        case auction_end
        case privacy //to here
        
        case cover_art_url
        case playlist
        case location
        case genre
        case popularity
        case likes
        case followers_url //to list of followers of playlist.

    }

    @Published var name: String
    @Published var creator: String
    @Published var creator_url: String
    @Published var museum_type: String
    @Published var share_url: String
    @Published var auction: Bool
    @Published var auction_start: Int
    @Published var auction_end: Int
    @Published var privacy: Int
    @Published var cover_art_url: String
    @Published var playlist: [String]
    @Published var location: String
    @Published var genre: String
    @Published var popularity: Int
    @Published var likes: Int
    @Published var followers_url: String
    
    init() {
        
        name = ""
        creator = ""
        creator_url = ""
        museum_type = ""
        share_url = ""
        auction = false
        auction_start = 0
        auction_end = 0
        privacy = 0
        genre = ""
        location = ""
        cover_art_url = ""
        playlist = [String]()
        popularity = 0
        likes = 0
        followers_url = ""
    }

    required init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
     
        name = try container.decode(String.self, forKey: .name)
        creator = try container.decode(String.self, forKey: .creator)
        creator_url = try container.decode(String.self, forKey: .creator_url)
        museum_type = try container.decode(String.self, forKey: .museum_type)
        share_url = try container.decode(String.self, forKey: .share_url)
        auction = try container.decode(Bool.self, forKey: .auction)
        auction_start = try container.decode(Int.self, forKey: .auction_start)
        auction_end = try container.decode(Int.self, forKey: .auction_end)
        genre = try container.decode(String.self, forKey: .genre)
        privacy = try container.decode(Int.self, forKey: .privacy)
        location = try container.decode(String.self, forKey: .location)
        cover_art_url = try container.decode(String.self, forKey: .cover_art_url)
        playlist = try container.decode([String].self, forKey: .playlist)
        popularity = try container.decode(Int.self, forKey: .popularity)
        likes = try container.decode(Int.self, forKey: .likes)
        followers_url = try container.decode(String.self, forKey: .followers_url)


    }
    
    func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(creator, forKey: .creator)
        try container.encode(museum_type, forKey: .museum_type)
        try container.encode(auction, forKey: .auction)
        try container.encode(auction_start, forKey: .auction_start)
        try container.encode(auction_end, forKey: .auction_end)
        try container.encode(privacy, forKey: .privacy)
        try container.encode(playlist, forKey: .playlist)
        try container.encode(followers_url, forKey: .followers_url)
        try container.encode(cover_art_url, forKey: .cover_art_url)
        try container.encode(popularity, forKey: .popularity)
        try container.encode(share_url, forKey: .share_url)
        try container.encode(likes, forKey: .likes)
        try container.encode(genre, forKey: .genre)
        try container.encode(location, forKey: .location)
        try container.encode(creator_url, forKey: .creator_url)
    }
}

