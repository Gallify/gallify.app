//
//  home.swift
//  Gallify
//
//  Created by Tejvir Mann on 11/27/21.
//

import Foundation

struct Home: Codable, Identifiable {
    let id = UUID() //to allow identifiable
    
    let recent: [Playlist]
    let madeForYou: [Playlist]
    let auctions: [Playlist]
    
}
