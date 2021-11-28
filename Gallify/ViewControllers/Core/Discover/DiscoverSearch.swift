//
//  DiscoverSearch.swift
//  Gallify
//
//  Created by Anshul on 11/28/21.
//

import SwiftUI

struct DiscoverSearch: View {
    
    @EnvironmentObject var viewModel: TabBarViewModel
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        VStack {
            
            NavigationLink(destination: OtherProfileView(), label: {
                    
                HStack {
                        
                    OtherSearchTemplate(screenHeight: screenHeight, screenWidth: screenWidth, image: Image("starry-night"), title: "Starry Night", searchType: "Art", artistName: "Vincent van Gogh")
                     
                    Image(systemName: "greaterthan")
                        .resizable()
                        .frame(width: screenWidth / 20, height: screenHeight / 43)
                        .foregroundColor(.black)
                        .padding(.horizontal, screenWidth / 25)
                        
                }
                    
            })
            
            NavigationLink(destination: OtherProfileView(), label: {
                    
                HStack {
                        
                    ArtistSearchTemplate(screenHeight: screenHeight, screenWidth: screenWidth, image: Image("leonardo"), artistName: "Leonardo da Vinci")
                        
                    Image(systemName: "greaterthan")
                        .resizable()
                        .frame(width: screenWidth / 20, height: screenHeight / 43)
                        .foregroundColor(.black)
                        .padding(.horizontal, screenWidth / 25)
                        
                }
                    
            })
            
            NavigationLink(destination: OtherProfileView(), label: {
                    
                HStack {
                        
                    OtherSearchTemplate(screenHeight: screenHeight, screenWidth: screenWidth, image: Image("charleyrivers"), title: "Dreamy Nights", searchType: "Collection", artistName: "Pablo Escobar")
                        
                    Image(systemName: "greaterthan")
                        .resizable()
                        .frame(width: screenWidth / 20, height: screenHeight / 43)
                        .foregroundColor(.black)
                        .padding(.horizontal, screenWidth / 25)
                        
                }
                    
            })
            
            NavigationLink(destination: OtherProfileView(), label: {
                    
                HStack {
                        
                    ArtistSearchTemplate(screenHeight: screenHeight, screenWidth: screenWidth, image: Image("cat"), artistName: "Meow!")
                        
                    Image(systemName: "greaterthan")
                        .resizable()
                        .frame(width: screenWidth / 20, height: screenHeight / 43)
                        .foregroundColor(.black)
                        .padding(.horizontal, screenWidth / 25)
                        
                }
                    
            })
            
            NavigationLink(destination: OtherProfileView(), label: {
                    
                HStack {
                        
                    OtherSearchTemplate(screenHeight: screenHeight, screenWidth: screenWidth, image: Image("lakemcdonald"), title: "Mountains", searchType: "Playelist", artistName: "Hiker")
                        
                    Image(systemName: "greaterthan")
                        .resizable()
                        .frame(width: screenWidth / 20, height: screenHeight / 43)
                        .foregroundColor(.black)
                        .padding(.horizontal, screenWidth / 25)
                        
                }
                    
            })
            
        }
        .padding(.top, screenHeight / 54)
        
    }
    
}

struct DiscoverSearch_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverSearch()
            .environmentObject(TabBarViewModel())
    }
}
