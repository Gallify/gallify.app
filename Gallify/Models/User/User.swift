/*
 This model contains

 Long term: Users: Fields: min info. 2 subcollections. [profile][user-details]
 */

import Foundation
import Swift
import FirebaseFirestore

class User: Encodable, Decodable, ObservableObject, Identifiable {
    
    enum CodingKeys: CodingKey {
        case uid
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
        case wallet
        case featured
        
        case description
        case link
        case liked
        case owned
        case review
        case created
        
        //disable account bool
        
        
        
    }
    
    @Published var uid : String   // NOT sure why all of these are published? @Shruti or @Anshul, you know?
    @Published var firstName: String
    @Published var lastName: String
    @Published var email: String
    @Published var location: String
    
    @Published var MembershipStatus : String
    @Published var profileImageUrl: String
    @Published var username: String
    
    @Published var searchType: String
    @Published var phoneNumber : String
    @Published var trendsetter: Int

    @Published var rarity: Int
    @Published var ranking: Float
    @Published var skill: Int
    
    @Published var Library : [String]   //library=museum
    @Published var popularity: Int

    @Published var followers: Int
    @Published var following: Int
    @Published var connections: Int
    @Published var followersUrl: String
    @Published var followingUrl: String
    @Published var connectionsUrl: String
    @Published var profileUrl: String
    @Published var shareUrl: String
    
    @Published var job: String
    @Published var wallet: String
    @Published var featured: String
    
    @Published var description: String
    @Published var link: String
    @Published var liked: String
    @Published var owned: String
    @Published var review: String
    @Published var created: String
    
  
    init() {
        
        uid = ""
        firstName = ""
        lastName = ""
        email = ""
        location = ""
        
        MembershipStatus = ""
        profileImageUrl = ""
        username = ""
        
        searchType = ""
        phoneNumber = ""
        trendsetter = 0
        
        rarity = 0
        ranking = 0
        skill = 0
        
        Library = [String]()
        popularity = 0

        followers = 0
        following = 0
        connections = 0
        followersUrl = ""
        followingUrl = ""
        connectionsUrl = ""
        profileUrl = ""
        shareUrl = ""
        
        job = ""
        wallet = ""
        featured = ""
        
        description = ""
        link = ""
        liked = ""
        owned = ""
        review = ""
        created = ""
    }

    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        uid = try container.decode(String.self, forKey: .uid)
        firstName = try container.decode(String.self, forKey: .firstName)
        lastName = try container.decode(String.self, forKey: .lastName)
        email = try container.decode(String.self, forKey: .email)
        location = try container.decode(String.self, forKey: .location)
        
        MembershipStatus = try container.decode(String.self, forKey: .MembershipStatus)
        profileImageUrl = try container.decode(String.self, forKey: .profileImageUrl)
        username = try container.decode(String.self, forKey: .username)

        searchType = try container.decode(String.self, forKey: .searchType)
        phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
        trendsetter = try container.decode(Int.self, forKey: .trendsetter)

        rarity = try container.decode(Int.self, forKey: .rarity)
        ranking = try container.decode(Float.self, forKey: .ranking)
        skill = try container.decode(Int.self, forKey: .skill)

        Library = try container.decode([String].self, forKey: .Library)
        popularity = try container.decode(Int.self, forKey: .popularity)

        followers = try container.decode(Int.self, forKey: .followers)
        following = try container.decode(Int.self, forKey: .following)
        connections = try container.decode(Int.self, forKey: .connections)
        followersUrl = try container.decode(String.self, forKey: .followersUrl)
        followingUrl = try container.decode(String.self, forKey: .followingUrl)
        connectionsUrl = try container.decode(String.self, forKey: .connectionsUrl)
        profileUrl = try container.decode(String.self, forKey: .profileUrl)
        shareUrl = try container.decode(String.self, forKey: .shareUrl)
        
        job = try container.decode(String.self, forKey: .job)
        featured = try container.decode(String.self, forKey: .featured)
        wallet = try container.decode(String.self, forKey: .wallet)
        
        description = try container.decode(String.self, forKey: .description)
        link = try container.decode(String.self, forKey: .link)
        liked = try container.decode(String.self, forKey: .liked)
        owned = try container.decode(String.self, forKey: .owned)
        review = try container.decode(String.self, forKey: .review)
        created = try container.decode(String.self, forKey: .created)
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(uid, forKey: .uid)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(email, forKey: .email)
        try container.encode(location, forKey: .location)
        
        try container.encode(MembershipStatus, forKey: .MembershipStatus)
        try container.encode(profileImageUrl, forKey: .profileImageUrl)
        try container.encode(username, forKey: .username)
        
        try container.encode(searchType, forKey: .searchType)
        try container.encode(phoneNumber, forKey: .phoneNumber)
        try container.encode(trendsetter, forKey: .trendsetter)

        try container.encode(rarity, forKey: .rarity)
        try container.encode(ranking, forKey: .ranking)
        try container.encode(skill, forKey: .skill)

        try container.encode(Library, forKey: .Library)
        try container.encode(popularity, forKey: .popularity)
        
        try container.encode(followers, forKey: .followers)
        try container.encode(following, forKey: .following)
        try container.encode(connections, forKey: .connections)
        try container.encode(followersUrl, forKey: .followersUrl)
        try container.encode(followingUrl, forKey: .followingUrl)
        try container.encode(connectionsUrl, forKey: .connectionsUrl)
        try container.encode(profileUrl, forKey: .profileUrl)
        try container.encode(shareUrl, forKey: .shareUrl)
        
        try container.encode(job, forKey: .job)
        try container.encode(featured, forKey: .featured)
        try container.encode(wallet, forKey: .wallet)
        
        try container.encode(description, forKey: .description)
        try container.encode(link, forKey: .link)
        try container.encode(liked, forKey: .liked)
        try container.encode(owned, forKey: .owned)
        try container.encode(review, forKey: .review)
        try container.encode(created, forKey: .created)

    }

}
