//
//  SelfProfileFeatured.swift
//  Gallify
//
//  Created by Tejvir Mann on 1/8/22.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth
import SDWebImageSwiftUI

struct SelfProfileFeatured: View {
    
    @EnvironmentObject var viewModel: TabBarViewModel
    @EnvironmentObject var firestoreQuery: FirestoreQuery
    
    @State var featuredArtCount = 1
    @State private var sheetMode2: SheetMode = .none
    @State var showingSheet = false
    @State var art: Art = Art()
    //@Binding var showNewScreen: Bool
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        if (!firestoreQuery.featuredPlaylist.art.isEmpty) {
            
            VStack {
                
                //Spacer()
                
                HStack {
                    
                    Text("Featured")
                        .font(.system(size: screenWidth / 17.5, weight: .semibold))
                        
                            
                    Spacer()
                            
                }
                .padding(.leading, screenWidth / 15)
                .padding(.bottom, screenHeight / 160)
                    
                ForEach(0...featuredArtCount - 1, id: \.self) { i in
                    
                    let artwork = firestoreQuery.featuredArt[i]
                    
                    HStack {
                        
                        Text("\(i+1)")
                            .font(.system(size: screenWidth / 20, weight: .medium))
                            .padding(.trailing, screenWidth / 50)
                        
                        Button(action: {
                               
                            firestoreQuery.artisClicked = artwork.artId
                            firestoreQuery.artThatsPlaying = artwork
                            firestoreQuery.playlistThatsPlaying = firestoreQuery.featuredPlaylist
                            firestoreQuery.artworkThatsPlaying = firestoreQuery.featuredArt
                            
                           // firestoreQuery.isPresented.toggle()
                            
//                            firestoreQuery.sheetMode = .full
//                            firestoreQuery.maximized = true
//                            sheetMode2 = .full
                            
                            firestoreQuery.showNewScreen = true
                            firestoreQuery.scrollTo = i
                                
                            }){
                                
                                HStack {
                                                
                                    WebImage(url: URL(string: artwork.thumbnailUrl))
                                        .resizable()
                                        .frame(width: screenWidth / 7.5, height: screenHeight / 16.25)
                                                
                                    VStack(alignment: .leading) {
                                                    
                                        if (firestoreQuery.artisClicked == artwork.artId) {
                                            
                                            Text(artwork.name)
                                                .foregroundColor(Color("Gallify-Pink"))
                                                .fontWeight(.bold)
                                                .font(.system(size: screenWidth / 20, weight: .medium))
                                                .lineLimit(1)
                                            
                                        }
                                        
                                        else {
                                            
                                            Text(artwork.name)
                                                .fontWeight(.bold)
                                                .font(.system(size: screenWidth / 20, weight: .medium))
                                                .foregroundColor(.black)
                                                .lineLimit(1)
                                                
                                        }
                                        
                                        if (artwork.popularity < 1000) {
                                            
                                            Text("<1000")
                                                .font(.system(size: screenWidth / 24, weight: .light))
                                                .foregroundColor(.black)
                                                .lineLimit(1)
                                                
                                        }
                                        
                                        else {
                                            
                                            Text("\(artwork.popularity)")
                                                .font(.system(size: screenWidth / 24, weight: .light))
                                                .foregroundColor(.black)
                                                .lineLimit(1)
                                                
                                        }
                                                    
                                    }
                                    .padding(.leading, screenWidth / 37.5)
                                                
                                    Spacer()
                                                
                                }
                                .buttonStyle(ThemeAnimationStyle())
                                .navigationBarHidden(true)
                                
                        }
                        
                        Button(action: {
                            
                            firestoreQuery.showFeaturedOptions = true
                            self.art = firestoreQuery.featuredArt[i]
                            
                        }, label: {
                            
                            Image(systemName: "ellipsis")
                                .foregroundColor(.black)
                            
                        })
                        .actionSheet(isPresented: $firestoreQuery.showFeaturedOptions) {
                            ActionSheet(title: Text("Select"),
                                buttons: [
                                    .default(Text("Add to Playlist")) {
                                        showingSheet = true
                                        //firestoreQuery.addToPlaylist(artwork.art_id)
//                                        async {await firestoreQuery.addArtToPlaylist(art_id: "Q1XgaJ5IE1FyGgtvBpYN", playlist_id: firestoreQuery.featuredPlaylist.id)}
                                    },
                                    .default(Text("Cancel")) {
                                        firestoreQuery.showFeaturedOptions = false
                                        //firestoreQuery.addToPlaylist(artwork.art_id)
                                    }])
                                
                        }
                        .sheet(isPresented: $showingSheet) {
                                CollectionsView(art: art)
                        }
                        
                    }
                    .padding(.vertical, screenHeight / 160)
                    .padding(.horizontal, screenWidth / 15)
                    //   self.makeView()
                }
                .padding(-1)

                //Spacer()
                
            }
            .padding(.vertical, screenHeight / 160)
            .navigationBarHidden(true)
            .onAppear{async { await getfeaturedArtCount() }}
            //.onAppear(perform: getfeaturedArtCount)
            
        }
        
    }
    
    func getfeaturedArtCount() async {
        await firestoreQuery.getFeaturedArt()
        print("\(firestoreQuery.featuredArt.count) +  ART FEATURED")
        
        if (firestoreQuery.featuredArt.count > 5) {
            
            featuredArtCount = 5
            
        }
        
        else {
            
            featuredArtCount = firestoreQuery.featuredArt.count
            print("\(featuredArtCount) +  ART FEATURED")
        }
        
    }
    
}

