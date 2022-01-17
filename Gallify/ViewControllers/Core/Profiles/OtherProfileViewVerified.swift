//
//  OtherProfileViewVerified.swift
//  Gallify
//
//  Created by Anshul on 1/17/22.
//

import SwiftUI

struct OtherProfileViewVerified: View {
    
    @EnvironmentObject var viewModel : TabBarViewModel
    @EnvironmentObject var firestoreQuery: FirestoreQuery
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {

        VStack {
                
            OtherProfileViewHeader(presentationMode: _presentationMode)
                
            ScrollView(showsIndicators: false) {
                    
                OtherProfileViewVerifiedDetails()
                
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

struct OtherProfileViewVerified_Previews: PreviewProvider {
    static var previews: some View {
        OtherProfileViewVerified()
            .environmentObject(TabBarViewModel())
            .environmentObject(FirestoreQuery())
    }
}
