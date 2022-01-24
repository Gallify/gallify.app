//
//  Following.swift
//  Gallify
//
//  Created by Tejvir Mann on 1/1/22.
//
import Foundation
import Swift
import FirebaseFirestore
import FirebaseFirestoreSwift

class Following: Encodable, Decodable, ObservableObject {

    enum CodingKeys: CodingKey {
        case following
    }
    
    @Published var following: [String]

    
    init() {

        following = [String]()

    }

    init(arr: [String]) {
        following = arr
    }
    required init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
        following = try container.decode([String].self, forKey: .following)
       


    }
    
    func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(following, forKey: .following)

      
    }
}
