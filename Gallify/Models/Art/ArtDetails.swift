//
//  ArtDetails.swift
//  Gallify
//
//  Created by Tejvir Mann on 8/18/21.
//


import Foundation
import Swift
import FirebaseFirestore

class ArtDetails: Encodable, Decodable, ObservableObject {

    enum CodingKeys: CodingKey {

 
        case description
        case ipfs_metadata_url
        case ipfs_image_url
        case contract_url
        case token_id
        case owner_url
        case owner
        case collection
        case collection_url
        case transaction_url
        case released_price
        case transaction_type
        case transaction_type_url
        case bids
        case lastSold
        case lastSoldPrice
        
        
    }

    @Published var description : String
    @Published var ipfs_metadata_url: String
    @Published var ipfs_image_url: String
    @Published var token_id: String
    @Published var contract_url: String
    @Published var owner_url: String
    @Published var owner: String
    @Published var collection: String
    @Published var collection_url: String
    @Published var transaction_url: String
    @Published var transaction_type: Int
    @Published var released_price: Int
    @Published var bids: Int
    @Published var lastSold: Int
    @Published var lastSoldPrice: Int

    init() {

        description = ""
        ipfs_metadata_url = ""
        ipfs_image_url = ""
        token_id = ""
        contract_url = ""
        owner_url = ""
        owner = ""
        collection = ""
        collection_url = ""
        transaction_url = ""
        transaction_type = 0
        released_price = -1
        bids = -1
        lastSold = -1
        lastSoldPrice = -1

    }

    required init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
     
        description = try container.decode(String.self, forKey: .description)
        ipfs_metadata_url = try container.decode(String.self, forKey: .ipfs_metadata_url)
        ipfs_image_url = try container.decode(String.self, forKey: .ipfs_image_url)
        token_id = try container.decode(String.self, forKey: .token_id)
        contract_url = try container.decode(String.self, forKey: .contract_url)
        owner_url = try container.decode(String.self, forKey: .owner_url)
        owner = try container.decode(String.self, forKey: .owner)
        collection = try container.decode(String.self, forKey: .collection)
        collection_url = try container.decode(String.self, forKey: .collection_url)
        transaction_url = try container.decode(String.self, forKey: .transaction_url)
        transaction_type = try container.decode(Int.self, forKey: .transaction_type)
        released_price = try container.decode(Int.self, forKey: .released_price)
        bids = try container.decode(Int.self, forKey: .bids)
        lastSold = try container.decode(Int.self, forKey: .lastSold)
        lastSoldPrice = try container.decode(Int.self, forKey: .lastSoldPrice)

    }
    
    func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(description, forKey: .description)
        try container.encode(ipfs_metadata_url, forKey: .ipfs_metadata_url)
        try container.encode(ipfs_image_url, forKey: .ipfs_image_url)
        try container.encode(token_id, forKey: .token_id)
        try container.encode(contract_url, forKey: .contract_url)
        try container.encode(owner_url, forKey: .owner_url)
        try container.encode(owner, forKey: .owner)
        try container.encode(collection, forKey: .collection)
        try container.encode(collection_url, forKey: .collection_url)
        try container.encode(transaction_url, forKey: .transaction_url)
        try container.encode(transaction_type, forKey: .transaction_type)
        try container.encode(released_price, forKey: .released_price)
        try container.encode(bids, forKey: .bids)
        try container.encode(lastSold, forKey: .lastSold)
        try container.encode(lastSoldPrice, forKey: .lastSoldPrice)

        
    }
}
