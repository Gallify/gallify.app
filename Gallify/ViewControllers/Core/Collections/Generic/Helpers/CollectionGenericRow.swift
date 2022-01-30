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
    @EnvironmentObject var firestoreQuery : FirestoreQuery
    
    
    
    
    var body: some View {

        VStack{
            
            HStack{
                if firestoreQuery.featuredPlaylist.cover_art_url == "" {

                }
                else{
                    WebImage(url: URL(string: firestoreQuery.featuredPlaylist.cover_art_url))
                        .resizable()
                        .frame(width: 200, height: 200)
                        .padding(.top, 20)
                        .padding(.bottom, 20)
                        
                }
            }
            
            
            
            

        
        
            ForEach(firestoreQuery.featuredArt) { artwork in
                
                Button(action: {
                   
                    firestoreQuery.data.isClicked = artwork.art_id
                    firestoreQuery.isPresented.toggle()
                    firestoreQuery.maximized = true
                    firestoreQuery.showNewScreen = true
                    
                }){
                    HStack {
                        
                        
                            HStack {
                                    
                                WebImage(url: URL(string: artwork.content_url))
                                    .resizable()
                                    .frame(width: screenWidth / 7.5, height: screenHeight / 16.25)
                                    
                                VStack(alignment: .leading) {
                                        
                                    if(firestoreQuery.data.isClicked == artwork.art_id){
                                        Text(artwork.name)
                                            .foregroundColor(Color("Gallify-Pink"))
                                            .fontWeight(.bold)
                                            .font(.system(size: screenWidth / 20, weight: .medium))
                                            .lineLimit(1)
                                    }
                                    else{
                                        Text(artwork.name)
                                            .fontWeight(.bold)
                                            .font(.system(size: screenWidth / 20, weight: .medium))
                                            .foregroundColor(.black)
                                            .lineLimit(1)
                                    }
                                    
                                    
                                    if(artwork.popularity < 1000){
                                        Text("<1000")
                                            .font(.system(size: screenWidth / 24, weight: .light))
                                            .foregroundColor(.black)
                                            .lineLimit(1)
                                    }
                                    else{
                                        Text("\(artwork.popularity)")
                                            .font(.system(size: screenWidth / 24, weight: .light))
                                            .foregroundColor(.black)
                                            .lineLimit(1)
                                    }
                                        
                                }
                                .padding(.leading, screenWidth / 37.5)
                                    
                                Spacer()
                                    
//                            }
//                            .buttonStyle(ThemeAnimationStyle())
//                            .navigationBarHidden(true)
                            
                      //  })
                        
                        Button(action: {
                            firestoreQuery.showArtOptions = true
                        }, label: {
                            
                            Image(systemName: "ellipsis")
                                .foregroundColor(.black)
                            
                        })
                            .actionSheet(isPresented: $firestoreQuery.showArtOptions) {
                            ActionSheet(
                                title: Text("Select"),
                                buttons: [
                                    .default(Text("Delete from Playlist")) {
                                     //   firestoreQuery.deleteFromPlaylist(artwork.art_id)
                                    },
                                    .default(Text("Add to Playlist")) {
                                        
                                        //firestoreQuery.addToPlaylist(artwork.art_id)
                                    },
                                    .default(Text("Cancel")) {
                                        
                                        //firestoreQuery.addToPlaylist(artwork.art_id)
                                        firestoreQuery.showArtOptions = false
                                    }
                                    

                                ]
                            )
                        }
                    }
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                    }
                    .padding(.vertical, screenHeight / 160)
                    .padding(.horizontal, screenWidth / 15)
                    
                    
                    
                }
            

            
         //   self.makeView()
            }
            .padding(-1)
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        
            
        
        
        
        
        
        
        
        
        
        
        }
        
     
    
    }




struct CollectionGenericRow_Previews: PreviewProvider {
    static var previews: some View {
        CollectionGenericRow(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}

