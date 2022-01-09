//
//  SelfProfileViewController.swift
//  Gallify
//
//  Created by Tejvir Mann on 8/18/21.
//
import UIKit
import SwiftUI

class SelfProfileViewModel: ObservableObject {
        
}

struct SelfProfileView : View {
    
    @EnvironmentObject var viewModel : TabBarViewModel
    @EnvironmentObject var profileViewModel : SelfProfileViewModel
    @EnvironmentObject var firestoreQuery : FirestoreQuery
    
    
    var body: some View {
            
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth

        VStack {
                
            SelfProfileViewHeader(screenHeight: screenHeight, screenWidth: screenWidth)
                
            ScrollView(showsIndicators: false) {
                
               // Text(firestoreQuery.data.firstName)
                    
                SelfProfileViewDetails()
                    .environmentObject(SelfProfileViewModel())
                    
                
                    
                //Text(firestoreQuery.featuredPlaylist.name)
                
                SelfProfileFeatured(screenHeight: screenHeight, screenWidth: screenWidth)
                    .environmentObject(firestoreQuery)
                    
                SelfProfileCollectionList(screenHeight: screenHeight, screenWidth: screenWidth)
                    .environmentObject(firestoreQuery)
                                    
            }
            .environmentObject(firestoreQuery)
            .navigationBarHidden(true)
            .onAppear{ NetworkingCall() }
                
        }
            
    }
    
    func NetworkingCall(){
        
        if(firestoreQuery.data.uid == ""){
            firestoreQuery.getUser()
        }
        firestoreQuery.getLibrary(library_ids: firestoreQuery.data.Library)
        firestoreQuery.getFeaturedPlaylist(a: firestoreQuery.data.featured) //now have artids
        print("Featured playlist name")
        print(firestoreQuery.featuredPlaylist.name)
        firestoreQuery.getFeaturedPlaylistArt(art_ids: firestoreQuery.featuredPlaylist.art)
        print(firestoreQuery.featuredArt)
    }
    
}


struct SelfProfileScreenPreview: PreviewProvider {
    static var previews: some View {
        SelfProfileView().environmentObject(TabBarViewModel())
            .environmentObject(SelfProfileViewModel())
    }
}
