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
            .environmentObject(firestoreQuery)
            .navigationBarHidden(true)
            .onAppear{ async{await NetworkingCall() }}
                
        }
        .navigationBarHidden(true)
            
    }
    
    func NetworkingCall() async{
        
        await firestoreQuery.fetchData() //fetchotheruser data
        
        firestoreQuery.getLibrary(library_ids: firestoreQuery.data.Library)

                    
       // await firestoreQuery.loaditems_selfprofile()
        
        print("in networkong call, playlist art")
        print(firestoreQuery.featuredPlaylist.art) //fetch other featured playlist.
        
        await firestoreQuery.fetchArt()
       
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

