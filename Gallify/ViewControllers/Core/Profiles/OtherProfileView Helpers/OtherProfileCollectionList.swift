//
//  OtherProfileCollectionList.swift
//  Gallify
//
//  Created by Anshul on 9/23/21.
//
import SwiftUI
import SDWebImageSwiftUI

struct OtherProfileCollectionList: View {
    
    @EnvironmentObject var viewModel: TabBarViewModel
    @EnvironmentObject var firestoreQuery : FirestoreQuery
    
    var body: some View {
        
        let screenHeight = UIScreen.main.bounds.height //viewModel.screenHeight
        let screenWidth = UIScreen.main.bounds.width //viewModel.screenWidth
        
        VStack {
            
            HStack {
                        
                Text("Collections")
                    .font(.system(size: screenWidth / 12.5, weight: .semibold))
                
                Spacer()
                        
            }
            .padding(.leading, screenWidth / 15)
            .padding(.bottom, screenHeight / 160)
            .padding(.top, -screenHeight / 54)
            
            ForEach(firestoreQuery.otherLibrary.reversed()){ playlist in
                
                if(playlist.privacy != 0){
                        
                    NavigationLink(destination: CollectionGenericView(playlist: playlist),
                                   label: {
                        
                        HStack {
                            
                            SelfProfileCollectionListImage(imageHeight: screenHeight / 10.8, imageWidth: screenWidth / 5, playlist: playlist)
                           
                            VStack(alignment: .leading) {
                                    
                                Text(playlist.name)
                                    .font(.system(size: screenWidth / 17, weight: .semibold))
                                    .foregroundColor(.black)
                                    .lineLimit(1)
                                    
                                Text(playlist.playlistType + " • " + playlist.creator)
                                    .font(.system(size: screenWidth / 25.5))
                                    .foregroundColor(.black)
                                    .lineLimit(1)
                                    
                            }
                            .padding(.leading, screenWidth / 37.5)
                                
                            Spacer()
                                
                        }
                        .padding(.vertical, screenHeight / 160)
                        .padding(.leading, screenWidth / 15)
                        
                    }).simultaneousGesture(TapGesture().onEnded{
                        firestoreQuery.playlist = playlist
                        
                    })
                    
                }
                
            }
            
        }
        .padding(.vertical, screenHeight / 80)
        .navigationBarHidden(true)
        
    }
    
}

struct OtherProfileCollectionList_Previews: PreviewProvider {
    static var previews: some View {
        OtherProfileCollectionList()
            .environmentObject(TabBarViewModel())
            .environmentObject(FirestoreQuery())
    }
}
