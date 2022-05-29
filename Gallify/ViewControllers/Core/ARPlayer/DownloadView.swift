//
//  downloadView.swift
//  Gallify
//
//  Created by Tejvir Mann on 5/28/22.
//

import SwiftUI
import Foundation
import CoreLocation
import Combine
import SDWebImageSwiftUI

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {

    private let locationManager = CLLocationManager()
    @Published var locationStatus: CLAuthorizationStatus?
    @Published var lastLocation: CLLocation?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

   
    var statusString: String {
        guard let status = locationStatus else {
            return "unknown"
        }
        
        switch status {
        case .notDetermined: return "notDetermined"
        case .authorizedWhenInUse: return "authorizedWhenInUse"
        case .authorizedAlways: return "authorizedAlways"
        case .restricted: return "restricted"
        case .denied: return "denied"
        default: return "unknown"
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        locationStatus = status
        print(#function, statusString)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        lastLocation = location
        print(#function, location)
    }
}




struct DownloadView: View {
    @StateObject var locationManager = LocationManager()
    
    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }
    
    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }

    @EnvironmentObject var firestoreQuery : FirestoreQuery
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width

    var body: some View {
        Text("Point device at this object to load gallery.")
            .font(Font.headline.weight(.semibold))
        
        WebImage(url: URL(string: firestoreQuery.playlistThatsPlaying.cover_art_url))
        .resizable()
        .scaledToFill()
        .frame(width: screenWidth/1.3, height: screenWidth/1.3)
        .clipped()
        .cornerRadius(5.0)
        
        
        
        VStack {
//                Text("location status: \(locationManager.statusString)")
//                HStack {
//                    Text("latitude: \(userLatitude)")
//                    Text("longitude: \(userLongitude)")
//                }
            HStack {
                Text("\(userLatitude)" + " " + "\(userLongitude)")
                
            }
        }
    }
}
