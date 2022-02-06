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
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        VStack {
            
            HStack {
                
                Text("Collections")
                    .font(.system(size: screenWidth / 12.5, weight: .semibold))
                
                Spacer()
                
            }
            .padding(.leading, screenWidth / 15)
            .padding(.bottom, screenHeight / 160)
            .padding(.top, -screenHeight / 54)
            
            ForEach(firestoreQuery.userLibrary){ playlist in
                
                NavigationLink(destination: CollectionGenericView(screenWidth: screenWidth, screenHeight: screenHeight, playlist: playlist),
                               label: {
                    
                    HStack {
                            
                        WebImage(url: URL(string: playlist.cover_art_url))
                            .resizable()
                            .frame(width: screenWidth / 5, height: screenHeight / 10.8)
                            
                        VStack(alignment: .leading) {
                                
                            Text(playlist.name)
                                .font(.system(size: screenWidth / 15, weight: .semibold))
                                .foregroundColor(.black)
                                .lineLimit(1)
                                
                            Text("by " + playlist.creator)
                                .font(.system(size: screenWidth / 20.5))
                                .foregroundColor(.black)
                                .lineLimit(1)
                                
                        }
                        .padding(.leading, screenWidth / 37.5)
                            
                        Spacer()
                            
                    }
                    .padding(.vertical, screenHeight / 160)
                    .padding(.leading, screenWidth / 15)
                    
                })
                
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
