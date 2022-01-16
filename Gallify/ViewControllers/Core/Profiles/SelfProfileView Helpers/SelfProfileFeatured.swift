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
    @State var artNumber = 1
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        VStack{
            
            HStack {
                        
                Text("Featured")
                    .font(.system(size: screenWidth / 12.5, weight: .semibold))
                        
                Spacer()
                        
            }
            .padding(.leading, screenWidth / 15)
            .padding(.bottom, screenHeight / 160)
            
            ForEach(firestoreQuery.featuredArt){ artwork in
                
                HStack {
                    
                    Text("\(artNumber)")
                        .font(.system(size: screenWidth / 15, weight: .medium))
                        .padding(.trailing, screenWidth / 50)
                    
                    NavigationLink(destination: CollectionReelView(screenWidth: screenWidth, screenHeight: screenHeight),
                                   label: {
                        
                        HStack {
                                
                            WebImage(url: URL(string: artwork.content_url))
                                .resizable()
                                .frame(width: screenWidth / 7.5, height: screenHeight / 16.25)
                                
                            VStack(alignment: .leading) {
                                    
                                Text(artwork.name)
                                    .font(.system(size: screenWidth / 20, weight: .medium))
                                    .foregroundColor(.black)
                                    .lineLimit(1)
                                    
                                Text("\(artwork.popularity)")
                                    .font(.system(size: screenWidth / 24, weight: .light))
                                    .foregroundColor(.black)
                                    .lineLimit(1)
                                    
                            }
                            .padding(.leading, screenWidth / 37.5)
                                
                            Spacer()
                                
                        }
                        .buttonStyle(ThemeAnimationStyle())
                        .navigationBarHidden(true)
                        
                    })
                    
                    Button(action: {
                        
                    }, label: {
                        
                        Image(systemName: "ellipsis")
                            .foregroundColor(.black)
                        
                    })
                    
                }
                .padding(.vertical, screenHeight / 160)
                .padding(.horizontal, screenWidth / 15)

            }
            
        }
        .padding(.vertical, screenHeight / 80)
        .navigationBarHidden(true)
        //.onAppear{ NetworkingCall() }
        
    }
    
}
//func NetworkingCall(){
//
////    let db = Firestore.firestore()
////
////    do {
////        try db.collection("playlists").document("5THPCzOhAWpJkmiIqqbt").setData(from: Playlist())
////
////    } catch {
////        print("hi")
////    }
//
//
//    if(viewModel.firestoreQuery.data.uid == ""){
//        viewModel.firestoreQuery.getUser()
//    }
//    viewModel.firestoreQuery.getFeaturedPlaylist(a: viewModel.firestoreQuery.data.featured) //now have artids
//    print("Featured playlist name")
//    print(viewModel.firestoreQuery.featuredPlaylist.name)
//    viewModel.firestoreQuery.getFeaturedPlaylistArt(art_ids: viewModel.firestoreQuery.featuredPlaylist.art)
//    print(viewModel.firestoreQuery.featuredArt)
//}
    


struct SelfProfileFeatured_Previews: PreviewProvider {
    static var previews: some View {
        SelfProfileFeatured()
            .environmentObject(TabBarViewModel())
            .environmentObject(FirestoreQuery())
    }
}
