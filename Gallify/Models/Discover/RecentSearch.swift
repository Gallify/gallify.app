//
//  Discover.swift
//  Gallify
//
//  Created by Tejvir Mann on 11/27/21.
//

import Foundation
import Swift
import FirebaseFirestore
import FirebaseFirestoreSwift

class RecentSearch: Encodable, Decodable, ObservableObject {

    enum CodingKeys: CodingKey {

        case recent
        
    }


    var recent: [ContentType]
    

    
    init() {
        
        recent = [ContentType]()

    }

    required init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
    
        recent = try container.decode([ContentType].self, forKey: .recent)
       
    }
    
    func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(recent, forKey: .recent)

      
    }
}

