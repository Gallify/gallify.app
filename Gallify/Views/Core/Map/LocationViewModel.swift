//
//  LocationManager.swift
//  Gallify
//
//  Created by Patron on 6/23/22.
//

import CoreLocation

class LocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var authorizationStatus: CLAuthorizationStatus
    @Published var location: CLLocationCoordinate2D?
    
    private let locationManager: CLLocationManager

    override init() {
        
        locationManager = CLLocationManager()
        authorizationStatus = locationManager.authorizationStatus
        
        super.init()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
    }

    func requestLocation() {
        
        locationManager.requestLocation()
        
    }

    func manager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        location = locations.first?.coordinate
        
    }
    
    func requestPermission() {
        
        locationManager.requestWhenInUseAuthorization()
        
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        authorizationStatus = manager.authorizationStatus
        
    }
    
}
