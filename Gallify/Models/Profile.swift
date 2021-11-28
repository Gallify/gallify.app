//
//  Profile.swift
//  Gallify
//
//  Created by Tejvir Mann on 8/18/21.
//

import Foundation

struct Profile: Codable, Identifiable {
    let id = UUID()
    
    let username: String
    let name: String
    let location: String
    let email: String
    let phone: String
    let title: String //type = Artist, Dealer, Commissioner, Gallerist, Sculpturist, Curator, Collector, Critic
    let followers: Int
    let likes: Int
    let view: Int
    let rarity: Int
    let trendsetter: Int
    let connections: Int
    let membership: Int
    let description: String
    let hyperlink: String
    let followers_doc_id: String
    let followering_doc_id: String
    let connections_doc_id: String
    let profile_pic_url: String
    let background_pic_url: String
    let share_url: String
    let library: [Playlist]
}
