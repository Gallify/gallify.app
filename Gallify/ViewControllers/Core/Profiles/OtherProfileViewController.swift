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

struct OtherProfileScreenPreview: PreviewProvider {
    static var previews: some View {
        OtherProfileView()
            .environmentObject(TabBarViewModel())
            .environmentObject(FirestoreQuery())
    }
}
