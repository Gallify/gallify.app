//
//  Location.swift
//  Gallify
//
//  Created by Patron on 6/8/22.
//
import Foundation
import MapKit

struct Location: Identifiable {
    
    let id = UUID()
    let playlist: Playlist
    let coordinate: CLLocationCoordinate2D
    
}
