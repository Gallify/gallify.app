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

struct OtherProfileFeatured: View {
    
    @EnvironmentObject var viewModel: TabBarViewModel
    @EnvironmentObject var firestoreQuery: FirestoreQuery
    @EnvironmentObject var loginModel: LoginAppViewModel

    

    
    @State var featuredArtCount = 1
    @State private var sheetMode2: SheetMode = .none
    @State var showingSheet = false
    @State var art: Art = Art()
    //@Binding var showNewScreen: Bool
    
    var body: some View {
        
        let screenHeight = UIScreen.main.bounds.height //viewModel.screenHeight
        let screenWidth = UIScreen.main.bounds.width //viewModel.screenWidth
        
        if(firestoreQuery.otherFeaturedPlaylist.privacy != 0){
            if (!firestoreQuery.otherFeaturedArt.isEmpty) {
                
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
                        
                        let artwork = firestoreQuery.otherFeaturedArt[i]
                        
                        HStack {
                            
                            Text("\(i+1)")
                                .font(.system(size: screenWidth / 20, weight: .medium))
                                .padding(.trailing, screenWidth / 50)
                            
                            Button(action: {
                                
                                if(firestoreQuery.showCameraScreen==false && firestoreQuery.showNewScreen==false){
                                    firestoreQuery.bothScreensMinimized = true
                                }
                                else{
                                    firestoreQuery.bothScreensMinimized = false
                                }
                                   
                                firestoreQuery.artisClicked = artwork.artId
                                firestoreQuery.artThatsPlaying = artwork
                                firestoreQuery.playlistThatsPlaying = firestoreQuery.otherFeaturedPlaylist
                                firestoreQuery.artworkThatsPlaying = firestoreQuery.otherFeaturedArt
                                
                                firestoreQuery.isPresented.toggle()
                                
                                firestoreQuery.sheetMode = .full
                                firestoreQuery.maximized = true
                                sheetMode2 = .full
                                
                                firestoreQuery.showNewScreen = true
                                    
                                }){
                                    
                                    HStack {
                                                    
                                        WebImage(url: URL(string: artwork.thumbnailUrl))
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: screenWidth / 7.5, height: screenHeight / 16.25)
                                            .clipped()
                                                    
                                        VStack(alignment: .leading) {
                                                        
                                            if (firestoreQuery.artisClicked == artwork.artId) { //
                                                
                                                Text(artwork.name)
                                                    .foregroundColor(Color("Gallify-Pink"))
                                                    .font(.system(size: screenWidth / 20, weight: .medium))
                                                    .lineLimit(1)
                                                
                                            }
                                            
                                            else {
                                                
                                                Text(artwork.name)
                                                    .font(.system(size: screenWidth / 20, weight: .medium))
                                                    .lineLimit(1)
                                                    .foregroundColor(.black)
                                                    
                                            }
                                            
                                            if (artwork.popularity < 1000) {
                                                
                                                Text("<1000")
                                                    .font(.system(size: screenWidth / 24, weight: .light))
                                                    .lineLimit(1)
                                                    .foregroundColor(.black)
                                                    
                                            }
                                            
                                            else {
                                                
                                                Text("\(artwork.popularity)")
                                                    .font(.system(size: screenWidth / 24, weight: .light))
                                                    .lineLimit(1)
                                                    .foregroundColor(.black)
                                                    
                                            }
                                                        
                                        }
                                        .padding(.leading, screenWidth / 37.5)
                                                    
                                        Spacer()
                                                    
                                    }
                                    .buttonStyle(ThemeAnimationStyle())
                                    .navigationBarHidden(true)
                                    
                            }
                            
                            
                            if(!loginModel.isGuest){
                                Button(action: {
                                    
                                    firestoreQuery.showFeaturedOptions = true
                                    self.art = firestoreQuery.otherFeaturedArt[i]
                                    
                                }, label: {
                                    
                                    Image(systemName: "ellipsis")
                                        .foregroundColor(.black)
                                    
                                })
                                .actionSheet(isPresented: $firestoreQuery.showFeaturedOptions) {
                                    ActionSheet(title: Text("Select"),
                                        buttons: [
                                            .default(Text("Add to List")) {
                                                showingSheet = true
                                                //firestoreQuery.addToPlaylist(artwork.art_id)
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
                .onAppear(perform: getfeaturedArtCount)
                
            }
        }
        
    }
    
    func getfeaturedArtCount() {
        
        if (firestoreQuery.otherFeaturedArt.count > 5) {
            
            featuredArtCount = 5
            
        }
        
        else {
            
            featuredArtCount = firestoreQuery.otherFeaturedArt.count
            
        }
        
    }
    
}

