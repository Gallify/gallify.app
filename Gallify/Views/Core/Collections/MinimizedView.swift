//
//  Minimized.swift
//  Gallify
//
//  Created by Tejvir Mann on 1/23/22.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth
import SDWebImageSwiftUI

@MainActor
struct MinimizedView: View {
        
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    
//    let image: Image
//    let title: String
//    let searchType: String
//    let artistName: String
    
    @EnvironmentObject var firestoreQuery: FirestoreQuery
   
        
    var body: some View {
        
        if (firestoreQuery.showNewScreen == false) {
            
            if (firestoreQuery.artPlaying == true) {
        
                    Button(action: {
                        if(firestoreQuery.showCameraScreen==false && firestoreQuery.showNewScreen==false){
                            firestoreQuery.bothScreensMinimized = true
                        }
                        else{
                            firestoreQuery.bothScreensMinimized = false
                        }
                        
                        firestoreQuery.showNewScreen = true
                        
                        //firestoreQuery.data.isClicked = artwork.art_id
                        
                        var i = 0
                        for art in firestoreQuery.artworkThatsPlaying{
                            if(art.artId == firestoreQuery.artThatsPlaying.artId){
                                firestoreQuery.scrollTo = i
                            }
                            i += 1
                        }
                        
                        
                    }){
                    
                        
                    ZStack{

                        HStack {
                            
                            AnimatedImage(url: URL(string: firestoreQuery.artThatsPlaying.thumbnailUrl))
                            //WebImage(url: URL(string: firestoreQuery.artThatsPlaying.thumbnailUrl))
                                .resizable()
                            
                                .scaledToFill()
                                .frame(width: screenWidth / 7.5, height: screenHeight / 16.25)
                                .clipped()
                                
                            
                                
                            VStack(alignment: .leading) {
                                    
                                Text(firestoreQuery.artThatsPlaying.name)
                                    .font(.system(size: screenWidth / 20, weight: .bold))
                                    .foregroundColor(.black)
                                    
                                Text("by " + firestoreQuery.artThatsPlaying.creator)
                                    .font(.system(size: screenWidth / 25))
                                    .foregroundColor(.black)
                                    
                            }
                            .padding(.horizontal, screenWidth / 50)
                                
                            Spacer()
                            
                            Button(action: {
                                firestoreQuery.artPlaying = false
                                firestoreQuery.artisClicked = "artisClicked"
                            }, label: {
                                
                                Image(systemName: "xmark")
                                    .resizable()
                                    .frame(width: screenWidth / 20, height: screenHeight / 43)
                                    .foregroundColor(.black)
                                
                            })
                            .padding(.horizontal, screenWidth / 25)
                                
                        }
                        .padding(.horizontal, screenWidth / 25)
                        .padding(.bottom, screenHeight / 80)
                        .padding(.top, (screenHeight / 80)-10)
                        .background(Color.white)
                       // .border(Color.primary)
                    
                    }
                        
                }
            }
        }
        if (firestoreQuery.cameraPlaying == true) {
            
            Button(action: {
                
                //start: for correctly transitioning view
                if(firestoreQuery.showCameraScreen==false && firestoreQuery.showNewScreen==false){
                    firestoreQuery.bothScreensMinimized = true
                }
                else{
                    firestoreQuery.bothScreensMinimized = false
                }
                
                firestoreQuery.showCameraScreen = true
                //end: for correctly transitioning view.
                
                
            }){
            
                ZStack{

                    HStack {
                            
                        VStack(alignment: .leading) {
                                
                            Text("View Gallery")
                                .font(.system(size: screenWidth / 20, weight: .bold))
                                .foregroundColor(.black)

                        }
                        .padding(.horizontal, screenWidth / 50)
                            
                        Spacer()
                        
                        Button(action: {
                            if(firestoreQuery.showCameraScreen==false && firestoreQuery.showNewScreen==false){
                                firestoreQuery.bothScreensMinimized = true
                            }
                            else{
                                firestoreQuery.bothScreensMinimized = false
                            }
                            firestoreQuery.cameraPlaying = false
                            firestoreQuery.clearModels()
                            firestoreQuery.clearModelEntitiesFromMemory()
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: screenWidth / 20, height: screenHeight / 43)
                                .foregroundColor(.black)
                            
                        })
                        .padding(.horizontal, screenWidth / 25)
                            
                    }
                    .padding(.horizontal, screenWidth / 25)
                    .padding(.bottom, screenHeight / 80)
                    .padding(.top, (screenHeight / 80)-10)
                    .background(Color.white)
                   // .border(Color.primary)
                
                }
            }

            
        }
    
}

}

//to be changed.
struct MinimizedView_Previews: PreviewProvider {
    static var previews: some View {
        OtherSearchTemplate(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width, image: Image("umbagog"), title: "Starry Night", searchType: "Art", artistName: "Adele")
    }
}
