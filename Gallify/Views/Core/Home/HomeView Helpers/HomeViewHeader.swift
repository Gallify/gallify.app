//
//  HomeViewHeader.swift
//  Gallify
//
//  Created by Anshul on 9/5/21.
//
import SwiftUI
import ARKit

struct HomeViewHeader: View {
    
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    @EnvironmentObject var firestoreQuery : FirestoreQuery
    
    
    var body: some View {
        
        HStack {
            
            //height, width. //844, 390. iphone 12 pro
            Image("logo-full")
                .resizable()
                .frame(width: screenWidth/2.3, height: screenHeight/14)
                .offset(x: 15)
            
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
                    
                    //assumes discover page art never empty.
                    let discoverArray = firestoreQuery.discoveryPageArt
                    if(!discoverArray.isEmpty){
                        firestoreQuery.artisClicked = discoverArray[0].artId
                        firestoreQuery.artThatsPlaying = discoverArray[0]
                        firestoreQuery.artworkThatsPlaying = discoverArray
                    }
                    
                   
                    
                }
                    label: {
                        if (ARConfiguration.isSupported) {
                            Image(systemName: "arkit")
                                .font(.system(size: 30))
                                //.padding(.leading)
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
            
            Button(action: {

                if let url = URL(string: "https://metamask.app.link/dapp/https://open.gallify.app/create/art/") {
                   UIApplication.shared.open(url)
                }
                
                
            }) {
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(.primary)
//                        .foregroundColor(Color("Gallify-Pinkish"))
                        .padding(.all, screenWidth / 55)
                        .frame(width: screenWidth / 9, height: screenWidth / 9)
                    
                    Image(systemName: "plus")
                        .resizable()
                        .foregroundColor(Color.white)
                        .frame(width: screenWidth / 25, height: screenWidth / 25)
                        
                    
                }
                //.padding(.trailing, screenWidth / 37.5)
            }
            

     
            
            
            
            
            
//            NavigationLink (
//                            destination: CreateLandingView(screenWidth: screenWidth, screenHeight: screenHeight),
//                            label: {
//                                ZStack {
//
//                                    RoundedRectangle(cornerRadius: 5)
//                                        .foregroundColor(Color("Gallify-Pinkish"))
//                                        .padding(.all, screenWidth / 55)
//                                        .frame(width: screenWidth / 9, height: screenWidth / 9)
//
//                                    Image(systemName: "plus")
//                                        .resizable()
//                                        .foregroundColor(Color.white)
//                                        .frame(width: screenWidth / 25, height: screenWidth / 25)
//
//
//                                }
//                                .padding(.trailing, screenWidth / 37.5)
//                            })
//                            .buttonStyle(ThemeAnimationStyle())
//                            .navigationBarBackButtonHidden(true)
//                            .navigationBarTitle("")
//                            .navigationBarHidden(true)
            
        }
        .padding(.bottom, -screenHeight / 240) //270
        //.padding(.top, screenHeight / 178) //68
        
       // Divider()
        
    }
}

struct HomeViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewHeader(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width)
    }
}
