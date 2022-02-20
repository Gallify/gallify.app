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
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var modelsViewModel = ModelsViewModel()
    
    @StateObject var placementSettings = PlacementSettings()
    
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    
    var body: some View {
        HStack {
            
            Button{
                firestoreQuery.showNewScreen.toggle()
                firestoreQuery.artPlaying = true
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
                    firestoreQuery.showNewScreen.toggle()
                }
//                .gesture(
//                    DragGesture()
//                        .onChanged{ gesture in
//                            firestoreQuery.showNewScreen.toggle()
//                        }
//                )
            
//                .onTapGesture{
//
//                    presentationMode.wrappedValue.dismiss()
//
//            }
            
            
          //  Spacer()
            

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
            
            if (ARConfiguration.isSupported) {
                 NavigationLink(destination: FullARView()
                                 .environmentObject(modelsViewModel)
                                 .environmentObject(placementSettings)
                                 .environmentObject(firestoreQuery)
                                 .onAppear {
                     self.firestoreQuery.fetchData()
                 },
                                label: {
                     Image(systemName: "arkit")
                         .font(.system(size: 30))
                         .padding(.leading)
                         .foregroundColor(.primary)
                 })
             }
            
            
            

        }
      
        
        
        
    }
}

struct CollectionReelHeader_Previews: PreviewProvider {
    static var previews: some View {
        CollectionReelHeader(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}

