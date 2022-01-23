//
//  ExpandedHeader.swift
//  Gallify
//
//  Created by Gianluca Profio on 9/26/21.
//

import SwiftUI
import RealityKit
import UIKit
import ARKit



//struct SwiftUIView: View {
//    var body: some View {
//        SwiftUIViewController()
//    }
//}

struct CollectionReelHeader: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//    @StateObject var placementSettings = PlacementSettings() //this allows FullARView to pass the placement settings(where to place an object throughout many of it's connected views
//    @StateObject var sessionSettings = SessionSettings()
//    @StateObject var scenemanager = SceneManager()
//
    
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    
    var body: some View {
        
        ZStack {
            HStack {
                
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.down.circle")
                    .foregroundColor(.black)
                    .font(.system(size: 40))
            }
            .padding(.leading, 25)
            .padding()
                
            Spacer()
                
            Button(action: {
            }) {
                Image(systemName: "arkit")
                    .foregroundColor(.black)
                    .font(.system(size: 40))
            }
            .padding(.trailing, 25)
            .padding()
            }
        }
            
            
            /*NavigationLink(
                destination: CollectionRecentActivityView(screenWidth: screenWidth, screenHeight: screenHeight),
                label: {
                    Image(systemName: "chevron.up.circle")
                        .font(.system(size: 40))
                        .padding(.leading)
                })
                .buttonStyle(ThemeAnimationStyle())
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle("")
                .navigationBarHidden(true)*/
            
            
            
            //Spacer()
            

//            NavigationLink (  //ARViewContainer used to be SwiftUIView()
//                destination: FullARView(screenWidth: screenWidth, screenHeight: screenHeight)
//                    .environmentObject(placementSettings)
//                    .environmentObject(sessionSettings)
//                    .environmentObject(scenemanager)
//                    .edgesIgnoringSafeArea(.all)
//                    //.navigationBarBackButtonHidden(true)
//                    .navigationBarHidden(true), //comma?
//
//                label: {
//                Image (systemName: "arkit")
//                    .resizable()
//                    .foregroundColor(Color.black)
//                    .frame(width: screenWidth / 10, height: screenWidth / 10)
//                    .padding(.trailing, screenWidth / 30)
//                    .animation(.easeInOut)
//                })
//                .buttonStyle(ThemeAnimationStyle())
//                .navigationBarBackButtonHidden(true)
//                .navigationBarTitle("")
//
//
//
            //Spacer() //added
            

        
        
        
    }
}

struct CollectionReelHeader_Previews: PreviewProvider {
    static var previews: some View {
        CollectionReelHeader(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}


