//
//  PlaylistSaveData.swift
//  Gallify
//
//  Created by Dhruv Gupta on 2/13/22.
//


import Foundation
import Swift
import FirebaseFirestore
import FirebaseFirestoreSwift

class PlaylistSaveData: Encodable, Decodable, ObservableObject, Identifiable {

    enum CodingKeys: CodingKey {

        case name
        case scale_compensation
        case transform
        
    }

    @Published var name: String
    @Published var scale_compensation : Float
    @Published var transform : [Float]
    
    init() {

        name = ""
        scale_compensation = 0
        transform = []
    }

    required init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
     
        name = try container.decode(String.self, forKey: .name)
        scale_compensation = try container.decode(Float.self, forKey: .scale_compensation)
        transform = try container.decode([Float].self, forKey: .transform)
        
    }
    
    func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(name, forKey: .name)
        try container.encode(scale_compensation, forKey: .scale_compensation)
        try container.encode(transform, forKey: .transform)
    }
}
