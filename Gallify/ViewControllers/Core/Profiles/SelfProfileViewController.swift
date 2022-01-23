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
            .environmentObject(firestoreQuery)
            .navigationBarHidden(true)
            .onAppear{ async{await NetworkingCall() }}
                
        }
        .navigationBarHidden(true)
            
    }
    
    func NetworkingCall() async{
        do {
            try await firestoreQuery.fetchData()
        }catch {
            print("Error fetching playlists")
        }
                    
       // await firestoreQuery.loaditems_selfprofile()
        
        firestoreQuery.getLibrary(library_ids: firestoreQuery.data.Library)
        
        print("in networking call, playlist art")
        print(firestoreQuery.featuredPlaylist.art)
        
        await firestoreQuery.fetchArt()
       
        print(firestoreQuery.featuredArt)
        
        
    }
    
}

        



struct SelfProfileScreenPreview: PreviewProvider {
    @available(iOS 15.0, *)
    static var previews: some View {
        SelfProfileView().environmentObject(TabBarViewModel())
            .environmentObject(SelfProfileViewModel())
    }
}
