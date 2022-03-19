//
//  SwiftUIView.swift
//  Gallify
//
//  Created by Gianluca Profio on 10/23/21.
//
import SwiftUI
import FirebaseFirestore
import FirebaseAuth
import SDWebImageSwiftUI

struct CollectionGenericView: View {
    
    let playlist: Playlist
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var firestoreQuery : FirestoreQuery
    @EnvironmentObject var viewModel: TabBarViewModel
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        NavigationView {
            
            VStack {
                
                CollectionGenericHeader(screenHeight: screenHeight, screenWidth: screenWidth, presentationMode: _presentationMode)
                    //.padding(.top, screenHeight / 45)
                
                CollectionGenericRow(screenWidth: screenWidth, screenHeight: screenHeight, thePlaylist: playlist)
                
                Spacer()
             
                if(firestoreQuery.showNewScreen == false) {
                    
                    if(firestoreQuery.artPlaying == true) {
                        
                        MinimizedView(screenHeight: screenHeight, screenWidth: screenWidth)
                        
                    }
                    
                }
                
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            
        }
        .onAppear{async{ await NetworkingCall() }}
        .navigationBarHidden(true)
        
        
    }
    
    func NetworkingCall() async {
        
        //this gets all the data for the home page.
        
        //get playlist. Stored in FirestoreQuery.playlist
        
        //get playlist art
        await firestoreQuery.getPlaylistArt(playlist: playlist)
   //     print("ART: \(firestoreQuery.playlistArt[1].creator)")
        
        //get art
        
    }
    
}
