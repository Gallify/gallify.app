//
//  User.swift
//  Gallify
//
//  Created by Tejvir Mann on 12/29/21.
//

//As of 05/31/22 THIS IS UNUSED.


import Foundation

/*
 This model contains

 Long term: Users: Fields: min info. 2 subcollections. [profile][user-details]
 */

import Foundation
import FirebaseFirestoreSwift

struct GetUser: Identifiable, Codable {

    @DocumentID var id: String?
    var firstName: String
    var lastName: String
    var email: String
    var location: String
    var rarity: Int
    var phoneNumber : String
    var trendsetter: Int
    var ranking: Double
    var Library : [String]   //library=museum
    var MembershipStatus : String
    var profileImageUrl: String
    var followers: Int
    var following: Int
    var connections: Int
    var followersUrl: String
    var followingUrl: String
    var connectionsUrl: String
    var job: String
    var skill: Int
    var popularity: Int
    var profileUrl: String
    var shareUrl: String
    var username: String
    var searchType: String

    enum CodingKeys: CodingKey {

        case id
        case firstName
        case lastName
        case email
        case location
        case MembershipStatus
        case profileImageUrl
        case username
        case searchType //when search, need to know artist, collection, or art

        
        case phoneNumber
        
        case trendsetter
        case rarity
        case ranking
        case skill
        case popularity
        
        case Library
        case followers
        case following
        case connections
        case followersUrl
        case followingUrl
        case connectionsUrl
        case profileUrl
        case shareUrl
        case job
    }


    init() {

        id = ""
        firstName = "firebase hasn't gotten name"
        lastName = ""
        email = ""
        location = ""
        rarity = 0
        phoneNumber = ""
        trendsetter = 0
        ranking = 0
        Library = [String]()
      //  Library.append("hello")
        MembershipStatus = ""
        profileImageUrl = ""
        followers = 0
        following = 0
        connections = 0
        followersUrl = ""
        followingUrl = ""
        connectionsUrl = ""
        job = ""
        skill = 0
        popularity = 0
        profileUrl = ""
        shareUrl = ""
        username = ""
        searchType = ""


    }

//    required init(from decoder: Decoder) throws {
//
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        id = try container.decode(String.self, forKey: .id)
//        firstName = try container.decode(String.self, forKey: .firstName)
//        lastName = try container.decode(String.self, forKey: .lastName)
//        email = try container.decode(String.self, forKey: .email)
//        location = try container.decode(String.self, forKey: .location)
//        rarity = try container.decode(Int.self, forKey: .rarity)
//        phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
//        trendsetter = try container.decode(Int.self, forKey: .trendsetter)
//        ranking = try container.decode(Double.self, forKey: .ranking)
//        Library = try container.decode([String].self, forKey: .Library)
//        MembershipStatus = try container.decode(String.self, forKey: .MembershipStatus)
//        profileImageUrl = try container.decode(String.self, forKey: .profileImageUrl)
//        followers = try container.decode(Int.self, forKey: .followers)
//        following = try container.decode(Int.self, forKey: .following)
//        connections = try container.decode(Int.self, forKey: .connections)
//        followersUrl = try container.decode(String.self, forKey: .followersUrl)
//        followingUrl = try container.decode(String.self, forKey: .followingUrl)
//        connectionsUrl = try container.decode(String.self, forKey: .connectionsUrl)
//        job = try container.decode(String.self, forKey: .job)
//        skill = try container.decode(Int.self, forKey: .skill)
//        popularity = try container.decode(Int.self, forKey: .popularity)
//        profileUrl = try container.decode(String.self, forKey: .profileUrl)
//        shareUrl = try container.decode(String.self, forKey: .shareUrl)
//        username = try container.decode(String.self, forKey: .username)
//        searchType = try container.decode(String.self, forKey: .searchType)
//
//    }

    func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(email, forKey: .email)
        try container.encode(location, forKey: .location)
        try container.encode(rarity, forKey: .rarity)
        try container.encode(phoneNumber, forKey: .phoneNumber)
        try container.encode(trendsetter, forKey: .trendsetter)
        try container.encode(ranking, forKey: .ranking)
        try container.encode(Library, forKey: .Library)
        try container.encode(MembershipStatus, forKey: .MembershipStatus)
        try container.encode(profileImageUrl, forKey: .profileImageUrl)
        try container.encode(followers, forKey: .followers)
        try container.encode(following, forKey: .following)
        try container.encode(connections, forKey: .connections)
        try container.encode(followersUrl, forKey: .followersUrl)
        try container.encode(followingUrl, forKey: .followingUrl)
        try container.encode(connectionsUrl, forKey: .connectionsUrl)
        try container.encode(job, forKey: .job)
        try container.encode(skill, forKey: .skill)
        try container.encode(popularity, forKey: .popularity)
        try container.encode(profileUrl, forKey: .profileUrl)
        try container.encode(shareUrl, forKey: .shareUrl)
        try container.encode(username, forKey: .username)
        try container.encode(searchType, forKey: .searchType)

    }

}
