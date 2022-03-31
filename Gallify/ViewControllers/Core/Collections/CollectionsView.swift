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
    @EnvironmentObject var firestoreQuery : FirestoreQuery
    @State var showAddAlert = false
    @Environment(\.dismiss) var dismiss

    
    let art : Art
    
    var body: some View {
        
        let screenHeight = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width
        
        
       
       
        VStack {
            
            Text("Add to playlist or collection")
                .underline()
                .padding(.top, 10)
                .font(Font.body.bold())
                .foregroundColor(.primary)
               
                
            
            ScrollView{
        
                ForEach(firestoreQuery.userLibrary){ playlist in
                    
                    //don't show if liked, owned, created, or review.
                    let words = ["Liked", "Owned", "Created", "Review"] //can't add to any of these
                    let combinedResult = words.contains(where: playlist.name.contains)
                    if(!combinedResult && firestoreQuery.playlist.creator_url == firestoreQuery.data.uid){ //if it is your playlist/collection
                            HStack {
                                 
                                SelfProfileCollectionListImage(screenHeight: screenHeight, screenWidth: screenWidth, playlist: playlist)
                                
//                                WebImage(url: URL(string: playlist.cover_art_url))
//                                    .resizable()
//                                    .frame(width: screenWidth / 5, height: screenHeight / 10.8)
                                    
                                VStack(alignment: .leading) {
                                    
                                    Text(playlist.name)
                                        .font(.system(size: screenWidth / 17, weight: .semibold))
                                        .foregroundColor(.black)
                                        .lineLimit(1)
                                        
                                }
                                .padding(.leading, screenWidth / 37.5)
                                    
                                Spacer()
                                    
                            }
                            .padding(.vertical, screenHeight / 160)
                            .padding(.leading, screenWidth / 15)
                            .onTapGesture {
                                Task {
                                    
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
                            }
                            .alert(isPresented: $showAddAlert) {
                                Alert(title: Text("Cannot Add to Collection"), message: Text("You can only add content you own or created to a collection"), dismissButton: .default(Text("Cancel")))
                            }
                    
                    }
            
                }
            .padding(.vertical, screenHeight / 80)
            .navigationBarHidden(true)
            
                
    //            Spacer()
    //
    //            Button("Press to dismiss") {
    //                       dismiss()
    //            }
            }
        }
        
    }

    
}


//struct CollectionsView_Previews: PreviewProvider {
//    static var previews: some View {
//        CollectionsView()
////            .environmentObject(TabBarViewModel())
////            .environmentObject(FirestoreQuery())
//    }
//}
