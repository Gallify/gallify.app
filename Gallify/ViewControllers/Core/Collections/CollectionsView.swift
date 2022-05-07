//
//  CollectionsView.swift
//  Gallify
//
//  Created by Shruti Sharma on 2/19/22.
//
import SwiftUI
import FirebaseFirestore
import FirebaseAuth
import SDWebImageSwiftUI

struct CollectionsView: View {
    
    @EnvironmentObject var viewModel: TabBarViewModel
    @EnvironmentObject var firestoreQuery: FirestoreQuery
    @State var showAddAlert = false
    @Environment(\.dismiss) var dismiss
    @State var showUnapprovedAlert = false

    let art : Art
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        var alertText = ""
        var alertTitle = ""
       
        VStack {
            
            Text("Add to Collection or Playlist")
                .padding(.top, screenHeight / 54)
                .font(.system(size: screenWidth / 22, weight: .semibold))
            
            ScrollView {
        
                ForEach(firestoreQuery.userLibrary){ playlist in
                    
                    //don't show if liked, owned, created, or review.
                    let words = ["Liked", "Owned", "Created", "Review"] //can't add to any of these
                    let combinedResult = words.contains(where: playlist.name.contains)
                    
                    if(!combinedResult && playlist.creator_url == firestoreQuery.data.uid){ //if it is your playlist/collection
                            
                        HStack {
                                 
                            SelfProfileCollectionListImage(imageHeight: screenHeight / 16.25, imageWidth: screenWidth / 7.5, playlist: playlist)
                                    
                            VStack(alignment: .leading) {
                                    
                                Text(playlist.name)
                                    .font(.system(size: screenWidth / 23.5))
                                
                                Text("by " + playlist.creator)
                                    .font(.system(size: screenWidth / 30, weight: .light))
                                        
                            }
                                    
                            Spacer()
                                    
                        }
                        .padding(.vertical, screenHeight / 160)
                        .padding(.leading, screenWidth / 25)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            Task {
                                
                                if(art.searchType != 2){
                                    //if playlist is a collection, only add if they are owner or creator.
                                    if(playlist.playlist_type == "Collection"){
                                        if(art.ownerId==firestoreQuery.data.uid || art.creatorId==firestoreQuery.data.uid ){
                                            let impactHeavy = UIImpactFeedbackGenerator(style: .heavy) //haptic feedback!
                                            impactHeavy.impactOccurred()
                                            
                                            await firestoreQuery.addArtToPlaylist(art: art, the_playlist: playlist)
                                            await firestoreQuery.getUserLibrary()
                                            
                                            if(playlist.name == "Featured"){
                                                await firestoreQuery.getFeaturedPlaylist()
                                                await firestoreQuery.getFeaturedArt()
                                            }
                                            //dismiss view
                                            dismiss()
                                        }
                                        else{
                                            //else - alert: not owned or created by you. So cannot add to collection.
                                            showAddAlert = true
                                            
                                            
                                        }
                                        
                                    }
                                    else{
                                        let impactHeavy = UIImpactFeedbackGenerator(style: .heavy) //haptic feedback!
                                        impactHeavy.impactOccurred()
                                        
                                        await firestoreQuery.addArtToPlaylist(art: art, the_playlist: playlist)
                                        await firestoreQuery.getUserLibrary()
                                        //dismiss view
                                        dismiss()
                                    
                                    }
                                }
                                else{
                                    showAddAlert = true //then user is trying to show unapproved art.
                                    
                                    
                                }
                            }
                        }
                        .alert(isPresented: $showAddAlert) {
                            Alert(title: Text("Can't Add Just Yet!"), message: Text("Art must be owned or created by the user to add to a collection. Art must also be approved before adding."), dismissButton: .default(Text("Cancel")))
                        }
//                        .alert(isPresented: $showAddAlert) {
//
//                            Alert(title: Text("Cannot Add to Collection"), message: Text("You can only add content you own or created to a collection"), dismissButton: .default(Text("Cancel")))
//                        }
                        
                    
                    }
            
                }
                .padding(.vertical, screenHeight / 80)
                .navigationBarHidden(true)
                
            }
            
        }
        
    }
    
}
