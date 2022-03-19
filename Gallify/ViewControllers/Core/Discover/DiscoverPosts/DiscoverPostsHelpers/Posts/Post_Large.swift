//
//  Post_Large.swift
//  Gallify
//
//  Created by Anshul on 11/20/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct Post_Large: View {
    
    @EnvironmentObject var viewModel: TabBarViewModel
    @EnvironmentObject var firestoreQuery : FirestoreQuery

    let discover_art: Art
    let index: Int
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        
        Button(action: {
               
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
                
                WebImage(url: URL(string: discover_art.thumbnail))
                    .resizable()
                    .frame(width: screenWidth / 1.53, height: screenHeight / 3.38)
                    .padding(.leading, -screenWidth / 75)
                    .padding(.top, -screenHeight / 160)
                    .border(Color.primary)
            }
        
    }
    
}

//struct Post_Large_Previews: PreviewProvider {
//    static var previews: some View {
//        Post_Large(image: Image("lakemcdonald"))
//            .environmentObject(TabBarViewModel())
//    }
//}
