//
//  CollectionViewLiked.swift
//  Gallify
//
//  Created by Gianluca Profio on 9/26/21.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth
import SDWebImageSwiftUI


struct CollectionGenericRow: View {
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    let thePlaylist: Playlist
    @EnvironmentObject var firestoreQuery : FirestoreQuery
    
    //state variables. These will be changed. Then will update FirestoreQuery versions. Then the FirestoreQuery versions will be updated.
    @State var playlist: [Art] = [Art]()
    @State var playlistArt: [Art] = [Art]()
    @State var art: Art = Art()
    @State var playlistOwner: User = User()
    //@State var veggies : [String] = ["app", "cat"]
    
    
    
    var body: some View {
        
        VStack {
                                
            List {
                        
                HStack {

                    Spacer()
                                            
                    let words = ["Featured", "featured", "Liked", "liked", "Owned", "owned", "Created", "created", "reviewed","Reviewed", "approved","Approved", "Review", "review", "Publish", "publish", "Published", "published", "unPublished", "unpublished"]
                    let combinedResult = words.contains(where: firestoreQuery.playlist.name.contains)
                    if (firestoreQuery.playlist.cover_art_url == "" && !combinedResult ) {

                    }
                    else{
                        
                        CollectionGenericImage(playlist: thePlaylist)
                    
                    }

                    Spacer()
                                            
                }
                .listRowSeparator(.hidden)
                                            
                HStack {
                                                
                    Text("\(firestoreQuery.playlist.name)")
                        .font(.system(size: screenWidth / 12, weight: .bold))
                                                
                    Spacer()
                                                
                }
                .padding(.horizontal, screenWidth / 20)
                .padding(.top, screenHeight / 40)
                .listRowSeparator(.hidden)

                HStack {

                    NavigationLink(destination: OtherProfileView(),
                                label: {
                                                        
                        HStack {
                                                                
                            Text("\(playlistOwner.firstName) " + "\(playlistOwner.lastName)")
                                .font(.system(size: screenWidth / 20, weight: .light))
                                .foregroundColor(Color.black)
                                                                
                            Image(systemName: "greaterthan")
                                .resizable()
                                .frame(width: screenWidth / 37.5, height: screenHeight / 80)
                                .foregroundColor(Color.gray)
                                .padding(.horizontal, screenWidth / 25)
                                                            
                        }
                                                    
                    })
                    .padding(.trailing, -screenWidth / 5)
                    

                    Spacer()
                                                
                }
                .padding(.horizontal, screenWidth / 20)
                .padding(.top, -screenHeight / 54)
                .listRowSeparator(.hidden)
                        
                if(playlist.count > 0) {
                                            
                    ForEach(0...playlist.count - 1, id: \.self) { i in
                                                
                        Button(action: {
                                                   
                            //firestoreQuery.data.isClicked = artwork.art_id
                                                    
                            firestoreQuery.artisClicked = playlist[i].artId
                            firestoreQuery.artThatsPlaying = playlist[i]
                            firestoreQuery.playlistThatsPlaying = firestoreQuery.playlist
                            firestoreQuery.artworkThatsPlaying = firestoreQuery.playlistArt
                                                
                            //firestoreQuery.isPresented.toggle()
                            //  firestoreQuery.maximized = true
                            firestoreQuery.showNewScreen = true
                            firestoreQuery.scrollTo = i
                                                    
                        }){
                                                    
                            HStack {
                                                            
                                WebImage(url: URL(string: playlist[i].thumbnail))
                                    .resizable()
                                    .frame(width: screenWidth / 7.5, height: screenHeight / 16.25)
                                                                
                                VStack(alignment: .leading) {
                                                                    
                                    if(firestoreQuery.artisClicked == playlist[i].artId) {
                                                                
                                        Text(playlist[i].name)
                                            .foregroundColor(Color("Gallify-Pink"))
                                            .font(.system(size: screenWidth / 20, weight: .medium))
                                            .lineLimit(1)
                                                                
                                    }
                                                            
                                    else {
                                                                    
                                        Text(playlist[i].name)
                                            .font(.system(size: screenWidth / 20, weight: .medium))
                                            .lineLimit(1)
                                                                
                                    }
                                                                
                                    Text("\(playlist[i].creator)")
                                        .font(.system(size: screenWidth / 24, weight: .light))
                                        .lineLimit(1)
                                                            
                                }
                                .padding(.leading, screenWidth / 37.5)
                                                                
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
                                            .default(Text("Delete from Playlist")) {
                                            //   firestoreQuery.deleteFromPlaylist(artwork.art_id)
                                            },
                                            .default(Text("Add to Playlist")) {
                                                //firestoreQuery.addToPlaylist(artwork.art_id)
                                            },
                                            .default(Text("Cancel")) {
                                                //firestoreQuery.addToPlaylist(artwork.art_id)
                                                firestoreQuery.showArtOptions = false
                                            }])
                                                                
                                }
                                
                            }
                            //.padding(.vertical, screenHeight / 160)
                            .padding(.horizontal, screenWidth / 20)
                            
                        }
                                            
                    }
                    .onMove { indexSet, offset in
                        playlist.move(fromOffsets: indexSet, toOffset: offset)
                        firestoreQuery.featuredArt = playlist
                        //firestore update here
                    }
                    .listRowSeparator(.hidden)
                        
                }
                        
            }
            .listStyle(InsetListStyle())
            .toolbar {
                    ToolbarItem(placement: ToolbarItemPlacement.bottomBar) {
                        EditButton()
                    }
            }
                    
        }
        .onAppear{async { await NetworkingCall() }}

    }
        
    
//        func move(indices: IndexSet, newOffset: Int){
//            playlist.move(fromOffsets: indices, toOffset: newOffset)
//            firestoreQuery.featuredArt = playlist //updates the firestore Query.
//            //firestoreUpdatePlaylist() here
//
//        }
    
        func NetworkingCall() async {
            
            if(thePlaylist.creator_url == firestoreQuery.data.uid){
                //then current user created this playlist
                playlistOwner = firestoreQuery.data
            }
            else{
                //get the creators info, and set it to playlistInfo
                await firestoreQuery.getOtherUser(user_id: thePlaylist.creator_url)
                playlistOwner = firestoreQuery.otherUserData
            }
            
            await firestoreQuery.getPlaylistArt(playlist: thePlaylist)
            
            playlist = firestoreQuery.playlistArt
            
            
        }
    
    }




//struct CollectionGenericRow_Previews: PreviewProvider {
//    static var previews: some View {
//        CollectionGenericRow(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
//    }
//}

