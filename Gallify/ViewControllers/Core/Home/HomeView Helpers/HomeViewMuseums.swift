//
//  HomeViewMuseums.swift
//  Gallify
//
//  Created by Anshul on 9/10/21.
//
import SwiftUI

struct HomeViewMuseums: View {
    
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack {
                
                VStack {
                    
                    ZStack {
                        
                        Image(systemName: "squareshape.fill")
                            .resizable()
                            .foregroundColor(Color.purple)
                            .frame(width: screenWidth / 1.7, height: screenHeight / 3.65)
                            .cornerRadius(screenWidth / 15)
                        
                        VStack {
                            
                            Text("Dance")
                                .font(.system(size: screenWidth / 13.5, weight: .bold))
                                .foregroundColor(Color.white)
                            Text("Museum")
                                .font(.system(size: screenWidth / 13.5, weight: .bold))
                                .foregroundColor(Color.white)
                        }
                            
                    }
                    
                    Text("Dance Museum")
                        .font(.system(size: screenWidth / 18.5, weight: .semibold))
                        .frame(width: screenWidth / 1.7)
                        .lineLimit(1)
                    
                }
                .padding(.leading, screenWidth / 25)
                
                VStack {
                    
                    ZStack {
                        
                        Image(systemName: "squareshape.fill")
                            .resizable()
                            .foregroundColor(Color.green)
                            .frame(width: screenWidth / 1.7, height: screenHeight / 3.65)
                            .cornerRadius(screenWidth / 15)
                        
                        VStack {
                            
                            Text("Green")
                                .font(.system(size: screenWidth / 13.5, weight: .bold))
                                .foregroundColor(Color.white)
                            Text("Museum")
                                .font(.system(size: screenWidth / 13.5, weight: .bold))
                                .foregroundColor(Color.white)
                        }
                            
                    }
                    
                    Text("Green Museum")
                        .font(.system(size: screenWidth / 18.5, weight: .semibold))
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
        HomeViewMuseums(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width)
    }
}
