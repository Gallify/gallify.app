//
//  CollectionGenericViewHeader.swift
//  Gallify
//
//  Created by Gianluca Profio on 11/7/21.
//
import SwiftUI

struct CollectionGenericHeader: View {
    
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var firestoreQuery: FirestoreQuery

    var body: some View {
        
        HStack {
                
            CustomBackButton(buttonHeight: screenHeight / 32.5, buttonWidth: screenWidth / 15, image: Image(systemName: "chevron.left.circle"), presentationMode: _presentationMode)
                .padding(.horizontal, screenWidth / 25)
                .padding(.vertical, screenHeight / 100)
                
            Spacer()
                
            Text("\(firestoreQuery.playlist.name)")
                .font(.system(size: screenWidth / 20, weight: .semibold))
            
            Spacer()
                
            Button(action: {
                firestoreQuery.showPlaylistOptions = true
            }, label: {
                    
                Image(systemName: "ellipsis")
                    .foregroundColor(.black)
                    .padding(.horizontal, screenWidth / 25)
                    
            })
            .actionSheet(isPresented: $firestoreQuery.showPlaylistOptions) {
                    
                ActionSheet(
                    title: Text("Select"),
                    buttons: [
                        .default(Text("Edit")) {
                            //firestoreQuery.addToPlaylist(artwork.art_id)
                        },
                        .default(Text("Make Public")) {
                            //firestoreQuery.addToPlaylist(artwork.art_id)
                        },
                        .default(Text("Make Private")) {
                            //firestoreQuery.addToPlaylist(artwork.art_id)
                        },
                        .default(Text("Make Collection")) {
                            //firestoreQuery.addToPlaylist(artwork.art_id)
                        },
                        .default(Text("Make Playlist")) {
                            //firestoreQuery.addToPlaylist(artwork.art_id)
                        },
                        .default(Text("Cancel")) {
                            firestoreQuery.showPlaylistOptions = false
                            //firestoreQuery.addToPlaylist(artwork.art_id)
                        }])
                
            }
                
        }
        
    }
    
    /*func move(indices: IndexSet, newOffset: Int) {
        playlist.move(fromOffsets: indices, toOffset: newOffset)
        firestoreQuery.featuredArt = playlist //updates the firestore Query.
        //firestoreUpdatePlaylist() here
    
    }*/
    
}
