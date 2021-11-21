//
//  DiscoverViewRecentSearch.swift
//  Gallify
//
//  Created by Patron on 11/13/21.
//
import SwiftUI

struct DiscoverViewRecentSearch: View {
    
    @EnvironmentObject var viewModel: TabBarViewModel
    @State var showFirst = true
    @State var showSecond = true
    @State var showThird = true
    @State var showFourth = true
    @State var showFifth = true

    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        VStack {
            
            HStack {
                        
                Text("Recent Searches")
                    .font(.system(size: screenWidth / 13.5, weight: .semibold))
                        
                Spacer()
                        
            }
            .padding(.leading, screenWidth / 25)
            .padding(.vertical, screenHeight / 54)
            
            if showFirst {
                
                HStack {
                    
                    NavigationLink(destination: OtherProfileView(), label: {
                        
                        OtherSearchTemplate(screenHeight: screenHeight, screenWidth: screenWidth, image: Image("turtlerock"), title: "Desert", searchType: "Art", artistName: "Joe")
                    })
                    
                    Button(action: {
                        showFirst.toggle()
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: screenWidth / 20, height: screenHeight / 43)
                            .foregroundColor(.black)
                        
                    })
                    .padding(.horizontal, screenWidth / 25)
                    
                }
                
            }
            
            if showSecond {
                
                HStack {
                    
                    NavigationLink(destination: OtherProfileView(), label: {
                        
                        OtherSearchTemplate(screenHeight: screenHeight, screenWidth: screenWidth, image: Image("lakemcdonald"), title: "Mountains", searchType: "Playlist", artistName: "Hiker")
                        
                    })
                    
                    Button(action: {
                        showSecond.toggle()
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: screenWidth / 20, height: screenHeight / 43)
                            .foregroundColor(.black)
                        
                    })
                    .padding(.horizontal, screenWidth / 25)
                    
                }
                
            }
            
            if showThird {
                
                HStack {
                    
                    NavigationLink(destination: OtherProfileView(), label: {
                        
                        OtherSearchTemplate(screenHeight: screenHeight, screenWidth: screenWidth, image: Image("charleyrivers"), title: "Dreamy Nights", searchType: "Collection", artistName: "Pablo Escobar")
                        
                    })
                    
                    Button(action: {
                        showThird.toggle()
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: screenWidth / 20, height: screenHeight / 43)
                            .foregroundColor(.black)
                        
                    })
                    .padding(.horizontal, screenWidth / 25)
                    
                }
                
            }
            
            if showFourth {
                
                HStack {
                    
                    NavigationLink(destination: OtherProfileView(), label: {
                        
                        ArtistSearchTemplate(screenHeight: screenHeight, screenWidth: screenWidth, image: Image(systemName: "face.smiling.fill"), artistName: "Alan Walker")
                        
                    })
                    
                    Button(action: {
                        showFourth.toggle()
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: screenWidth / 20, height: screenHeight / 43)
                            .foregroundColor(.black)
                        
                    })
                    .padding(.horizontal, screenWidth / 25)
                    
                }
                
            }
            
            if showFifth {
                
                HStack {
                    
                    NavigationLink(destination: OtherProfileView(), label: {
                        
                        OtherSearchTemplate(screenHeight: screenHeight, screenWidth: screenWidth, image: Image("twinlake"), title: "Lakes", searchType: "Collection", artistName: "Fisherman")
                        
                    })
                    
                    Button(action: {
                        showFifth.toggle()
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: screenWidth / 20, height: screenHeight / 43)
                            .foregroundColor(.black)
                        
                    })
                    .padding(.horizontal, screenWidth / 25)
                    
                }
                
            }
            
        }
        
    }
    
}

struct DiscoverViewRecentSearch_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverViewRecentSearch()
            .environmentObject(TabBarViewModel())
    }
}
