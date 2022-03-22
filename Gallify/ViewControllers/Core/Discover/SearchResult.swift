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
struct SearchResultView: View {
        
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    let artwork: Art
    @State var showingSheet = false
    
    
    @EnvironmentObject var firestoreQuery: FirestoreQuery
        
    var body: some View {

        Button(action: {
            
            UIApplication.shared.endEditing(true)
            firestoreQuery.showNewScreen = true
            firestoreQuery.artisClicked = artwork.artId
            firestoreQuery.artThatsPlaying = artwork
            firestoreQuery.playlistThatsPlaying = firestoreQuery.playlist
            
        }){
        
            
        ZStack{

            HStack {
                    
                WebImage(url: URL(string: artwork.thumbnail))
                    .resizable()
                    .frame(width: screenWidth / 7.5, height: screenHeight / 16.25)
                    
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
                                .default(Text("Add to Playlist")) {
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
            .padding(.horizontal, screenWidth / 25)
            .padding(.bottom, screenHeight / 80)
            .padding(.top, (screenHeight / 80)-10)
            .background(Color.white)
        }
            
    }
    
}

}

//to be changed.
struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        OtherSearchTemplate(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width, image: Image("umbagog"), title: "Starry Night", searchType: "Art", artistName: "Adele")
    }
}
