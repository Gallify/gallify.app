//
//  TempMapView.swift
//  Gallify
//
//  Created by Patron on 6/23/22.
//
import SwiftUI

struct TempMapView: View {
    
 //   @EnvironmentObject var locationViewModel: LocationViewModel
   // @EnvironmentObject var locationManager : LocationManager()
    
    
    var body: some View {
        
        let screenHeight = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width
        
//        var userLatitude: String {
//            return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
//        }
//
//        var userLongitude: String {
//            return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
//        }
        
        VStack {
            
            Text("In order to use this feature, you need to share your location with the Gallify App.")
                .multilineTextAlignment(.center)
                .padding(.horizontal, screenWidth / 25)
                .padding(.vertical, screenHeight / 54)
            
            Button(action: {
                
            //    locationManager.requestPermission()
                
            }, label: {
                
                Text("Share location")
                    .font(.system(size: screenWidth / 25, weight: .semibold))
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(screenWidth / 10)
                    .padding(.horizontal, screenWidth / 25)
                    .padding(.vertical, screenHeight / 54)
                
            })
            
        }
        
    }
    
}
