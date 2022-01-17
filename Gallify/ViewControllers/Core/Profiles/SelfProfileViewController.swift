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
    @EnvironmentObject var firestoreQuery: FirestoreQuery
    
    var body: some View {

        VStack {
                
            SelfProfileViewHeader()
                
            ScrollView(showsIndicators: false) {
                    
                SelfProfileViewDetails()
                
                SelfProfileFeatured()
                    
                SelfProfileCollectionList()
                                    
            }
            .navigationBarHidden(true)
            .onAppear{ NetworkingCall() }
                
        }
        .navigationBarHidden(true)
            
    }
    
    func NetworkingCall() {
        
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
        SelfProfileView()
            .environmentObject(TabBarViewModel())
            .environmentObject(FirestoreQuery())
    }
}
