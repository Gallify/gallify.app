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

    @State var showLandingPage = false
    var body: some View {
        
        HStack {
            
            
                
            CustomBackButton(buttonHeight: screenHeight / 32.5, buttonWidth: screenWidth / 15, image: Image(systemName: "chevron.left.circle"), presentationMode: _presentationMode)
                .padding(.horizontal, screenWidth / 25)
                .padding(.vertical, screenHeight / 100)
                
            Spacer()
                          
            
            HStack{
                Text("\(firestoreQuery.playlist.name)")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .padding(.trailing, screenWidth / 7.5)
                        .offset(x:10)
                    
            
                Button(action: {
                    firestoreQuery.showPlaylistOptions = true
                }, label: {
                    
                    Image(systemName: "ellipsis")
                        .foregroundColor(.black)
                    
                }).actionSheet(isPresented: $firestoreQuery.showPlaylistOptions) {
                    ActionSheet(
                        title: Text("Select"),
                        buttons: [
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
//                            .default(Text("Add Art To Playlist")) {
//                                showLandingPage = true
//                            },
                            .default(Text("Delete Playlist")) {
                                async{ await firestoreQuery.deletePlaylistFromLibrary(playlist_id: firestoreQuery.playlist.playlist_id)}
                            },
                            .default(Text("Cancel")) {
                                firestoreQuery.showPlaylistOptions = false
                            },
                        ]
                    )
                }
                .sheet(isPresented: $showLandingPage) {
                    CreateLandingOptions(screenWidth: screenWidth, screenHeight: screenHeight, playlist: firestoreQuery.playlist)
                }
                
            }
            
            Spacer()
                
        }
       // .navigationBarItems(leading: EditButton())
        
    }
    
}

struct CollectionGenericHeader_Previews: PreviewProvider {
    static var previews: some View {
        CollectionGenericHeader(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width)
    }
}
