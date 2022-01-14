//
//  SelfProfileViewController.swift
//  Gallify
//
//  Created by Tejvir Mann on 8/18/21.
//
import UIKit
import SwiftUI

@available(iOS 15.0, *)
class SelfProfileViewModel: ObservableObject {
    @EnvironmentObject var firestoreQuery : FirestoreQuery
    
    
}

struct SelfProfileView : View {
    
    @EnvironmentObject var viewModel : TabBarViewModel
   
    @available(iOS 15.0, *)
    @EnvironmentObject var profileViewModel : SelfProfileViewModel
   
    @EnvironmentObject var firestoreQuery : FirestoreQuery
    
    
    
    var body: some View {
            
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        VStack {
                
            SelfProfileViewHeader(screenHeight: screenHeight, screenWidth: screenWidth)
                
            ScrollView(showsIndicators: false) {
                
                Text(firestoreQuery.data.firstName)
                    
                
                    SelfProfileViewDetails()
                        .environmentObject(SelfProfileViewModel())
               
                    // Fallback on earlier versions
               
                    
                
                    
                //Text(firestoreQuery.featuredPlaylist.name)
                
                SelfProfileFeatured(screenHeight: screenHeight, screenWidth: screenWidth)
                    .environmentObject(firestoreQuery)
                    
                SelfProfileCollectionList(screenHeight: screenHeight, screenWidth: screenWidth)
                    .environmentObject(firestoreQuery)
                                    
            }
            .environmentObject(firestoreQuery)
            .navigationBarHidden(true)
            .onAppear{ async{await NetworkingCall() }}
                
        }
            
    }
    
    @available(iOS 15.0.0, *)
    func NetworkingCall() async{
        
        await firestoreQuery.fetchData()
        
       // await firestoreQuery.loaditems_selfprofile()
        
        print("in networkong call, playlist art")
        print(firestoreQuery.featuredPlaylist.art)
        
        await firestoreQuery.fetchArt()
        print(firestoreQuery.featuredArt)
        
//        if(firestoreQuery.data.uid == ""){
//            firestoreQuery.getUser()
//        }
//        print("LIBRARY IDS")
//        print(firestoreQuery.data.Library)
//        firestoreQuery.getLibrary(library_ids: firestoreQuery.data.Library)
        // firestoreQuery.getFeaturedPlaylist(a: firestoreQuery.data.featured) //now have artids
//       // print("Featured playlist name")
//       // print(firestoreQuery.featuredPlaylist.name)
//
//        print("FEATURED Playlist")
//        print(firestoreQuery.featuredPlaylist.art)
        
       //   firestoreQuery.getFeaturedPlaylistArt2(art_ids: firestoreQuery.featuredPlaylist.art)
        
//        firestoreQuery.getFeaturedPlaylistArt()
//
//        print(firestoreQuery.featuredArt)
    }
    
}


struct SelfProfileScreenPreview: PreviewProvider {
    @available(iOS 15.0, *)
    static var previews: some View {
        SelfProfileView().environmentObject(TabBarViewModel())
            .environmentObject(SelfProfileViewModel())
    }
}
