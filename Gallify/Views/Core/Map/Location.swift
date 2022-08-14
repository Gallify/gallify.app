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

struct VeganFoodPlace: Identifiable {
    var id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
      CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

struct Location2: Identifiable {
    var id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    let playlist: Playlist
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: playlist.lat, longitude: playlist.lon)
    }
}
