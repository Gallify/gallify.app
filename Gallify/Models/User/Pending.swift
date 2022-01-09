//
//  PendingConnects.swift
//  Gallify
//
//  Created by Tejvir Mann on 1/1/22.
//

import Foundation
import Swift
import FirebaseFirestore
import FirebaseFirestoreSwift

class Pending: Encodable, Decodable, ObservableObject {

    enum CodingKeys: CodingKey {

        case name
        case pending
        
        case genre //these aren't needed, but let's have them!
        case location

    }


    @Published var pending: [String]
    

    
    init() {

        pending = [String]()

    }

    required init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
     
        pending = try container.decode([String].self, forKey: .pending)
       


    }
    
    func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(pending, forKey: .pending)

      
    }
}

