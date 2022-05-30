//
//  Minimized.swift
//  Gallify
//
//  Created by Tejvir Mann on 1/23/22.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth
import SDWebImageSwiftUI

@MainActor
struct ArtSearchResult: View {
        
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    let artwork: Art
    @State var showingSheet = false
    
    @EnvironmentObject var firestoreQuery: FirestoreQuery
    @EnvironmentObject var loginModel: LoginAppViewModel
        
    var body: some View {

        Button(action: {
            
            UIApplication.shared.endEditing(true)
            firestoreQuery.showNewScreen = true
            firestoreQuery.artisClicked = artwork.artId
            firestoreQuery.artThatsPlaying = artwork
            firestoreQuery.artworkThatsPlaying = firestoreQuery.foundContacts
            
            //placeholder playlist
            let playlist = Playlist()
            playlist.creator_url = "search"
            firestoreQuery.playlistThatsPlaying = playlist
            
            var i = 0
            for art in firestoreQuery.artworkThatsPlaying{
                if(art.artId == firestoreQuery.artThatsPlaying.artId){
                    firestoreQuery.scrollTo = i
                }
                i += 1
            }
            
        }){
        
            
        ZStack{

            HStack {
                    
                WebImage(url: URL(string: artwork.thumbnailUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: screenWidth / 7.5, height: screenHeight / 16.25)
                    .clipped()
                    
                VStack(alignment: .leading) {
                    
                    if (firestoreQuery.artisClicked == artwork.artId) {
                        Text(artwork.name)
                            .font(.system(size: screenWidth / 20, weight: .bold))
                            .foregroundColor(Color("Gallify-Pink"))
                    }
                    else {
                        Text(artwork.name)
                            .font(.system(size: screenWidth / 20, weight: .bold))
                            .foregroundColor(.black)
                    }
                        
                    Text("by " + artwork.creator)
                        .font(.system(size: screenWidth / 25))
                        .foregroundColor(.black)
                        
                }
                .padding(.horizontal, screenWidth / 50)
                    
                Spacer()
                
                
                if(!loginModel.isGuest){
                    Button(action: {
                        firestoreQuery.showArtOptions = true
                    }, label: {
                        
                        Image(systemName: "ellipsis")
                            .foregroundColor(.black)
                        
                    })
                        .actionSheet(isPresented: $firestoreQuery.showArtOptions) {
                            ActionSheet(
                                title: Text("Select"),
                                buttons: [
                                    .default(Text("Add to Collection")) {
                                        showingSheet = true
                                        
                                        //firestoreQuery.addToPlaylist(artwork.art_id)
                                    },
                                    .default(Text("Cancel")) {
                                        
                                        //firestoreQuery.addToPlaylist(artwork.art_id)
                                        firestoreQuery.showArtOptions = false
                                    }
                                ]
                            )
                        }
                        .sheet(isPresented: $showingSheet) {
                                CollectionsView(art: artwork)
                        }
                }
                
                
  
            }
            .padding(.horizontal, screenWidth / 25)
            .padding(.top, screenHeight / 80)
            .background(Color.white)
            
        }
            
    }
    
}

}
