//
//  SelfProfileCollectionList.swift
//  Gallify
//
//  Created by Anshul on 9/23/21.
//
import SwiftUI
import SDWebImageSwiftUI

struct SelfProfileCollectionList: View {
    
    @EnvironmentObject var viewModel: TabBarViewModel
    @EnvironmentObject var firestoreQuery : FirestoreQuery
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        VStack {
            
            HStack {
                        
                Text("Collections")
                    .font(.system(size: screenWidth / 12.5, weight: .semibold))
                
                NavigationLink (destination: CreateLandingView(screenWidth: screenWidth, screenHeight: screenHeight),
                    label: {
                    
                        ZStack {
                            
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(Color("Gallify-Pinkish"))
                                .padding(.all, screenWidth / 55)
                                .frame(width: screenWidth / 9, height: screenWidth / 9)
                            
                            Image(systemName: "plus")
                                .resizable()
                                .foregroundColor(Color.white)
                                .frame(width: screenWidth / 25, height: screenWidth / 25)
                                
                            
                        }
                    
                    .padding(.trailing, screenWidth / 37.5)
                        
                })
                .buttonStyle(ThemeAnimationStyle())
                .navigationBarHidden(true)
                
                Spacer()
                        
            }
            .padding(.leading, screenWidth / 15)
            .padding(.bottom, screenHeight / 160)
            .padding(.top, -screenHeight / 54)
            
            ForEach(firestoreQuery.playlists){ playlist in
                
                NavigationLink(destination: CollectionGenericView(screenWidth: screenWidth, screenHeight: screenHeight),
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

struct SelfProfileCollectionList_Previews: PreviewProvider {
    static var previews: some View {
        SelfProfileCollectionList()
            .environmentObject(TabBarViewModel())
            .environmentObject(FirestoreQuery())
    }
}

