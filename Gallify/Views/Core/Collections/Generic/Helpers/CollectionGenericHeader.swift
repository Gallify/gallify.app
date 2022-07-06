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
    
    @State var showDeleteAlert = false

    var body: some View {
        
        HStack {
            
            CustomBackButton(buttonHeight: screenHeight / 32.5, buttonWidth: screenWidth / 15, image: Image(systemName: "chevron.left.circle"), presentationMode: _presentationMode)
                .padding(.horizontal, screenWidth / 25)
                .padding(.vertical, screenHeight / 100)
                
            Spacer()
                
            Text(firestoreQuery.playlist.name)
                .font(.system(size: screenWidth / 20, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.horizontal, screenWidth / 25)
                
            
            Spacer()
                
            if(firestoreQuery.data.uid == firestoreQuery.playlist.creatorUrl){
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
//                        .default(Text("Delete? " + firestoreQuery.playlist.playlistType)) {
//
//
//                                //await firestoreQuery.getUserLibrary() //updates library
//                        }
//                            firestoreQuery.showPlaylistOptions = false
//                        },
                        .default(Text("Delete Playlist From Library")) {
                            
                            Task{
//                                await firestoreQuery.updatePlaylistPrivacy(playlist_id: firestoreQuery.playlist.playlistId)

                                let words = ["Liked", "Owned", "Created", "Review", "Featured", "Singles"]
                                let combinedResult = words.contains(where: firestoreQuery.playlist.name.contains)
                                if(!combinedResult){
                                    //changed async into Task
                                    Task{
                                        await firestoreQuery.deletePlaylistFromLibrary(playlist_id: firestoreQuery.playlist.playlistId)
                                        
                                        await firestoreQuery.getUserLibrary() //updates library
                                    }
                                    firestoreQuery.showPlaylistOptions = false
                                }
                            }

                                
                                
                            },
                            .default(Text("Switch Privacy")) {
                                
                                if(firestoreQuery.playlist.name != "Review"){
                                    Task{
                                        await firestoreQuery.updatePlaylistPrivacy(playlist_id: firestoreQuery.playlist.playlistId)
                                        
                                        await firestoreQuery.getUserLibrary() //updates library
                                    }
                                    
                                    firestoreQuery.showPlaylistOptions = false
                                }
                            },
//                            .default(Text("Make Private")) {
//                                if(firestoreQuery.playlist.name != "Review"){
//                                    //updates privacy
//                                    Task{
//                                        await firestoreQuery.updatePlaylistPrivacy(playlist_id: firestoreQuery.playlist.playlistId)
//
//                                        await firestoreQuery.getUserLibrary() //updates library
//                                    }
//
//                                    firestoreQuery.showPlaylistOptions = false
//                                }
//                            },
                            .default(Text("Make Gallify Collection")) {
                                
                                let words = ["Liked", "Owned", "Created", "Review", "Featured", "Singles"]
                                let combinedResult = words.contains(where: firestoreQuery.playlist.name.contains)
                                if(!combinedResult){
                                    //updates privacy
                                    Task{
                                        await firestoreQuery.updatePlaylistType(newType: "Gallify Collection")
                                        
                                        await firestoreQuery.getUserLibrary() //updates library
                                    }
                                    firestoreQuery.showPlaylistOptions = false
                                }
                                
                            },
                            .default(Text("Make Playlist")) {
                                
                                let words = ["Liked", "Owned", "Created", "Review", "Featured", "Singles"]
                                let combinedResult = words.contains(where: firestoreQuery.playlist.name.contains)
                                if(!combinedResult){
                                    Task{
                                        await firestoreQuery.updatePlaylistType(newType: "Playlist")
                                        
                                        await firestoreQuery.getUserLibrary() //updates library
                                    }
                                    firestoreQuery.showPlaylistOptions = false
                                }
                            },
                            .default(Text("Cancel")) {
                                firestoreQuery.showPlaylistOptions = false
                                //firestoreQuery.addToPlaylist(artwork.art_id)
                            }])
                }
            }
            else{
                Button(action: {
                       
                }, label: {
                        
                    Image(systemName: "ellipsis")
                        .foregroundColor(.white)
                        .padding(.horizontal, screenWidth / 25)
                        
                })
            }
                
        }
        
    }
    
    /*func move(indices: IndexSet, newOffset: Int) {
        playlist.move(fromOffsets: indices, toOffset: newOffset)
        firestoreQuery.featuredArt = playlist //updates the firestore Query.
        //firestoreUpdatePlaylist() here
    
    }*/
    
}
