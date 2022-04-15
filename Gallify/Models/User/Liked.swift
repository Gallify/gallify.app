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
        case liked
    }
    
    @Published var liked: [String]

    
    init() {

        liked = [String]()

    }

    init(arr: [String]) {
        liked = arr
    }
    required init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
        liked = try container.decode([String].self, forKey: .liked)
       


    }
    
    func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(liked, forKey: .liked)

      
    }
}
