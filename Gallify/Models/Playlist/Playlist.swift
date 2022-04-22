/*
   Playlist.swift
   Gallify
 
    A playlist is an array of art elements.
 
   Created by Tejvir Mann on 12/11/21.
 
 */

import Foundation
import Swift
import FirebaseFirestore

class Playlist: Encodable, Decodable, ObservableObject, Identifiable {

    enum CodingKeys: CodingKey {

        case name
        case creator
        case creator_url
        case playlist_type //collection, playlist, single, liked, auction, recent activity, owned, query(call to art collection to get list of art documents)
        case share_url
        case auction
        case auction_start
        case auction_end
        case privacy
        case cover_art_url
        case art
        case location
        case genre
        case popularity
        case likes
        case followers_url
        case searchType //when search, need to know artist, collection, or art
        case playlist_id
        case description
        //lat
        //lon
        //time created
        //report


    }

    @Published var name: String
    @Published var creator: String
    @Published var creator_url: String
    @Published var playlist_type: String
    @Published var share_url: String
    @Published var auction: Bool
    @Published var auction_start: Int
    @Published var auction_end: Int
    @Published var privacy: Int
    @Published var cover_art_url: String
    @Published var art: [String]
    @Published var location: String
    @Published var genre: String
    @Published var popularity: Int
    @Published var likes: Int
    @Published var followers_url: String
    @Published var searchType: String
    @Published var playlist_id: String
    @Published var description: String
    
    /*
     "name": "",
     "coverSrc": "resources/image",
     "desc": "",
     "creatorRef": "users/id",
     "createdDate": "Timestamp",
     "isPrivate": false,
     "type": "review|featured|custom|customOwned","singles|album",
     "latestHistoryDate": "Timestamp",
     "artCount": 0
     
     "address": "",
     "coverSrc": "resources/image",
     */

    
    init() {
        
        name = ""
        creator = ""
        creator_url = ""
        playlist_type = ""
        share_url = ""
        auction = false
        auction_start = 0
        auction_end = 0
        privacy = 0
        genre = ""
        location = ""
        cover_art_url = ""
        art = [String]()
        popularity = 0
        likes = 0
        followers_url = ""
        searchType = ""
        playlist_id = ""
        description = ""
    }
    
    init(newName: String, pri: Int, type: String, the_creator: User) {
          name = newName
          creator = the_creator.firstName + " " + the_creator.lastName
          creator_url = the_creator.uid
          playlist_type = type
          share_url = ""
          auction = false
          auction_start = 0
          auction_end = 0
          privacy = pri
          genre = ""
          location = ""
          cover_art_url = ""
          art = [String]()
          popularity = 0
          likes = 0
          followers_url = ""
          searchType = ""
          playlist_id = ""
          description = ""
      }

    required init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
     
        name = try container.decode(String.self, forKey: .name)
        creator = try container.decode(String.self, forKey: .creator)
        creator_url = try container.decode(String.self, forKey: .creator_url)
        playlist_type = try container.decode(String.self, forKey: .playlist_type)
        share_url = try container.decode(String.self, forKey: .share_url)
        auction = try container.decode(Bool.self, forKey: .auction)
        auction_start = try container.decode(Int.self, forKey: .auction_start)
        auction_end = try container.decode(Int.self, forKey: .auction_end)
        genre = try container.decode(String.self, forKey: .genre)
        privacy = try container.decode(Int.self, forKey: .privacy)
        location = try container.decode(String.self, forKey: .location)
        cover_art_url = try container.decode(String.self, forKey: .cover_art_url)
        art = try container.decode([String].self, forKey: .art)
        popularity = try container.decode(Int.self, forKey: .popularity)
        likes = try container.decode(Int.self, forKey: .likes)
        followers_url = try container.decode(String.self, forKey: .followers_url)
        searchType = try container.decode(String.self, forKey: .searchType)
        playlist_id = try container.decode(String.self, forKey: .playlist_id)
        description = try container.decode(String.self, forKey: .description)


    }
    
    func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(creator, forKey: .creator)
        try container.encode(playlist_type, forKey: .playlist_type)
        try container.encode(auction, forKey: .auction)
        try container.encode(auction_start, forKey: .auction_start)
        try container.encode(auction_end, forKey: .auction_end)
        try container.encode(privacy, forKey: .privacy)
        try container.encode(art, forKey: .art)
        try container.encode(followers_url, forKey: .followers_url)
        try container.encode(cover_art_url, forKey: .cover_art_url)
        try container.encode(popularity, forKey: .popularity)
        try container.encode(share_url, forKey: .share_url)
        try container.encode(likes, forKey: .likes)
        try container.encode(genre, forKey: .genre)
        try container.encode(location, forKey: .location)
        try container.encode(creator_url, forKey: .creator_url)
        try container.encode(searchType, forKey: .searchType)
        try container.encode(playlist_id, forKey: .playlist_id)
        try container.encode(description, forKey: .description)

    }
}
