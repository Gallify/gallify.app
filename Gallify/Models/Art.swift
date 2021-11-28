//
//  Art.swift
//  Gallify
//
//  Created by Tejvir Mann on 8/18/21.
//

import Foundation

struct Art: Codable, Identifiable {
    let id = UUID() //to allow identifiable
    
    let name: String
    let location: String
    let ipfs_metadata: Data
    let ipfs_image_url: Data
    let price: Int
    let description: String
    let token_id: String
    let time: String
    let likes: Int
    let popularity: String
    let creator: String
    let owner: String //if user = owner we can hide the 'buy/bid'
    let creator_url: String
    let owner_url: String
    let collection: String
    let collection_url: String
    let transaction_url: String //url to take them to our site to buy/bid
    let share_url: String
    let released: String
    let released_price: Int
    let liked: Bool
    let transaction_type: String  // buy/sell/bid/not for sale
    let transaction_type_url: String
}
