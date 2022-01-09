//
//  SelfProfileCollectionList.swift
//  Gallify
//
//  Created by Anshul on 9/23/21.
//
import SwiftUI
import SDWebImageSwiftUI

struct SelfProfileCollectionList: View {
    
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    @EnvironmentObject var firestoreQuery : FirestoreQuery
    
    var body: some View {
        
        VStack {
            
            ForEach(firestoreQuery.playlists){ playlist in
                HStack {
                    
                                    
                    NavigationLink(destination: CollectionGenericView(screenWidth: screenWidth, screenHeight: screenHeight), label: {
                        
//                        OtherSearchTemplate(screenHeight: screenHeight, screenWidth: screenWidth, image: WebImage(url: URL(string: playlist.cover_art_url)), title: "Desert", searchType: "Art", artistName: "Joe")
                        
                        HStack {
                                
                            WebImage(url: URL(string: playlist.cover_art_url))
                                .resizable()
                                .frame(width: screenWidth / 7.5, height: screenHeight / 16.25)
                                
                            VStack(alignment: .leading) {
                                    
                                Text(playlist.name)
                                    .font(.system(size: screenWidth / 20, weight: .bold))
                                    .foregroundColor(.black)
                                    
                                Text("by " + playlist.creator)
                                    .font(.system(size: screenWidth / 25))
                                    .foregroundColor(.black)
                                    
                            }
                            .padding(.horizontal, screenWidth / 50)
                                
                            Spacer()
                                
                        }
                        .padding(.horizontal, screenWidth / 25)
                        .padding(.bottom, screenHeight / 80)
                        
                    })
                    
                }
            }
            
            
            
            SelfProfileCollectionTab(screenHeight: screenHeight, screenWidth: screenWidth, image: Image("charleyrivers"), collectionName: "My TopCollection1", artist: "jackbrown")
            
            SelfProfileCollectionTab(screenHeight: screenHeight, screenWidth: screenWidth, image: Image("umbagog"), collectionName: "My TopCollection2", artist: "jackbrown")
            
            SelfProfileCollectionTab(screenHeight: screenHeight, screenWidth: screenWidth, image: Image("twinlake"), collectionName: "My TopCollection3", artist: "jackbrown")
            
            SelfProfileCollectionTab(screenHeight: screenHeight, screenWidth: screenWidth, image: Image("hiddenlake"), collectionName: "My TopCollection4", artist: "jackbrown")
            
            SelfProfileCollectionTab(screenHeight: screenHeight, screenWidth: screenWidth, image: Image("turtlerock"), collectionName: "My TopCollection5", artist: "jackbrown")
            
        }
        .padding(.vertical, screenHeight / 80)
        .environmentObject(firestoreQuery)
        
    }
}

struct SelfProfileCollectionList_Previews: PreviewProvider {
    static var previews: some View {
        SelfProfileCollectionList(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width)
    }
}
