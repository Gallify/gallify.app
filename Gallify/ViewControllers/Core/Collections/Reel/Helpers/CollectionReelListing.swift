//
//  ExpandedListing.swift
//  Gallify
//
//  Created by Gianluca Profio on 9/26/21.
//

import SwiftUI
import SDWebImageSwiftUI


struct CollectionReelListing: View {
    
    @EnvironmentObject var firestoreQuery : FirestoreQuery
    
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
 
    
//    Setting The Screen Width
    let screenWidth: CGFloat
    let screenHeight: CGFloat

    
//    Add To Collection Pop-Up Integration
    var actionSheet: ActionSheet {
        ActionSheet(title: Text("Add to a Collection"), message: Text("Your Collections:"), buttons: [
            .default(Text("Collection 1")),
            .default(Text("Collection 2")),
            .default(Text("Like")) {
                Task {
                    await firestoreQuery.addArtToPlaylist(art: art, playlistName: "Liked")
                    //reload library
                }

            },
            .destructive(Text("Cancel"))
        ])
    }
    
    var body: some View {
        
       
        ScrollView {
            
            ScrollViewReader { value in
                
                if(firestoreQuery.artworkThatsPlaying.count > 0){ //if art in array
                    
                    ForEach(0...firestoreQuery.artworkThatsPlaying.count-1, id: \.self) { i in //for all art in array.
                
                        var artwork = firestoreQuery.artworkThatsPlaying[i]
                        
                        VStack {
                            
                            ZStack (alignment: .center) {
                                //show thumbnail or 3d model.
                                if(!firestoreQuery.models.isEmpty){
                                    if(!showThumbnail && getModelforArt == artwork.artId
                                       && firestoreQuery.models[i].contentLoaded && firestoreQuery.models[i] != nil){
                                          //  USDZPost(showThumbnail: $showThumbnail, model: firestoreQuery.models[i])
                                        USDZPost( model: firestoreQuery.models[i])
                                    }
                                    else{
                                        WebImage(url: URL(string: artwork.thumbnailUrl))
                                        .resizable()
                                        //.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                                        .overlay(Rectangle().frame(width: nil, height: 1, alignment: .top).foregroundColor(Color.black), alignment: .top)
                                        .scaledToFit()
                                    }

                                }
                            }
                            
                            
                            HStack {
                                
                                VStack{ //name and creator
                                    
                                    NavigationLink (
                                       destination: OtherProfileView(otherUserId: artwork.creatorId),
                                        label: {
                                            Text("\(artwork.creator)  ")
                                                .font(.system(size: 15))
                                                .foregroundColor(.primary)
                                                .fontWeight(.bold)
                                        })
                                    
                                    
                                    Text("\(artwork.name)  ")
                                        .font(.system(size: 20))
                                        .foregroundColor(.primary)
                                        .fontWeight(.light)
                                        //.padding(.leading, 70)
                                }
                                
                                
                                Spacer()
                                
                                
                                
                                
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
                                if(firestoreQuery.playlistThatsPlaying.creator_url == firestoreQuery.data.uid){
                                    Button(action: {
                                        firestoreQuery.showArtOptions = true
                                        self.art = artwork //Setting art var when ellipses is clicked
                                    }, label: {
                                                                
                                        Image(systemName: "ellipsis")
                                            .foregroundColor(.primary)
                                            .padding(.trailing, 10)
                                                                
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
                                                .default(Text("Delete from Playlist")) {
                                                    Task{
                                                            //remove from local variable to update view
                                                            firestoreQuery.playlistThatsPlaying.art.removeAll { artwork in
                                                                artwork == art.artId
                                                            }
                                                            print("Start Delete")
                                                            await firestoreQuery.deleteArtFromPlaylist(art_id: art.artId, playlist:  firestoreQuery.playlistThatsPlaying)
                                                            print("End Delete")
                                                           
                                                        
                                                            //this is a lot of calls. Goal is to reduce this later.
                                                            await firestoreQuery.getFeaturedPlaylist()
                                                            await firestoreQuery.getFeaturedArt()
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
                                else{
                                    Button(action: {
                                        firestoreQuery.showArtOptions = true
                                        self.art = artwork //Setting art var when ellipses is clicked
                                    }, label: {
                                                                
                                        Image(systemName: "ellipsis")
                                            .foregroundColor(.primary)
                                            .padding(.trailing, 10)
                                                                
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
                                
                                if(artwork.forSale == true && artwork.price != "" ){
                                    Text("\(artwork.price) Matic")
                                        //.foregroundColor(Color(red: 1.0, green: 0.55, blue: 1.0))
                                        .font(.system(size: 20))
                                        .foregroundColor(.primary)
                                        .padding(.trailing, 10)
                                        //.bold()
                                }
                        
                                
                            }

                            
                            //show details
                            Button {
                                withAnimation(.easeInOut(duration: 0.1)) {
                                    showDetail.toggle()
                                    art_popup = artwork.artId

                                    if(showDetail == false){
                                        art_popup = ""
                                    }
                                }
                            } label: {
                                VStack {

                                    Label("", systemImage: "chevron.down.circle")
                                        .imageScale(.large)
                                        .rotationEffect(.degrees(showDetail ? -180 : 0))
                                        .animation(.spring(), value: showDetail)
                                        .font(.system(size: 20))
                                        .foregroundColor(.black)
                                        .offset(y:-30)


                                    Spacer()
                                }
                            }
                            .font(.system(size: 17))
                            
                            if (showDetail && artwork.artId == art_popup) {
                                CollectionReelDescription(screenWidth: screenWidth, screenHeight: screenHeight, artDetails: artwork)

                            }
                   
                        }
                        .frame(width: screenWidth)
                    }
                    .onChange(of: scrollTo, perform: { scroll in
                        value.scrollTo(scrollTo, anchor: .top)
                       
                    })
                    
                }
            
            }
        }
        .onAppear(){
            firestoreQuery.scrollTo = firestoreQuery.scrollTo
            
            //set up the models for the art in reels for each art element.
            firestoreQuery.clearModels()
            firestoreQuery.setModelData()
           // print(firestoreQuery.setModelData())
        }
        .task{ //scroll to right part of list.
            if(scrollTo != firestoreQuery.scrollTo){
                scrollTo = firestoreQuery.scrollTo
            }
        }
 
    }
}

struct CollectionReelListing_Previews: PreviewProvider {
    static var previews: some View {
        CollectionReelListing(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}



