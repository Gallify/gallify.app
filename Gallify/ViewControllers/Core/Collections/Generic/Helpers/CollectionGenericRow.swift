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
    @EnvironmentObject var loginModel: LoginAppViewModel
    
    //state variables. These will be changed. Then will update FirestoreQuery versions. Then the FirestoreQuery versions will be updated.
    @State var playlist: [Art] = [Art]()
    @State var playlistArt: [Art] = [Art]()
    @State var art: Art = Art()
    @State var playlistOwner: User = User()
    //@State var veggies : [String] = ["app", "cat"]
    
    @State private var showingSheet = false
    @State private var deleteFromPlaylist = false
    
    var body: some View {
        
        VStack {
                                
            List {
                        
                HStack {

                    Spacer()
                                            
                    let words = ["Featured", "featured", "Liked", "liked", "Owned", "owned", "Created", "created", "reviewed","Reviewed", "approved","Approved", "Review", "review", "Publish", "publish", "Published", "published", "unPublished", "unpublished"]
                    let combinedResult = words.contains(where: firestoreQuery.playlist.name.contains)
                    if (firestoreQuery.playlist.coverArtUrl == "" && !combinedResult ) {
                       
                        WebImage(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/gallify-64bbb.appspot.com/o/defaultImages%2Fplaylist.jpg?alt=media&token=5b40c6fe-8de6-4c70-8496-6e6896fdc71d"))
                            .resizable()
                            .frame(width: 200, height: 200)
                            .padding(.top, 20)
                        
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
                .padding(.horizontal, screenWidth / 200)
                .padding(.top, screenHeight / 40)
                .listRowSeparator(.hidden)

                HStack {

                    NavigationLink(destination: OtherProfileView(otherUserId: playlistOwner.uid), // thePlaylist or playlistOwner.uid
                                label: {
                                                        
                        HStack {
                                                                
                            Text("\(playlistOwner.displayName)")
                                .font(.system(size: screenWidth / 20, weight: .light))
                                .foregroundColor(Color.black)
                                                                
//                            Image(systemName: "greaterthan")
//                                .resizable()
//                                .frame(width: screenWidth / 37.5, height: screenHeight / 80)
//                                .foregroundColor(Color.primary)
//                                .font(Font.title.weight(.light))
//
//                                .padding(.vertical, 20)
                                                            
                        }
                                                    
                    })
                    .padding(.trailing, -screenWidth / 5)
                    

                    Spacer()
                                                
                }
                .padding(.horizontal, screenWidth / 200)
                .padding(.top, -screenHeight / 54)
                .listRowSeparator(.hidden)
                
                HStack {
                
                    if(firestoreQuery.playlist.privacy == 1){
                        Group{
                            Text("Public")
                                .font(.system(size: screenWidth / 30, weight: .medium))
                                .foregroundColor(Color.blue) +
                            Text(" • ")
                                .font(.system(size: screenWidth / 30, weight: .medium))
                                .foregroundColor(Color.primary) +
                            Text(thePlaylist.playlistType)
                                .font(.system(size: screenWidth / 30, weight: .medium))
                                .foregroundColor(Color.primary)
                        }
                            
                            
                    }
                    else{
                        Group{
                            Text("Private")
                                .font(.system(size: screenWidth / 30, weight: .medium))
                                .foregroundColor(Color("Gallify-Red")) +
                            Text(" • ")
                                .font(.system(size: screenWidth / 30, weight: .medium))
                                .foregroundColor(Color.primary) +
                            Text(thePlaylist.playlistType)
                                .font(.system(size: screenWidth / 30, weight: .medium))
                                .foregroundColor(Color.primary)
                        }
                        
                    }
                    
                                                
                    Spacer()
                                                
                }
                .padding(.horizontal, screenWidth / 200)
                .padding(.top, -screenHeight / 35)
                .listRowSeparator(.hidden)
                        
                if(playlist.count > 0) {
                                            
                    ForEach(0...playlist.count - 1, id: \.self) { i in
                                                
                        Button(action: {
                                                   
                            if(firestoreQuery.showCameraScreen==false && firestoreQuery.showNewScreen==false){
                                firestoreQuery.bothScreensMinimized = true
                            }
                            else{
                                firestoreQuery.bothScreensMinimized = false
                            }
                            
                            self.art = playlist[i]//<-- update local art var to use later in the code
                            firestoreQuery.artisClicked = playlist[i].artId
                            firestoreQuery.artThatsPlaying = self.art // used to be: playlist[i]
                            firestoreQuery.playlistThatsPlaying = firestoreQuery.playlist
                            firestoreQuery.artworkThatsPlaying = firestoreQuery.playlistArt
                                                
                            //firestoreQuery.isPresented.toggle()
                            //  firestoreQuery.maximized = true
                            firestoreQuery.showNewScreen = true
                            firestoreQuery.scrollTo = i
                            
                        }){
                                                    
                            HStack {
                                                            
                                WebImage(url: URL(string: playlist[i].thumbnailUrl))
                                    .resizable()
                                
                                    .scaledToFill()
                                    .frame(width: screenWidth / 7.5, height: screenHeight / 16.25)
                                    .clipped()
                                    
                                                                
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
                               

                                if(!loginModel.isGuest){
                                    //if else. If they created the playlist or not.
                                    if(thePlaylist.creatorUrl == firestoreQuery.data.uid){
                                        Button(action: {
                                            firestoreQuery.showGenericArtOptions = true
                                            self.art = playlist[i] //Setting art var when ellipses is clicked
                                        }, label: {

                                                                    
                                            Image(systemName: "ellipsis")
                                                .foregroundColor(.primary)
                                                                    
                                        })
                                        .actionSheet(isPresented: $firestoreQuery.showGenericArtOptions) {
                                                    
                                            ActionSheet(
                                                title: Text("Select"),
                                                buttons: [
                                                    .default(Text("Delete from Playlist")) {
                                                        Task{
                                                                //remove from local variable to update view
                                                                playlist.removeAll { artwork in
                                                                    artwork.artId == art.artId
                                                                }
                                                                print("Start Delete")
                                                                await firestoreQuery.deleteArtFromPlaylist(art_id: art.artId, playlist: thePlaylist)
                                                                print("End Delete")
                                                                await firestoreQuery.getUserLibrary()
                                                            
                                                                if(thePlaylist.name == "Featured"){
                                                                   
                                                                        await firestoreQuery.getFeaturedPlaylist()
                                                                        print(firestoreQuery.featuredArt.count)
                                                                        await firestoreQuery.getFeaturedArt()
                                                                        print(firestoreQuery.featuredArt.count)
                                                                    
                                                                }
                                                            }
                                                    },
                                                    .default(Text("Add to Collection")) {
                                                        showingSheet = true
                                                    },
                                                    .default(Text("Cancel")) {
                                                        //firestoreQuery.addToPlaylist(artwork.art_id)
                                                        firestoreQuery.showGenericArtOptions = false
                                                    }])
                                        }
                                        .sheet(isPresented: $showingSheet) {
                                                CollectionsView(art: art)
                                        }
                                        
                                    }
                                    else if(thePlaylist.name != "Review"){
                                        Button(action: {
                                            firestoreQuery.showGenericArtOptions = true
                                            self.art = playlist[i] //Setting art var when ellipses is clicked
                                        }, label: {
                                                                    
                                            Image(systemName: "ellipsis")
                                                .foregroundColor(.primary)
                                                                    
                                        })
                                        .actionSheet(isPresented: $firestoreQuery.showGenericArtOptions) {
                                                    
                                            ActionSheet(
                                                title: Text("Select"),
                                                buttons: [
                                                    .default(Text("Add to Collection")) {
                                                        showingSheet = true
                                                    },
                                                    .default(Text("Cancel")) {
                                                        //firestoreQuery.addToPlaylist(artwork.art_id)
                                                        firestoreQuery.showGenericArtOptions = false
                                                    }])
                                                                        
                                        }
                                        .sheet(isPresented: $showingSheet) {
                                                CollectionsView(art: art)
                                        }
                                        
                                        
                                    }
                                    else{
                                        
                                            Button(action: {
                                                firestoreQuery.showGenericArtOptions = true
                                                self.art = playlist[i] //Setting art var when ellipses is clicked
                                            }, label: {
                                                                        
                                                Image(systemName: "ellipsis")
                                                    .foregroundColor(.primary)
                                                                        
                                            })
                                            .actionSheet(isPresented: $firestoreQuery.showGenericArtOptions) {
                                                        
                                                ActionSheet(
                                                    title: Text("Select"),
                                                    buttons: [
                                                        .default(Text("Cancel")) {
                                                            //firestoreQuery.addToPlaylist(artwork.art_id)
                                                            firestoreQuery.showGenericArtOptions = false
                                                        }])
                                                                            
                                            }
                                            .sheet(isPresented: $showingSheet) {
                                                    CollectionsView(art: art)
                                            }
                                    }
                                }
                                
                                
                            }
                            //.padding(.vertical, screenHeight / 160)
                            .padding(.horizontal, screenWidth / 200)
                            
                        }
                                            
                    }
                    .onMove { indexSet, offset in
                        playlist.move(fromOffsets: indexSet, toOffset: offset)
                        
                        if(thePlaylist.name == "Featured"){
                            firestoreQuery.featuredArt = playlist
                            Task {//firestore update here
                                await firestoreQuery.updateArtPlaylist(playlist_id: thePlaylist.playlistId, art_array: firestoreQuery.featuredArt)
                                //refresh collection list
                                await firestoreQuery.getFeaturedPlaylist()
                                await firestoreQuery.getFeaturedArt()
                                await firestoreQuery.getUserLibrary()
                            }
                        }
                        else{
                            firestoreQuery.playlistArt = playlist
                            Task {//firestore update here
                                await firestoreQuery.updateArtPlaylist(playlist_id: thePlaylist.playlistId, art_array: firestoreQuery.playlistArt)
                                //refresh collection list
                                await firestoreQuery.getUserLibrary()
                            }
                        }
                    
                        
                    }
                    .listRowSeparator(.hidden)
                        
                }
                        
            }
            .listStyle(InsetListStyle())
            .toolbar {
                    ToolbarItem(placement: ToolbarItemPlacement.bottomBar) {
                        if(thePlaylist.creatorUrl == firestoreQuery.data.uid){
                            EditButton()
                        }
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
            
            //determines the owner of the playlist.
            if(thePlaylist.creatorUrl == firestoreQuery.data.uid){
                //then current user created this playlist
                playlistOwner = firestoreQuery.data
            }
            else{
                //get the creators info, and set it to playlistInfo
                await firestoreQuery.getOtherUser(user_id: thePlaylist.creatorUrl)
                playlistOwner = firestoreQuery.otherUserData
            }
            
            
            //shruti
            print("Playlist passed to generic row = ", thePlaylist.name)
            await firestoreQuery.getPlaylist(playlist_id: thePlaylist.playlistId)
            
            await firestoreQuery.getPlaylistArt(playlist: firestoreQuery.playlist)
            //print("ART: \(firestoreQuery.playlistArt[1].creator)")
            
            playlist = firestoreQuery.playlistArt
            //
            
            // code before
            //await firestoreQuery.getPlaylistArt(playlist: thePlaylist)
            //playlist = firestoreQuery.playlistArt
            
            
        }
    
    }




//struct CollectionGenericRow_Previews: PreviewProvider {
//    static var previews: some View {
//        CollectionGenericRow(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
//    }
//}

