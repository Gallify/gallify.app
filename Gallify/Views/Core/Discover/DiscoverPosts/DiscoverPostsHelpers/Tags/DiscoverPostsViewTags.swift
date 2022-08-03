//
//  DiscoverPostsViewTags.swift
//  Gallify
//
//  Created by Anshul on 11/14/21.
//
import SwiftUI
import ARKit

struct DiscoverPostsViewTags: View {
    
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    @EnvironmentObject var firestoreQuery : FirestoreQuery
    
    var body: some View {
        
        
      //  ScrollView(.horizontal, showsIndicators: false) {
            
            HStack {
                
                Spacer()
                
                Button(action: {
                    
                    if(firestoreQuery.lastDocument != nil) {
                        
                        async{ await firestoreQuery.getDiscoverContent() }
                        
                    }
                    
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                    
                }) {
                    
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(.primary)
//                            .foregroundColor(Color("Gallify-Pinkish"))
                            .frame(width: screenWidth / 10.5, height: screenWidth / 10.5)
                            .cornerRadius(screenWidth / 50)
                        
                        Image(systemName: "arrow.clockwise")
                            .resizable()
                            .foregroundColor(Color.white)
                            .frame(width: screenWidth / 25, height: screenWidth / 25)
                            .font(Font.title.weight(.bold))
                        
                    }
                    
                }
                .buttonStyle(ThemeAnimationStyle_refresh())
                
                Spacer()
                
                /*
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
                
            }
            .padding(.horizontal, screenWidth / 25)
            .padding(.vertical, screenHeight / 160)
            */
        }
        
      //  }
    }
}

//struct DiscoverPostsViewTags_Previews: PreviewProvider {
//    static var previews: some View {
//        DiscoverPostsViewTags(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width)
//    }
//}
