//
//  ExpandedListing.swift
//  Gallify
//
//  Created by Gianluca Profio on 9/26/21.
//
import SwiftUI
import SDWebImageSwiftUI
import HalfASheet

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
    @State var artForDescription: Art = Art()
    @State var getModelforArt = ""
    @State var scrollTo = 0
    @State var showThumbnail = true
    @State var text3Dmodel = "Load 3D Artwork"
    @State var artLiked = false
    
   // var showDescription: Binding<Bool>
    
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        var likedArt = firestoreQuery.likedArt
       
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
                                
                                AnimatedImage(url: URL(string: artwork.thumbnailUrl))
                                    .resizable()
                                    .overlay(Rectangle()
                                        .frame(width: nil, height: 4, alignment: .top)
                                        .foregroundColor(Color.white), alignment: .top)
                                    .scaledToFit()
                                    .clipped()
                               // WebImage(url: URL(string: artwork.thumbnailUrl))

                               
                                        
                            }
                            
                            HStack {
                                
                                
                                
                                
                                
                                VStack(alignment: .leading) {
                                    
                                    CollectionReelNames(artwork: artwork, screenWidth: screenWidth)

                                }
                                .padding(.leading, screenWidth / 25)
                                .padding(.bottom, screenWidth / 25)
                                
                                Spacer()
                                
                                if(!loginModel.isGuest){
                                    /*
                                    Button(action: {
                                        
                                        // Add firebase methods to make changes on backend
                                        
                                        
                                        artLiked.toggle()
                                        
                                        //artLiked = true.
                                        
                                        
                                        
//                                        if(artLiked){
//
//                                            Task {
//                                                await firestoreQuery.addArtToPlaylist(art: art, playlistName: "Liked")
//                                                //reload library
//                                                await firestoreQuery.getUserLibrary()
//                                            }
//
//                                        }
//                                        else{
//                                            //remove from playlist
//                                            Task {
//                                                await firestoreQuery.removeArtFromPlaylist(art: art, playlistName: "Liked")
//                                                //reload library
//                                                await firestoreQuery.getUserLibrary()
//                                            }
//                                        }
                                        
                                    }, label: {
                                        
//                                        LikeButton(imageHeight: screenHeight / 40, imageWidth: screenWidth / 18.5, liked: (artLiked || firestoreQuery.likedArt.contains(artwork.artId)))
//                                            .padding(.vertical, screenWidth / 75)
                                        
                                        LikeButton(imageHeight: screenHeight / 40, imageWidth: screenWidth / 18.5, liked: (artLiked))
                                            .padding(.vertical, screenWidth / 75)
                                        
                                    })
                                    */
                                    
                                    
                                }
                                
                                
                                /*Text("$400")
                                    .font(.system(size: screenWidth / 20, weight: .light))
                                    .padding(.vertical, screenWidth / 75)*/
                                

//                                //button to switch from thumbnail to 3d model
//                                Button(action: {
//
//                                    showThumbnail.toggle()
//
//                                    if showThumbnail {
//                                        getModelforArt = ""
//                                        text3Dmodel = "View Model"
//
//                                        //kill thread and stop it from getting model
//                                    }
//                                    else {
//                                        getModelforArt = artwork.artId
//
//                                        text3Dmodel = "Loading.."
//
//                                        if(!firestoreQuery.models.isEmpty){
//
//
//                                            if(firestoreQuery.models[i] != nil){
//                                                if(firestoreQuery.models[i].contentLoaded){
//                                                    text3Dmodel = "Turn Off"
//                                                }
//                                                else{
//                                                    firestoreQuery.getModel(model: firestoreQuery.models[i])
//                                                }
//                                            }
//                                        }
//                                    }
//
//                                }, label: {
//                                    Text(text3Dmodel)
//                                })
                
//                                //add to playlist button
//                                Button(action: { // add to playlist, etc
//                                    self.showActionSheet.toggle()
//                                    art = artwork
//                                    print("art in reel listing = ", art.name)
//                                }) {
//                                    Image(systemName: "ellipsis")
//                                        .font(.system(size: 20))
//                                        .foregroundColor(.black)
//                                    }
//                                    .actionSheet(isPresented: $showActionSheet, content: {
//                                            self.actionSheet })
                                
                                //if else. If they created the playlist or not.
                                //used to be playlistThatsPlaying.creatorUrl
//                                if(artwork.ownerId == firestoreQuery.data.uid){
//                                    Button(action: {
//                                        firestoreQuery.showReelArtOptions = true
//                                        self.art = artwork //Setting art var when ellipses is clicked
//                                    }, label: {
//
//                                        Image(systemName: "ellipsis")
//                                            .foregroundColor(.primary)
//                                            .padding(.trailing, 10)
//
//                                    })
//                                    .actionSheet(isPresented: $firestoreQuery.showReelArtOptions) {

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
                                                .default(Text("Add to List")) {
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
                            
                            
                                Button {
                                    
                                    withAnimation(.easeInOut(duration: 0.2)) {
                                        
                                        showDetail.toggle()
                                        art_popup = artwork.artId
                                        self.artForDescription = artwork
                                       

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
                                            .padding(.trailing, screenWidth / 15)
                                            //.padding(.vertical, screenHeight / 160)
                                        
                                    }
                                    
                                }
                            }
                            
                            
//                            if (showDetail && artwork.artId == art_popup) {
//
//                                CollectionReelDescription(artDetails: artwork)
//
//                            }
                   
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
        .simultaneousGesture(
            DragGesture().onChanged({_ in
                   showDetail = false
               }))
        
        if (showDetail) {
            CollectionReelDescription(artDetails: self.artForDescription)
                .animation(.default)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                     
                            showDetail = false
                        }
                        .onEnded { gesture in
                     
                            showDetail = false
                        }
                )
                .gesture(
                    TapGesture()
                        .onEnded { _ in
                            showDetail = false
                        }
                )

        }
        
        
        
    }
    
}
