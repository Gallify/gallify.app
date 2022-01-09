//
//  ContentType.swift
//  Gallify
//
//  Created by Tejvir Mann on 1/1/22.
//

import Foundation
import Swift
import FirebaseFirestore
import FirebaseFirestoreSwift

class ContentType: Encodable, Decodable, ObservableObject {

    enum CodingKeys: CodingKey {

        case content_id
        case contentType

    }

    var content_id: String //don't think these need to be published
    var contentType: String
    
    init() {
        
        content_id = ""
        contentType = ""


    }

    required init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
     
        content_id = try container.decode(String.self, forKey: .content_id) //ex. home, abstract, smithsonian
        contentType = try container.decode(String.self, forKey: .contentType)
        
       


    }
    
    func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(content_id, forKey: .content_id)
        try container.encode(contentType, forKey: .contentType)
      
    }
}

