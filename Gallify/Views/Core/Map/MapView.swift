//
//  MapView.swift
//  Gallify
//
//  Created by Tejvir Mann on 7/22/22.
//
import SwiftUI
import MapKit

struct MapView: View {


    @StateObject var locationManager = LocationManager()
    @State var tracking:MapUserTrackingMode = .none
    
    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }
    
    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }


    
    var body: some View {
        
        Map(coordinateRegion: $locationManager.region, showsUserLocation: true)
            .edgesIgnoringSafeArea(.all)
        
    }
}
