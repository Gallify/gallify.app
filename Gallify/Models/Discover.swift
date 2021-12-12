//
//  Discover.swift
//  Gallify
//
//  Created by Tejvir Mann on 11/27/21.
//

import Foundation

struct Discover: Codable, Identifiable {
    let id = UUID() //to allow identifiable
    
    let recentSearches: [Playlist]
    
    
}
