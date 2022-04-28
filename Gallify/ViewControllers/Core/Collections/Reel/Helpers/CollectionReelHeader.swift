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

struct CollectionReelHeader: View {
    
    @EnvironmentObject var viewModel: TabBarViewModel
    @EnvironmentObject var firestoreQuery: FirestoreQuery
    @Environment(\.presentationMode) var presentationMode
    
    //@StateObject var modelsViewModel = ModelsViewModel()
    //@StateObject var placementSettings = PlacementSettings()
//
//    @EnvironmentObject var modelsViewModel : ModelsViewModel
//    @EnvironmentObject var placementSettings : PlacementSettings
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        HStack {
            
            Button {
                
                firestoreQuery.showNewScreen.toggle()
                firestoreQuery.artPlaying = true
                
            }
                label: {
                    
                    Image(systemName: "chevron.down")
                        .resizable()
                        .frame(width: screenWidth / 18, height: screenHeight / 54)
                        .padding(.leading, screenWidth / 25)
                    
                }
                .buttonStyle(ThemeAnimationStyle())
                .padding(.vertical, screenHeight / 80)
                .navigationBarHidden(true)
                .onTapGesture {
                    firestoreQuery.showNewScreen.toggle()
                }
            
            /*NavigationLink (  //ARViewContainer used to be SwiftUIView()
                destination: FullARView(screenWidth: screenWidth, screenHeight: screenHeight)
                    .environmentObject(placementSettings)
                    .environmentObject(sessionSettings)
                    .environmentObject(scenemanager)
                    .environmentObject(modelsViewModel)
                    .environmentObject(modelDeletionManager)
                    .edgesIgnoringSafeArea(.all)
                    //.navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true), //comma?
                
                label: {
                Image (systemName: "arkit")
                    .resizable()
                    .foregroundColor(Color.black)
                    .frame(width: screenWidth / 10, height: screenWidth / 10)
                    .padding(.trailing, screenWidth / 30)
                    .animation(.easeInOut)
                })
                .buttonStyle(ThemeAnimationStyle())
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle("")*/
                
            Spacer()
            
            /*if (ARConfiguration.isSupported) {
                 NavigationLink(destination: FullARView()
                                 .environmentObject(modelsViewModel)
                                 .environmentObject(placementSettings)
                                 .environmentObject(firestoreQuery)
                               // .onAppear{ async{ await firestoreQuery.fetchModelData()}} //called in reels.
                     
                 ,
                    label: {
                     Image(systemName: "arkit")
                         .font(.system(size: 30))
                         .padding(.leading)
                         .foregroundColor(.primary)
                 })
             }*/

        }
        
    }
    
}
