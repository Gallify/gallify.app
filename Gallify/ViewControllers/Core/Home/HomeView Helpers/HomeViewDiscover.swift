//
//  HomeViewDiscover.swift
//  Gallify
//
//  Created by Patron on 9/5/21.
//

import SwiftUI

struct HomeViewDiscover: View {
    
    let screenWidth: CGFloat
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack {
                
                VStack() {
                    
                    ZStack {
                        
                        Image(systemName: "squareshape.fill")
                            .resizable()
                            .foregroundColor(Color.black)
                            .frame(width: screenWidth / 2.8, height: screenWidth / 2.8)
                            .cornerRadius(screenWidth / 15)
                        
                        VStack {
                            
                            Text("New Local")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            Text("Artists")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                        }
                            
                    }
                    
                    Text("Local Artists")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(width: screenWidth / 2.8)
                        .lineLimit(1)
                        .allowsTightening(true)
                    
                }
                .padding(.leading, screenWidth / 25)
                
                VStack() {
                    
                    ZStack {
                        
                        Image(systemName: "squareshape.fill")
                            .resizable()
                            .foregroundColor(Color.black)
                            .frame(width: screenWidth / 2.8, height: screenWidth / 2.8)
                            .cornerRadius(screenWidth / 15)
                        
                        Image(systemName: "arrow.up.circle.fill")
                            .resizable()
                            .foregroundColor(Color.blue)
                            .frame(width: screenWidth / 5.5, height: screenWidth / 5.5)
                        
                    }
                    
                    Text("Top Collectors")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(width: screenWidth / 2.8)
                        .lineLimit(1)
                        .allowsTightening(true)
                }
                .padding(.leading, screenWidth / 37.5)
                
                VStack() {
                    
                    ZStack {
                        
                        Image(systemName: "squareshape.fill")
                            .resizable()
                            .foregroundColor(Color.black)
                            .frame(width: screenWidth / 2.8, height: screenWidth / 2.8)
                            .cornerRadius(screenWidth / 15)
                        
                        Image(systemName: "star.fill")
                            .resizable()
                            .foregroundColor(Color.orange)
                            .frame(width: screenWidth / 5.5, height: screenWidth / 5.5)
                        
                    }
                    
                    Text("Popular Artists")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(width: screenWidth / 2.8)
                        .lineLimit(1)
                        .allowsTightening(true)
                }
                .padding(.trailing, screenWidth / 25)
                .padding(.leading, screenWidth / 37.5)
                
            }
            
        }
        
    }
    
}

struct HomeViewDiscover_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewDiscover(screenWidth: UIScreen.main.bounds.width)
    }
}
