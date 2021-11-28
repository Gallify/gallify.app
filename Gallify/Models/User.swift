//
//  User.swift
//  Gallify
//
//  Created by Anshul on 10/31/21.
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
        case ArtPlaylist
        case MembershipStatus
        case profileImageURL

    }

    @Published var uid : String
    @Published var firstName: String
    @Published var lastName: String
    @Published var email: String
    @Published var location: String
    @Published var rarity: Int
    @Published var phoneNumber : String
    @Published var TrendsetterScore: Int
    @Published var ranking: UInt64
    @Published var ArtPlaylist : [String]
    @Published var MembershipStatus : String
    @Published var profileImageUrl: String



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
        ArtPlaylist = [String]()
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
        ranking = try container.decode(UInt64.self, forKey: .ranking)
        ArtPlaylist = try container.decode([String].self, forKey: .ArtPlaylist)
        MembershipStatus = try container.decode(String.self, forKey: .MembershipStatus)
        profileImageUrl = try container.decode(String.self, forKey: .profileImageURL)

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
        try container.encode(ArtPlaylist, forKey: .ArtPlaylist)
        try container.encode(MembershipStatus, forKey: .MembershipStatus)
        try container.encode(profileImageUrl, forKey: .profileImageURL)

    }

}
