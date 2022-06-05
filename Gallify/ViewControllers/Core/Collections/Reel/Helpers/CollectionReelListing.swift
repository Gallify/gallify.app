//
//  ExpandedListing.swift
//  Gallify
//
//  Created by Gianluca Profio on 9/26/21.
//
import SwiftUI
import SDWebImageSwiftUI

struct CollectionReelListing: View {
    
    @EnvironmentObject var viewModel: TabBarViewModel
    @EnvironmentObject var firestoreQuery: FirestoreQuery
    @EnvironmentObject var loginModel: LoginAppViewModel

    
    @State private var showDetail = false
    @State var showActionSheet: Bool = false
    @State var showingSheet: Bool = false
    @State var art_popup = ""
    //@State var art = Art()
    @State var art: Art = Art()
    @State var getModelforArt = ""
    @State var scrollTo = 0
    @State var showThumbnail = true
    @State var text3Dmodel = "Load 3D Artwork"
    @State var artLiked = false
    
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
       
        ScrollView {
            
            ScrollViewReader { value in
                
                if(firestoreQuery.artworkThatsPlaying.count > 0){ //if art in array
                    
                    ForEach(0...firestoreQuery.artworkThatsPlaying.count-1, id: \.self) { i in //for all art in array.
                
                        var artwork = firestoreQuery.artworkThatsPlaying[i]
                        
                        VStack {
                            
                            if(!showThumbnail && getModelforArt == artwork.artId
                                && firestoreQuery.models[i].contentLoaded && firestoreQuery.models[i] != nil) {
                                USDZPost(model: firestoreQuery.models[i])
                            }
                                
                            else {
                                        
                                WebImage(url: URL(string: artwork.thumbnailUrl))
                                .resizable()
                                .overlay(Rectangle()
                                    .frame(width: nil, height: 1, alignment: .top)
                                    .foregroundColor(Color.black), alignment: .top)
                                .scaledToFit()
                                        
                            }
                            
                            HStack {
                                
                                
                                
                                
                                
                                VStack(alignment: .leading) {
                                    
                                    CollectionReelNames(artwork: artwork, screenWidth: screenWidth)

                                }
                                .padding(.leading, screenWidth / 25)
                                
                                Spacer()
                                
                                if(!loginModel.isGuest){
                                    Button(action: {
                                        
                                        // Add firebase methods to make changes on backend
                                        artLiked.toggle()
                                        if(artLiked){
//                                            Task {
//                                                await firestoreQuery.addArtToPlaylist(art: art, playlistName: "Liked")
//                                                //reload library
//                                                await firestoreQuery.getUserLibrary()
//                                            }

                                        }
                                        else{
                                            //remove from playlist
                                        }
                                        
                                    }, label: {
                                        
                                        LikeButton(imageHeight: screenHeight / 40, imageWidth: screenWidth / 18.5, liked: artLiked)
                                            .padding(.vertical, screenWidth / 75)
                                        
                                    })
                                }
                                
                                
                                /*Text("$400")
                                    .font(.system(size: screenWidth / 20, weight: .light))
                                    .padding(.vertical, screenWidth / 75)*/
                                
//                                if(artwork.forSale == true) {
//
//                                    Text("$\(artwork.price)")
//                                        .font(.system(size: screenWidth / 20, weight: .light))
//                                        .padding(.vertical, screenWidth / 75)
//
//                                }
                                
                                
                                if(!loginModel.isGuest){
                                    Button(action: {
                                        
                                        firestoreQuery.showArtOptions = true
                                        self.art = artwork //Setting art var when ellipses is clicked
                                        
                                    }, label: {
                                                                    
                                        Image(systemName: "ellipsis")
                                            .foregroundColor(.primary)
                                            .padding(.trailing, screenWidth / 25)
                                                                    
                                    })
                                    .actionSheet(isPresented: $firestoreQuery.showArtOptions) {
                                                    
                                        ActionSheet(
                                            title: Text("Select"),
                                            buttons: [
                                                .default(Text("Like")) {
                                                    Task {
                                                        await firestoreQuery.addArtToPlaylist(art: art, playlistName: "Liked")
                                                        //reload library
                                                        await firestoreQuery.getUserLibrary()
                                                    }
                                                },
                                                .default(Text("Add to Playlist")) {
                                                    showingSheet = true
                                                },
                                                .default(Text("Cancel")) {
                                                    //firestoreQuery.addToPlaylist(artwork.art_id)
                                                    firestoreQuery.showArtOptions = false
                                                }])
                                                                        
                                    }
                                    .sheet(isPresented: $showingSheet) {
                                            CollectionsView(art: art)
                                    }
                                }
                            }
                            
                            Button {
                                
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    
                                    showDetail.toggle()
                                    art_popup = artwork.artId

                                    if(showDetail == false) {
                                        art_popup = ""
                                    }
                                    
                                }
                                
                            } label: {
                                    
                                VStack {

                                    Label("", systemImage: "chevron.down.circle")
                                        .imageScale(.large)
                                        .rotationEffect(.degrees((showDetail && artwork.artId == art_popup) ? -180 : 0))
                                        .animation(.linear, value: showDetail)
                                        .font(.system(size: screenWidth / 20))
                                        .foregroundColor(.black)
                                        .padding(.vertical, screenHeight / 160)
                                    
                                }
                                
                            }
                            
                            if (showDetail && artwork.artId == art_popup) {
                                
                                CollectionReelDescription(artDetails: artwork)
                                
                            }
                   
                        }
                        
                    }
                    .onChange(of: firestoreQuery.scrollTo, perform: { scroll in
                        value.scrollTo(firestoreQuery.scrollTo, anchor: .top)
                    })
                    .onAppear(perform: {
                        
                        var i = 0
                        for art in firestoreQuery.artworkThatsPlaying {
                                
                            if(art.artId == firestoreQuery.artThatsPlaying.artId) {
                                    
                                firestoreQuery.scrollTo = i
                                    
                            }
                                
                            i += 1
                            
                        }
                        
                        value.scrollTo(firestoreQuery.scrollTo, anchor: .top)
                        
                    })
                    
                }
            
            }
            
        }
 
    }
    
}
