//
//  MapView.swift
//  Gallify
//
//  Created by Tejvir Mann on 7/22/22.
//
import SwiftUI
import MapKit
import SDWebImageSwiftUI

struct MapView: View {


    @StateObject var locationManager = LocationManager()
    @State var tracking:MapUserTrackingMode = .none
    @EnvironmentObject var firestoreQuery : FirestoreQuery
    @EnvironmentObject var mapQuery : MapQuery
    
    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }
    
    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }
    
    
    let veganPlacesInRiga = [
      VeganFoodPlace(name: "Kozy Eats", latitude: 56.951924, longitude: 24.125584),
      VeganFoodPlace(name: "Green Pumpkin", latitude:  56.967520, longitude: 24.105760),
      VeganFoodPlace(name: "Terapija", latitude: 56.9539906, longitude: 24.13649290000000)
    ]

    let location2 = [
        Location2(name: "Kozy Eats", latitude: 43.068625, longitude: -89.431415, playlist: Playlist(lati: 43.068625, long: -89.431415)),
        Location2(name: "Green Pumpkin", latitude:  43.055582, longitude: -89.447562, playlist: Playlist(lati: 43.055582, long: -89.447562)),
        Location2(name: "Terapija", latitude: 43.045295, longitude: -89.466113, playlist: Playlist(lati: 43.045295, long: -89.466113))
    ]


    var body: some View {

        VStack{
            NavigationView{
                
                
                Map(coordinateRegion: $locationManager.region, showsUserLocation: true, annotationItems: location2){ place in
                    
                    MapAnnotation(coordinate: place.coordinate) {
                        NavigationLink(destination: CollectionGenericView(playlist: place.playlist),label: {
                                VStack{
                                    AnimatedImage(url: URL(string: place.playlist.coverArtUrl))
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipped()
                                }
                                .shadow(radius: 10)
                        })
                    }
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
        .onAppear{ Task { await NetworkingCall() } }
      
    }
    
    func NetworkingCall() async {
        let radiusValue = 50 * 1000
        await mapQuery.getPlaylistNearby(lat: Int(userLatitude) ?? 0, lon: Int(userLongitude) ?? 0, radius: Double(radiusValue))
    }
}
