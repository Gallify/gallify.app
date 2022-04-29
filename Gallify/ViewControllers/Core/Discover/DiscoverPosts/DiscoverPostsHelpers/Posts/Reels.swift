//
//  Reel.swift
//  Gallify
//
//  Created by Anshul on 11/20/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct Reel: View {
    
    @EnvironmentObject var viewModel: TabBarViewModel
    @EnvironmentObject var firestoreQuery : FirestoreQuery

    
    let discover_art: Art
    let index: Int
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        Button(action: {
            if(firestoreQuery.showCameraScreen==false && firestoreQuery.showNewScreen==false){
                firestoreQuery.bothScreensMinimized = true
            }
            else{
                firestoreQuery.bothScreensMinimized = false
            }
            
            firestoreQuery.artisClicked = discover_art.artId
            firestoreQuery.artThatsPlaying = discover_art
            firestoreQuery.artworkThatsPlaying = firestoreQuery.discoveryPageArt
            
            //firestoreQuery.isPresented.toggle()
//            firestoreQuery.sheetMode = .full
//            firestoreQuery.maximized = true
//            sheetMode2 = .full
            
            firestoreQuery.showNewScreen = true
            firestoreQuery.scrollTo = index
                
            }){
                
                WebImage(url: URL(string: discover_art.thumbnailUrl))
                    .resizable()
                    .frame(width: screenWidth / 3.1, height: screenHeight / 6.8)
                    .scaledToFit()
                    .padding(.leading, -screenWidth / 75)
                    .padding(.top, -screenHeight / 160)
                    .border(Color.primary)
            }
   
        
    }
    
}

//struct Reel_Previews: PreviewProvider {
//    static var previews: some View {
//        Reel(image: Image("chincoteague"))
//            .environmentObject(TabBarViewModel())
//    }
//}
