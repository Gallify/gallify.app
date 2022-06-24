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
    
    @EnvironmentObject var firestoreQuery : FirestoreQuery
    @EnvironmentObject var viewModel: TabBarViewModel
    @Environment(\.presentationMode) var presentationMode
    
    
    @StateObject var modelsViewModel = ModelsViewModel()
    @StateObject var placementSettings = PlacementSettings()
    @StateObject var modelDeletionManager = ModelDeletionManager()
//
//    @EnvironmentObject var modelsViewModel : ModelsViewModel
//    @EnvironmentObject var placementSettings : PlacementSettings
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        
        HStack {
            
            Button{
                //if else checks if both camera and reels screen are minimized currently.
                if(firestoreQuery.showCameraScreen==false && firestoreQuery.showNewScreen==false){
                    firestoreQuery.bothScreensMinimized = true
                }
                else{
                    firestoreQuery.bothScreensMinimized = false
                }
                firestoreQuery.showCameraScreen = false
                firestoreQuery.showNewScreen = false
                firestoreQuery.artPlaying = true
                firestoreQuery.cameraPlaying = false
            }
                label: {
                    Image(systemName: "chevron.down")
                        .font(.system(size: 30))
                        .padding(.leading)
                }
                .buttonStyle(ThemeAnimationStyle())
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .onTapGesture {
                    firestoreQuery.showCameraScreen.toggle()
                }

            Spacer()
            

            if (ARConfiguration.isSupported) {
                Button{
                    //if else checks if both camera and reels screen are minimized currently.
                    if(firestoreQuery.showCameraScreen==false && firestoreQuery.showNewScreen==false){
                        firestoreQuery.bothScreensMinimized = true
                    }
                    else{
                        firestoreQuery.bothScreensMinimized = false
                    }
                    firestoreQuery.showCameraScreen = true
                    firestoreQuery.showNewScreen = false
                    firestoreQuery.cameraPlaying = true
                    firestoreQuery.artPlaying = false
                    
                    Task{
                        
                        //clears out the old data in the AR session.
                        firestoreQuery.clearModels()
                        firestoreQuery.clearModelEntitiesFromMemory()
                        
                        if(firestoreQuery.models.isEmpty){
                            await firestoreQuery.fetchModelData()
                        }
                    }
                }
                    label: {
                        if (ARConfiguration.isSupported) {
                            Image(systemName: "arkit")
                                .font(.system(size: 30))
                                .padding(.leading)
                                .foregroundColor(.primary)
                        }
                    }
                    .buttonStyle(ThemeAnimationStyle())
                    .navigationBarBackButtonHidden(true)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    .onTapGesture {
                        firestoreQuery.showCameraScreen = true
                        firestoreQuery.showNewScreen = false
                    }
            }
        }
    }
}

//struct CollectionReelHeader_Previews: PreviewProvider {
//    static var previews: some View {
//        CollectionReelHeader(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
//    }
//}

