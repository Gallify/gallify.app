//
//  SwiftUIView.swift
//  Gallify
//
//  Created by Gianluca Profio on 10/23/21.
//

import SwiftUI

struct CollectionGenericView: View {
    
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    let playlist: Playlist
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var firestoreQuery : FirestoreQuery

    
    var body: some View {
        
        NavigationView {
        
//            List{
//                Text("hello")
//                Text("hello")
//                Text("hello")
//                Text("hello")
//            }
//            .listStyle(GroupedListStyle())
            
            VStack {
                
                CollectionGenericHeader(screenHeight: screenHeight, screenWidth: screenWidth, presentationMode: _presentationMode)
                
                CollectionGenericRow(screenWidth: screenWidth, screenHeight: screenHeight, thePlaylist: playlist, controller: CollectionGenericController())
                
                Spacer()
                
             
                if(firestoreQuery.showNewScreen == false){
                    if(firestoreQuery.artPlaying == true){
                        MinimizedView(screenHeight: screenHeight, screenWidth: screenWidth)
                    }
                }
                
            }
            
        }
        .toolbar {
            EditButton()
        }
        .navigationBarHidden(true)
        .onAppear{async{ await NetworkingCall() }}
        
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

//struct CollectionGenericView_Previews: PreviewProvider {
//    static var previews: some View {
//        CollectionGenericView(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
//    }
//}

