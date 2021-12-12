//
//  UserLight.swift
//  Gallify
//  When a user is searched, then this is the min info needed.
//  Created by Tejvir Mann on 12/11/21.
//

import Foundation
import Swift
import FirebaseFirestore

class UserLight: Encodable, Decodable, ObservableObject {

    enum CodingKeys: CodingKey {

        case uid
        case firstName
        case lastName
        case username
        case profileUrl
        case profileImageUrl
        case job
        case MembershipStatus
        case popularity
        case searchType //when search, need to know artist, collection, or art

        
        
    }

    @Published var uid : String
    @Published var firstName: String
    @Published var lastName: String
    @Published var MembershipStatus : String
    @Published var profileImageUrl: String
    @Published var job: String
    @Published var popularity: Int
    @Published var profileUrl: String
    @Published var username: String
    @Published var searchType: String


    init() {

        uid = ""
        firstName = ""
        lastName = ""
        MembershipStatus = ""
        profileImageUrl = ""
        job = ""
        popularity = 0
        profileUrl = ""
        username = ""
        searchType = ""


    }

    required init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
        uid = try container.decode(String.self, forKey: .uid)
        firstName = try container.decode(String.self, forKey: .firstName)
        lastName = try container.decode(String.self, forKey: .lastName)
        MembershipStatus = try container.decode(String.self, forKey: .MembershipStatus)
        profileImageUrl = try container.decode(String.self, forKey: .profileImageUrl)
        job = try container.decode(String.self, forKey: .job)
        popularity = try container.decode(Int.self, forKey: .popularity)
        profileUrl = try container.decode(String.self, forKey: .profileUrl)
        username = try container.decode(String.self, forKey: .username)
        searchType = try container.decode(String.self, forKey: .searchType)


    }
    
    func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(uid, forKey: .uid)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(MembershipStatus, forKey: .MembershipStatus)
        try container.encode(profileImageUrl, forKey: .profileImageUrl)
        try container.encode(job, forKey: .job)
        try container.encode(popularity, forKey: .popularity)
        try container.encode(profileUrl, forKey: .profileUrl)
        try container.encode(searchType, forKey: .searchType)

    }
}
