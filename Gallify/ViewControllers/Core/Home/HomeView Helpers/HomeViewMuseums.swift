//
//  HomeViewMuseums.swift
//  Gallify
//
//  Created by Patron on 9/10/21.
//

import SwiftUI

struct HomeViewMuseums: View {
    
    let screenWidth: CGFloat
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack {
                
                VStack() {
                    
                    ZStack {
                        
                        Image(systemName: "squareshape.fill")
                            .resizable()
                            .foregroundColor(Color.purple)
                            .frame(width: screenWidth / 1.7, height: screenWidth / 1.7)
                            .cornerRadius(screenWidth / 15)
                        
                        VStack {
                            
                            Text("Dance")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            Text("Museum")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                        }
                            
                    }
                    
                    Text("Dance Museum")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(width: screenWidth / 1.7)
                        .lineLimit(1)
                    
                }
                .padding(.leading, screenWidth / 25)
                
                VStack() {
                    
                    ZStack {
                        
                        Image(systemName: "squareshape.fill")
                            .resizable()
                            .foregroundColor(Color.green)
                            .frame(width: screenWidth / 1.7, height: screenWidth / 1.7)
                            .cornerRadius(screenWidth / 15)
                        
                        VStack {
                            
                            Text("Green")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            Text("Museum")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                        }
                            
                    }
                    
                    Text("Green Museum")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(width: screenWidth / 1.7)
                        .lineLimit(1)
                    
                }
                .padding(.leading, screenWidth / 37.5)
                .padding(.trailing, screenWidth / 25)
                
            }
            
        }
        
    }
}

struct HomeViewMuseums_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewMuseums(screenWidth: UIScreen.main.bounds.width)
    }
}
