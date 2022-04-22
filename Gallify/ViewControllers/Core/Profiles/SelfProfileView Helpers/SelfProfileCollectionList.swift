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
    @State private var showingSheet = false
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        VStack {
            
            HStack {
                        
                Text("Collections")
                    .font(.system(size: screenWidth / 12.5, weight: .semibold))
                
                Button(action: {
                    
                    showingSheet.toggle()
                    
                }, label: {
                    
                    ZStack {
                                    
                        RoundedRectangle(cornerRadius: screenWidth / 50)
                            .foregroundColor(Color("Gallify-Pinkish"))
                            .padding(.horizontal, screenWidth / 55)
                            .padding(.vertical, screenHeight / 120)
                            .frame(width: screenWidth / 8.3, height: screenHeight / 18)
                                    
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundColor(Color.white)
                            .frame(width: screenWidth / 25, height: screenHeight / 54)
                                        
                    }
                    
                })
                .sheet(isPresented: $showingSheet) {
                    
                    CreatePlaylistName()
                    
                }
                
                Spacer()
                        
            }
            .padding(.leading, screenWidth / 15)
            .padding(.bottom, screenHeight / 160)
            .padding(.top, -screenHeight / 54)
            
            ForEach(firestoreQuery.userLibrary.reversed()){ playlist in
                
                
                    
                NavigationLink(destination: CollectionGenericView(playlist: playlist),
                               label: {
                    
                    HStack {
                        
                        SelfProfileCollectionListImage(imageHeight: screenHeight / 10.8, imageWidth: screenWidth / 5, playlist: playlist)
                       
                        VStack(alignment: .leading) {
                                
                            Text(playlist.name)
                                .font(.system(size: screenWidth / 17, weight: .semibold))
                                .foregroundColor(.black)
                                .lineLimit(1)
                                
                            Text(playlist.playlist_type + " • " + playlist.creator)
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
