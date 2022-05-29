//
//  Post_Small.swift
//  Gallify
//
//  Created by Anshul on 11/20/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct Post_Small: View {
    
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
                    .scaledToFill()
                    .frame(width: screenWidth / 3.1, height: screenHeight / 6.8)
                    .clipped()
                    
                   // .padding(.leading, -screenWidth / 75)
                   // .padding(.top, -screenHeight / 160)
                    .border(Color.primary)
                   // .overlay(Rectangle().frame(width: nil, height: 1, alignment: .top).foregroundColor(Color.black), alignment: .top)
                
            }
        
    }
    
}

//struct Post_Small_Previews: PreviewProvider {
//    static var previews: some View {
//        Post_Small(image: Image("lakemcdonald"))
//            .environmentObject(TabBarViewModel())
//    }
//}
