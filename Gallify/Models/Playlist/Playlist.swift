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
        case creatorUrl
        case playlistType //collection, playlist, single, liked, auction, recent activity, owned, query(call to art collection to get list of art documents)
        case shareUrl
        case auction
        case auctionStart
        case auctionEnd
        case privacy
        case coverArtUrl
        case art
        case location
        case genre
        case popularity
        case likes
        case followersUrl
        case searchType //when search, need to know artist, collection, or art
        case playlistId
        case description
        case lat
        case lon
        case address //to view on polyscan. 
        case modifiedDate
        case createdDate
        case creatorRef
        case isSingles
        


    }

    @Published var name: String
    @Published var creator: String
    @Published var creatorUrl: String
    @Published var playlistType: String
    @Published var shareUrl: String
    @Published var auction: Bool
    @Published var auctionStart: Int
    @Published var auctionEnd: Int
    @Published var privacy: Int
    @Published var coverArtUrl: String
    @Published var art: [String]
    @Published var location: String
    @Published var genre: String
    @Published var popularity: Int
    @Published var likes: Int
    @Published var followersUrl: String
    @Published var searchType: String
    @Published var playlistId: String
    @Published var description: String
    
    @Published var lat: Double //large decimal.
    @Published var lon: Double
    @Published var address: String
    @Published var modifiedDate: Int
    @Published var createdDate: Int
    @Published var creatorRef: String
    @Published var isSingles: Bool
    
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
        creatorUrl = ""
        playlistType = ""
        shareUrl = ""
        auction = false
        auctionStart = 0
        auctionEnd = 0
        privacy = 0
        genre = ""
        location = ""
        coverArtUrl = ""
        art = [String]()
        popularity = 0
        likes = 0
        followersUrl = ""
        searchType = ""
        playlistId = ""
        description = ""
       
        lat = 0.0
        lon = 0.0
        address = ""
        modifiedDate = 0
        createdDate = 0
        creatorRef = ""
        isSingles = false
        
        
    }
    
    init(newName: String, pri: Int, type: String, the_creator: User) {
          name = newName
          creator = the_creator.displayName
          creatorUrl = the_creator.uid
          playlistType = type
          shareUrl = ""
          auction = false
          auctionStart = 0
          auctionEnd = 0
          privacy = pri
          genre = ""
          location = ""
          coverArtUrl = ""
          art = [String]()
          popularity = 0
          likes = 0
          followersUrl = ""
          searchType = ""
          playlistId = ""
          description = ""
          lat = 0.0
          lon = 0.0
          address = ""
          modifiedDate = 0
          createdDate = 0
          creatorRef = ""
          isSingles = false
        
      }

    required init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
     
        name = try container.decode(String.self, forKey: .name)
        creator = try container.decode(String.self, forKey: .creator)
        creatorUrl = try container.decode(String.self, forKey: .creatorUrl)
        playlistType = try container.decode(String.self, forKey: .playlistType)
        shareUrl = try container.decode(String.self, forKey: .shareUrl)
        auction = try container.decode(Bool.self, forKey: .auction)
        auctionStart = try container.decode(Int.self, forKey: .auctionStart)
        auctionEnd = try container.decode(Int.self, forKey: .auctionEnd)
        genre = try container.decode(String.self, forKey: .genre)
        privacy = try container.decode(Int.self, forKey: .privacy)
        location = try container.decode(String.self, forKey: .location)
        coverArtUrl = try container.decode(String.self, forKey: .coverArtUrl)
        art = try container.decode([String].self, forKey: .art)
        popularity = try container.decode(Int.self, forKey: .popularity)
        likes = try container.decode(Int.self, forKey: .likes)
        followersUrl = try container.decode(String.self, forKey: .followersUrl)
        searchType = try container.decode(String.self, forKey: .searchType)
        playlistId = try container.decode(String.self, forKey: .playlistId)
        description = try container.decode(String.self, forKey: .description)
        lat = try container.decode(Double.self, forKey: .lat)
        lon = try container.decode(Double.self, forKey: .lon)
        address = try container.decode(String.self, forKey: .lon)
        modifiedDate = try container.decode(Int.self, forKey: .modifiedDate)
        createdDate = try container.decode(Int.self, forKey: .createdDate)
        creatorRef = try container.decode(String.self, forKey: .creatorRef)
        isSingles = try container.decode(Bool.self, forKey: .isSingles)

    }
    
    func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(creator, forKey: .creator)
        try container.encode(playlistType, forKey: .playlistType)
        try container.encode(auction, forKey: .auction)
        try container.encode(auctionStart, forKey: .auctionStart)
        try container.encode(auctionEnd, forKey: .auctionEnd)
        try container.encode(privacy, forKey: .privacy)
        try container.encode(art, forKey: .art)
        try container.encode(followersUrl, forKey: .followersUrl)
        try container.encode(coverArtUrl, forKey: .coverArtUrl)
        try container.encode(popularity, forKey: .popularity)
        try container.encode(shareUrl, forKey: .shareUrl)
        try container.encode(likes, forKey: .likes)
        try container.encode(genre, forKey: .genre)
        try container.encode(location, forKey: .location)
        try container.encode(creatorUrl, forKey: .creatorUrl)
        try container.encode(searchType, forKey: .searchType)
        try container.encode(playlistId, forKey: .playlistId)
        try container.encode(description, forKey: .description)
        try container.encode(lat, forKey: .lat)
        try container.encode(lon, forKey: .lon)
        try container.encode(address, forKey: .address)
        try container.encode(modifiedDate, forKey: .modifiedDate)
        try container.encode(createdDate, forKey: .createdDate)
        try container.encode(creatorRef, forKey: .creatorRef)
        try container.encode(isSingles, forKey: .isSingles)


    }
}
