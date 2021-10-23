//
//  File.swift
//  Gallify
//
//  Created by Gianluca Profio on 10/23/21.
//

import Foundation
import SwiftUI

struct Home: Hashable, Codable {
        
    var isFeatured: Bool
    var featuredImageName: String
    
    var featuredImage: Image {
        Image(featuredImageName)
    }
    
}

struct Listing: Hashable, Codable {

    var listingName: String
    var listingDescription: String
    var sellerName: String
    var username: String
    var portfolioValue: Int

    private var listingImageName: String
    var listingImage: Image {
        Image(listingImageName)
    }
    
}

struct Profile: Hashable, Codable {
    
    var name: String
    var location: String
    var rarity: Int
    
    private var usernameImage: String
    var image: Image {
        Image(usernameImage)
    }
    
}
