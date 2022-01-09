//
//  Followers.swift
//  Gallify
//
//  Created by Tejvir Mann on 1/1/22.
//

import Foundation
import Swift
import FirebaseFirestore
import FirebaseFirestoreSwift

class Followers: Encodable, Decodable, ObservableObject {

    enum CodingKeys: CodingKey {

  
        case followers


    }

  
    @Published var followers: [String]
    

    
    init() {
        

        followers = [String]()

    }

    required init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
     

        followers = try container.decode([String].self, forKey: .followers)
       


    }
    
    func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: CodingKeys.self)
    
        try container.encode(followers, forKey: .followers)

      
    }
}

