//
//  SelfProfileViewVerified.swift
//  Gallify
//
//  Created by Anshul on 1/16/22.
//

import SwiftUI

struct SelfProfileViewVerified: View {
    
    @EnvironmentObject var viewModel : TabBarViewModel
    @EnvironmentObject var firestoreQuery: FirestoreQuery
    
    var body: some View {

        VStack {
                
            SelfProfileViewHeader()
                
            ScrollView(showsIndicators: false) {
                    
                SelfProfileViewVerifiedDetails()
                
                //SelfProfileFeatured()
                    
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
       // firestoreQuery.getFeaturedPlaylistArt(art_ids: firestoreQuery.featuredPlaylist.art)
        print(firestoreQuery.featuredArt)
        
    }
    
}

struct SelfProfileViewVerified_Previews: PreviewProvider {
    static var previews: some View {
        SelfProfileViewVerified()
            .environmentObject(TabBarViewModel())
            .environmentObject(FirestoreQuery())
    }
}

