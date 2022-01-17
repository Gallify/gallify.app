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


struct FullScreenModalView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            Color.primary.edgesIgnoringSafeArea(.all)
            Button("Dismiss Modal") {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}



struct SelfProfileFeatured: View {
    
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    @EnvironmentObject var firestoreQuery : FirestoreQuery
    @State var isPresented = false
    
    
    var body: some View {
        
        Text("Featured")
            .fontWeight(.bold)
        
        //Spacer()
        
        VStack{
            
            
//            Text(firestoreQuery.data.email)
//            Text("GSDF" + firestoreQuery.featuredPlaylist.name)
            Text("HELLO FOR EACH LOOP FEATURED ART")
            ForEach(firestoreQuery.featuredArt){ artwork in
                
                //get art
                //Text("hi")
                //store art in 'featured art' array.
//                Text("hello")
//                Text(artwork.name)
                
                //get name of song.
                //get image
                //get views
                //get navlink to generic playlist
                
                
//                NavigationLink(destination: OtherProfileView(), label: {
//
//                    OtherSearchTemplate(screenHeight: screenHeight, screenWidth: screenWidth, image: Image("turtlerock"), title: "Desert", searchType: "Art", artistName: "Joe")
//                })
                
                
                
//                SlideOverView {
//
//                    VStack {
//
//                        CollectionReelView(screenWidth: screenWidth, screenHeight: screenHeight)
//
//                    }
//                }
                
                
                Button(action: {
                    firestoreQuery.isPresented.toggle()
                    firestoreQuery.data.isClicked = artwork.art_id
                }){
                    HStack {
                        
    //                    NavigationLink(
    //                        destination: DropDownReels(screenWidth: screenWidth, screenHeight: screenHeight),
    //                        label: {
    //                            WebImage(url: URL(string: artwork.content_url))
    //                                .resizable()
    //                                .frame(width: screenWidth / 8, height: screenWidth / 8)
    //
    //
    //                        })
                        
                        WebImage(url: URL(string: artwork.content_url))
                            .resizable()
                            .frame(width: screenWidth / 8, height: screenWidth / 8)
                        //Spacer()
                       
                        VStack{
                            
                            if(firestoreQuery.data.isClicked == artwork.art_id){
                                Text(artwork.name)
                                    .foregroundColor(Color("Gallify-Pink"))
                                    .fontWeight(.bold)
                            }
                            else{
                                Text(artwork.name)
                                    .fontWeight(.bold)
                            }
                            
                            HStack{
                                Text(artwork.creator)
                            }
                        }
                        //.padding()
                        
                        Spacer()
                    }
                }
                .fullScreenCover(isPresented: $firestoreQuery.isPresented){
                //SlideOverView(CollectionReelView(screenWidth: screenWidth, screenHeight: screenHeight))) //init
                    CollectionReelView(screenWidth: screenWidth, screenHeight: screenHeight)
                 //   FullScreenModalView()
                }
                
                
        }
            
        ForEach(firestoreQuery.playlists){ playlist in
            HStack {
                
                                
                NavigationLink(destination: DropDownReels(screenWidth: screenWidth, screenHeight: screenHeight), label: {
                    
//                        OtherSearchTemplate(screenHeight: screenHeight, screenWidth: screenWidth, image: WebImage(url: URL(string: playlist.cover_art_url)), title: "Desert", searchType: "Art", artistName: "Joe")
                    
                    HStack {
                            
                        WebImage(url: URL(string: playlist.cover_art_url))
                            .resizable()
                            .frame(width: screenWidth / 7.5, height: screenHeight / 16.25)
                            
                        VStack(alignment: .leading) {
                            
                           
                            Text(playlist.name)
                                .font(.system(size: screenWidth / 20, weight: .bold))
                                //.foregroundColor(.black)
                                
                            Text("by " + playlist.creator)
                                .font(.system(size: screenWidth / 25))
                                //.foregroundColor(.black)
                                
                        }
                        .padding(.horizontal, screenWidth / 50)
                            
                        Spacer()
                            
                    }
                    .padding(.horizontal, screenWidth / 25)
                    .padding(.bottom, screenHeight / 80)
                    
                })
                
            }
        }
        
        
        
        HStack {
            
            ZStack {
                
                RoundedRectangle(cornerRadius: screenWidth / 15)
                    .fill(Color.white)
                    .frame(width: screenWidth / 2.5, height: screenHeight / 5.4)
                    .overlay(RoundedRectangle(cornerRadius: screenWidth / 15).stroke(Color.black, lineWidth: screenWidth / 200))
                    .padding(.horizontal, screenWidth / 37.5)
                    .padding(.vertical, screenHeight / 80)

                VStack {
                    
                    Image(systemName: "cube.fill")
                        .resizable()
                        .frame(width: screenWidth / 6, height: screenHeight / 13)
                    
                    Text("Featuled")
                        .font(.system(size: screenWidth / 18.5, weight: .bold))
                    
                    Text("Room")
                        .font(.system(size: screenWidth / 18.5, weight: .bold))
                    
                }
                
            }
            
            ZStack {
                
                RoundedRectangle(cornerRadius: screenWidth / 15)
                    .fill(Color.black)
                    .frame(width: screenWidth / 2.5, height: screenHeight / 5.4)
                    .padding(.horizontal, screenWidth / 37.5)
                    .padding(.vertical, screenHeight / 80)

                VStack {
                    
                    HStack {
                        
                        Image(systemName: "tortoise.fill")
                                .resizable()
                                .frame(width: screenWidth / 6, height: screenHeight / 19.5)
                                .foregroundColor(.green)
                        
                        Image(systemName: "hare.fill")
                            .resizable()
                            .frame(width: screenWidth / 9, height: screenHeight / 19.5)
                            .foregroundColor(.white)
                        
                    }
                    .padding(.vertical, screenHeight / 80)
                    
                    Text("Jungle")
                        .font(.system(size: screenWidth / 18.5, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("Safari")
                        .font(.system(size: screenWidth / 18.5, weight: .bold))
                        .foregroundColor(.white)
                    
                }
                
            }
            
        }
        .padding(.vertical, screenHeight / 80)
        
        
        .environmentObject(firestoreQuery)
        .navigationBarHidden(true)
        //.onAppear{ NetworkingCall() }
        

        }
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
//    if(firestoreQuery.data.uid == ""){
//        firestoreQuery.getUser()
//    }
//    firestoreQuery.getFeaturedPlaylist(a: firestoreQuery.data.featured) //now have artids
//    print("Featured playlist name")
//    print(firestoreQuery.featuredPlaylist.name)
//    firestoreQuery.getFeaturedPlaylistArt(art_ids: firestoreQuery.featuredPlaylist.art)
//    print(firestoreQuery.featuredArt)
//}
    


//struct SelfProfileFeatured_Previews: PreviewProvider {
//    @Binding var isPresented: Bool
//
//    static var previews: some View {
//        SelfProfileFeatured(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width, isPresented: $isPresented)
//    }
//}
