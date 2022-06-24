//
//  OtherProfileViewController.swift
//  Gallify
//
//  Created by Tejvir Mann on 8/18/21.
//
import UIKit
import SwiftUI

class OtherProfileViewModel: ObservableObject {

}

struct OtherProfileView : View {
    
    var otherUserId: String
    @EnvironmentObject var viewModel : TabBarViewModel
    @EnvironmentObject var firestoreQuery: FirestoreQuery
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {

        VStack {
            
           
            OtherProfileViewHeader(presentationMode: _presentationMode)
                
            ScrollView(showsIndicators: false) {
                    
                OtherProfileViewDetails()
                
                
               
                    OtherProfileFeatured()
                
                    
                    
                OtherProfileCollectionList()
                  
                                    
            }
            .environmentObject(firestoreQuery)
            //.environmentObject(viewModel)
            .navigationBarHidden(true)
            .onAppear{ async{await NetworkingCall() }}
            
//            if(firestoreQuery.showNewScreen == false) {
//
//                if(firestoreQuery.artPlaying == true) {
                    
                    MinimizedView(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width)
                    
//                }
//                
//            }
                
        }
        .navigationBarHidden(true)
            
    }
    
    func NetworkingCall() async{
        
        //get other user data
        await firestoreQuery.getOtherUser(user_id: otherUserId)

        //get other user library
        await firestoreQuery.getOtherLibrary()
        //firestoreQuery.getOtherLibrary()
        //  await firestoreQuery.getOtherLibrary()

        //get featured playlist
        await firestoreQuery.getOtherFeaturedPlaylist()
        
        //get other user featured art
        await firestoreQuery.getOtherFeaturedArt()
  
    }
    
}

//struct OtherProfileScreenPreview: PreviewProvider {
//    static var previews: some View {
//        OtherProfileView(otherUserId: "test")
//            .environmentObject(TabBarViewModel())
//            .environmentObject(FirestoreQuery())
//    }
//}

