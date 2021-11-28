//
//  Collection.swift
//  Gallify
//
//  Created by Tejvir Mann on 11/24/21.
//

import Foundation

struct Playlist: Codable, Identifiable {   //playlist = collection, single, playlist
    let id = UUID()
    
    let artwork_doc_ids: [String]
    let playlist_pic_url: String
    let name: String
    let creator: String
    let share_url: String
    let artwork: [Art]
    let auction: Bool
    let auction_start: Int
    let auction_end: Int
    
}
