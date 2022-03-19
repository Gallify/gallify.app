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
    //@State var playlist = firestoreQuery.playlist
    @State var playlistArt: [Art] = [Art]()
    @State var art: Art = Art()
    
    
    @State private var showingSheet = false
    @State private var deleteFromPlaylist = false
    
    var body: some View {
        
        VStack{
        
            NavigationView{
                
                VStack{
                    
                    List{

                        //cover art for collection/album
                        HStack{

                            Spacer()
                            if firestoreQuery.playlist.cover_art_url == "" {

                            }
                            else{
                                WebImage(url: URL(string: firestoreQuery.playlist.cover_art_url))
                                    .resizable()
                                    .frame(width: 200, height: 200)
                                    .padding(.top, 20)
                                    //.padding(.bottom, 20)

                            }

                            Spacer()
                        }
                       // .padding(5)
                        .listRowSeparator(.hidden)


                        //the name and creator
                        VStack{
                            HStack{
                                Text("\(firestoreQuery.playlist.name)")
                                    .font(.system(size: screenWidth / 10, weight: .bold))
                                    .foregroundColor(Color.black)
                                    //.padding(.trailing, screenWidth / 7.5)
                                    .offset(x:15, y:30 )


                                Spacer()
                            }

                            HStack{

//                                NavigationLink(destination: CollectionGenericView(screenWidth: screenWidth, screenHeight: screenHeight),
//                                               label: {
//                                    Text("\(firestoreQuery.featuredPlaylist.creator)")
//                                        .font(.system(size: screenWidth / 20, weight: .light))
//                                        .foregroundColor(Color.black)
//                                        .padding(.trailing, screenWidth / 7.5)
//                                        .offset(x:15)
//                                })

                                NavigationLink(destination: OtherProfileView(),
                                               label: {
                                    Text("\(firestoreQuery.playlist.creator)")
                                        .font(.system(size: screenWidth / 20, weight: .light))
                                        .foregroundColor(Color.black)
                                        //.padding(.trailing, screenWidth / 7.5)
                                        .offset(x:15)
                                })

                                Spacer()
                            }
                        }
                        .listRowSeparator(.hidden)

                        
                        ForEach(firestoreQuery.playlistArt) { artwork in
                            
                            Button(action: {
                                
                                self.art = artwork//<-- update local art var to use later in the code
                                firestoreQuery.artisClicked = art.artId
                                firestoreQuery.artThatsPlaying = self.art
                                firestoreQuery.playlistThatsPlaying = firestoreQuery.playlist
                                firestoreQuery.isPresented.toggle()
                                firestoreQuery.maximized = true
                                firestoreQuery.showNewScreen = true
                                    
                                
                            }){
                                HStack {
                                
                                        HStack {
                                                
                                            WebImage(url: URL(string: artwork.thumbnail))
                                                .resizable()
                                                .frame(width: screenWidth / 7.5, height: screenHeight / 16.25)
                                                
                                            VStack(alignment: .leading) {
                                                    
                                                if(firestoreQuery.artisClicked == self.art.artId){
                                                    Text(artwork.name)
                                                        .foregroundColor(Color("Gallify-Pink"))
                                                        .fontWeight(.bold)
                                                        .font(.system(size: screenWidth / 20, weight: .medium))
                                                        .lineLimit(1)
                                                }
                                                else{
                                                    Text(artwork.name)
                                                        .fontWeight(.bold)
                                                        .font(.system(size: screenWidth / 20, weight: .medium))
                                                        .foregroundColor(.black)
                                                        .lineLimit(1)
                                                }
                                                
                                                Text("\(artwork.creator)")
                                                    .font(.system(size: screenWidth / 24, weight: .light))
                                                    .foregroundColor(.black)
                                                    .lineLimit(1)
                                                
                                                    
                                            }
                                            .padding(.leading, screenWidth / 37.5)
                                                
                                            Spacer()
                                        
                                        
                                        Button(action: {
                                            firestoreQuery.showArtOptions = true
                                            self.art = artwork //Setting art var when ellipses is clicked
                                        }, label: {
                                            Image(systemName: "ellipsis")
                                                .foregroundColor(.black)
                                        })
                                        .actionSheet(isPresented: $firestoreQuery.showArtOptions) {
                                            ActionSheet(
                                                title: Text("Select"),
                                                buttons: [
                                                    .default(Text("Delete art from Playlist")) {
                                                        Task
                                                        {
                                                            //remove from local variable to update view
                                                            playlist.removeAll { artwork in
                                                                artwork.artId == art.artId
                                                            }
                                                            await firestoreQuery.deleteArtFromPlaylist(art_id: art.artId, playlist: thePlaylist)
                                                        }
                                                    },
                                                    .default(Text("Add to Playlist")) {

                                                        //firestoreQuery.addToPlaylist(artwork.art_id)
                                                        showingSheet = true
                                                        
                                                    },
                                                    .default(Text("Cancel")) {

                                                        //firestoreQuery.addToPlaylist(artwork.art_id)
                                                        firestoreQuery.showArtOptions = false
                                                    }
                                                ]
                                            )
                                        }
                                        .sheet(isPresented: $showingSheet) {
                                            
                                            CollectionsView(art: art)
                                        
                                        }
                                        
                                    }
                                    
                                }
                                .padding(.vertical, screenHeight / 160)
                                .padding(.horizontal, screenWidth / 15)
                            }
                        }
                        .onMove { indexSet, offset in
                            playlist.move(fromOffsets: indexSet, toOffset: offset)
                            firestoreQuery.playlistArt = playlist
                            Task {
                                await firestoreQuery.updateArtPlaylist(playlist_id: thePlaylist.playlist_id, art_array: firestoreQuery.playlistArt)
                            }
                        }
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(InsetListStyle())
                    .toolbar {
                        EditButton()
                    }
                    .navigationBarTitle("")
                }
                .onAppear{
                    
                    Task{ await NetworkingCall() }
                    
                }
            
            }
            
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    
        
        }
    
//        func move(indices: IndexSet, newOffset: Int){
//            playlist.move(fromOffsets: indices, toOffset: newOffset)
//            firestoreQuery.featuredArt = playlist //updates the firestore Query.
//            //firestoreUpdatePlaylist() here
//
//        }
    
        func NetworkingCall() async {
            print("Playlist passed to generic row = ", thePlaylist.name)
            await firestoreQuery.getPlaylist(playlist_id: thePlaylist.playlist_id)
            
            await firestoreQuery.getPlaylistArt(playlist: firestoreQuery.playlist)
            //print("ART: \(firestoreQuery.playlistArt[1].creator)")
            playlist = firestoreQuery.playlistArt
            //firestoreQuery.playlist = thePlaylist
        }
    
    }




//struct CollectionGenericRow_Previews: PreviewProvider {
//    static var previews: some View {
//        CollectionGenericRow(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
//    }
//}


