//
//  Liked.swift
//  Gallify
//
//  Created by Shruti Sharma on 4/7/22.
//

import Foundation
import Swift
import FirebaseFirestore
import FirebaseFirestoreSwift

class Liked: Encodable, Decodable, ObservableObject {

    enum CodingKeys: CodingKey {
        case artId
        case userId
        case time
    }

    @Published var artId: String
    @Published var userId: String
    @Published var time: Timestamp
    /*
     "artId": "art/id",
     "userId": "users/id"
   timestamp
     */

    init() {

        artId = ""
        userId = ""
        time = Timestamp()
    }

    required init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
        artId = try container.decode(String.self, forKey: .artId)
        userId = try container.decode(String.self, forKey: .userId)
        time = try container.decode(Timestamp.self, forKey: .time)
    }
    
    func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(artId, forKey: .artId)
        try container.encode(userId, forKey: .userId)
        try container.encode(time, forKey: .time)
    }
        
}
