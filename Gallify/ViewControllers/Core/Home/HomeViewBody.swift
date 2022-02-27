//
//  HomeViewDiscover.swift
//  Gallify
//
//  Created by Anshul on 9/5/21.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth
import SDWebImageSwiftUI

struct HomeViewBody: View {
    
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    let museumCount: Int
    
    @EnvironmentObject var firestoreQuery : FirestoreQuery
    
    var body: some View {
        
        if (!firestoreQuery.homeMuseums.isEmpty && !firestoreQuery.homePlaylists.isEmpty) {
            
            ForEach(0...museumCount - 1, id: \.self) { i in
                
                HStack {

                    Text("\(firestoreQuery.homeMuseums[i].name)")
                        .font(.system(size: screenWidth / 13.5, weight: .bold))
                        .padding(.leading, screenWidth / 25)
                        .padding(.top, screenHeight / 100)

                    Spacer()

                }
                .padding(.bottom, -4)
                .padding(.top, 10)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        
                        ForEach(firestoreQuery.homePlaylists[i]) { playlist in
                              
                            VStack {
                                        
                                NavigationLink(destination: CollectionGenericView(screenWidth: screenWidth, screenHeight: screenHeight, playlist: playlist),
                                                label: {
                                                    
                                        WebImage(url: URL(string: playlist.cover_art_url))
                                            .resizable()
                                            .frame(width: screenWidth / 2.8, height: screenHeight / 6)
                                              
                                    })
                                    .simultaneousGesture(TapGesture().onEnded {
                                        firestoreQuery.playlist = playlist
                                    })
                                
                                Text(playlist.name)
                                    .font(.system(size: screenWidth / 18, weight: .semibold))
                                    .frame(width: screenWidth / 2.8)
                                    .lineLimit(1)
                                        
                                Text(playlist.playlist_type + " • " + playlist.creator)
                                    .font(.system(size: screenWidth / 25.5))
                                    .frame(width: screenWidth / 2.8)
                                    .lineLimit(1)
                                    
                            }
                            .padding(.horizontal, screenWidth / 75)
                            
                        }
                            
                    }
                    .padding(.horizontal, screenWidth / 50)
                    
                }
                
            }
            //.onAppear(perform: getPlaylistCount)
        }
        
    }
    
//    func getPlaylistCount(){
//        if(firestoreQuery.homeMuseums[i].playlist.count > 1){
//            playlistCount = firestoreQuery.homeMuseums[i].playlist.count
//        }
//
//
//    }
    
}
