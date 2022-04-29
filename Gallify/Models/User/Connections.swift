//
//  Connections.swift
//  Gallify
//
//  Created by Tejvir Mann on 1/1/22.
//

import Foundation
import Swift
import FirebaseFirestore
import FirebaseFirestoreSwift

class Connections: Encodable, Decodable, ObservableObject {

    enum CodingKeys: CodingKey {

        case connections


    }

    @Published var connections: [String]
    /*
     {
     {
       "connection Ref": "users/id",
       "connectedRef": "users/id"
        timestamp
     }
     }
     */

    
    init() {
        
        connections = [String]()

    }

    required init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
     
        connections = try container.decode([String].self, forKey: .connections)
       


    }
    
    func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(connections, forKey: .connections)

      
    }
}

