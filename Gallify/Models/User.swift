//
//  User.swift
//  Gallify
//
//  Created by Patron on 10/31/21.
//
import Foundation
import Swift
import FirebaseFirestore

class User: Encodable, Decodable, ObservableObject {

    enum CodingKeys: CodingKey {

        case uid
        case firstName
        case lastName
        case email
        case location
        case rarity
        case phoneNumber
        case TrensetterScore
        case ranking
        case Library
        case MembershipStatus
        case profileImageUrl
        case followers
        case following
        case connections
        case are_following
        case are_connected
        case followersUrl
        case followingUrl
        case connectionsUrl
        case job
        case skill
    }

    @Published var uid : String
    @Published var firstName: String
    @Published var lastName: String
    @Published var email: String
    @Published var location: String
    @Published var rarity: Int
    @Published var phoneNumber : String
    @Published var TrendsetterScore: Int
    @Published var ranking: Double
    @Published var Library : [String]   //library=museum
    @Published var MembershipStatus : String
    @Published var profileImageUrl: String
//    @Published var followers: Int
//    @Published var following: Int
//    @Published var connections: Int
//    @Published var are_following: Bool
//    @Published var are_connected: Bool
//    @Published var followersUrl: String
//    @Published var followingUrl: String
//    @Published var connectionsUrl: String
//    @Published var job: String
//    @Published var skill: Int




    init() {

        uid = ""
        firstName = ""
        lastName = ""
        email = ""
        location = ""
        rarity = 0
        phoneNumber = ""
        TrendsetterScore = 0
        ranking = 0
        Library = [String]()
        MembershipStatus = ""
        profileImageUrl = ""

    }

    required init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
        uid = try container.decode(String.self, forKey: .uid)
        firstName = try container.decode(String.self, forKey: .firstName)
        lastName = try container.decode(String.self, forKey: .lastName)
        email = try container.decode(String.self, forKey: .email)
        location = try container.decode(String.self, forKey: .location)
        rarity = try container.decode(Int.self, forKey: .rarity)
        phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
        TrendsetterScore = try container.decode(Int.self, forKey: .TrensetterScore)
        ranking = try container.decode(Double.self, forKey: .ranking)
        Library = try container.decode([String].self, forKey: .Library)
        MembershipStatus = try container.decode(String.self, forKey: .MembershipStatus)
        profileImageUrl = try container.decode(String.self, forKey: .profileImageUrl)

    }
//
    func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(uid, forKey: .uid)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(email, forKey: .email)
        try container.encode(location, forKey: .location)
        try container.encode(rarity, forKey: .rarity)
        try container.encode(phoneNumber, forKey: .phoneNumber)
        try container.encode(TrendsetterScore, forKey: .TrensetterScore)
        try container.encode(ranking, forKey: .ranking)
        try container.encode(Library, forKey: .Library)
        try container.encode(MembershipStatus, forKey: .MembershipStatus)
        try container.encode(profileImageUrl, forKey: .profileImageUrl)

    }

}
