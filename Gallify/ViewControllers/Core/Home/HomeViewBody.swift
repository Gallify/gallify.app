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
    let i: Int
    
    
    @EnvironmentObject var firestoreQuery : FirestoreQuery

    
    var body: some View {
        
        if(!firestoreQuery.homeMuseums.isEmpty && !firestoreQuery.homePlaylists.isEmpty){
            
            HStack {

                Text("\(firestoreQuery.homeMuseums[i].name)")
                    .font(.system(size: screenWidth / 13.5, weight: .bold))
                    .offset(x: 15)
//                    .padding(.leading, screenWidth)
//                    .padding(.top, screenHeight)

                Spacer()

            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                LazyHStack {
                    
                      ForEach(firestoreQuery.homePlaylists[i]) { playlist in
                          
                          Button(action: {
                              firestoreQuery.playlist = playlist
                          }, label: {
                              
                              NavigationLink(destination: CollectionGenericView(screenWidth: screenWidth, screenHeight: screenHeight, playlist: playlist),
                                         label: {
                                VStack {
                                    
                                    ZStack {
                                        
                                        WebImage(url: URL(string: playlist.cover_art_url))
                                            .resizable()
                                            .frame(width: screenWidth / 2.8, height: screenHeight / 6)
                                            
                                    }
                                    
                                    Text(playlist.name)
                                        .font(.system(size: screenWidth / 17, weight: .semibold))
                                        .frame(width: screenWidth / 2.8)
                                        .foregroundColor(.black)
                                        .lineLimit(1)
                                        
                                    Text(playlist.playlist_type + " | " + playlist.creator)
                                        .font(.system(size: screenWidth / 25.5))
                                        .frame(width: screenWidth / 2.8)
                                        .foregroundColor(.black)
                                        .lineLimit(1)
                                    
                                }
                                .padding(.leading, screenWidth / 25)
                              })
                              .simultaneousGesture(TapGesture().onEnded{
                                  firestoreQuery.playlist = playlist
                                  
                              })
                          })
                    }
                        
                }
                
            }
//        .onAppear(perform: getPlaylistCount)
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

struct HomeViewBody_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewBody(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width, i: 1) //why 1?
    }
}
