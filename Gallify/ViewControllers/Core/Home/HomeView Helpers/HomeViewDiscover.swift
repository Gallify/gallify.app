//
//  HomeViewDiscover.swift
//  Gallify
//
//  Created by Patron on 9/5/21.
//
import SwiftUI

struct HomeViewDiscover: View {
    
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack {
                
                VStack {
                    
                    ZStack {
                        
                        Image(systemName: "squareshape.fill")
                            .resizable()
                            .foregroundColor(Color.black)
                            .frame(width: screenWidth / 2.8, height: screenHeight / 6)
                            .cornerRadius(screenWidth / 15)
                        
                        VStack {
                            
                            Text("New Local")
                                .font(.system(size: screenWidth / 17, weight: .bold))
                                .foregroundColor(Color.white)
                            
                            Text("Artists")
                                .font(.system(size: screenWidth / 17, weight: .bold))
                                .foregroundColor(Color.white)
                        }
                            
                    }
                    
                    Text("Local Artists")
                        .font(.system(size: screenWidth / 18.5, weight: .semibold))
                        .frame(width: screenWidth / 2.8)
                        .lineLimit(1)
                    
                }
                .padding(.leading, screenWidth / 25)
                
                VStack {
                    
                    ZStack {
                        
                        Image(systemName: "squareshape.fill")
                            .resizable()
                            .foregroundColor(Color.black)
                            .frame(width: screenWidth / 2.8, height: screenHeight / 6)
                            .cornerRadius(screenWidth / 15)
                        
                        Image(systemName: "arrow.up.circle.fill")
                            .resizable()
                            .foregroundColor(Color.blue)
                            .frame(width: screenWidth / 5.5, height: screenHeight / 12)
                        
                    }
                    
                    Text("Top Collectors")
                        .font(.system(size: screenWidth / 18.5, weight: .semibold))
                        .frame(width: screenWidth / 2.8)
                        .lineLimit(1)
                    
                }
                .padding(.leading, screenWidth / 37.5)
                
                VStack {
                    
                    ZStack {
                        
                        Image(systemName: "squareshape.fill")
                            .resizable()
                            .foregroundColor(Color.black)
                            .frame(width: screenWidth / 2.8, height: screenHeight / 6)
                            .cornerRadius(screenWidth / 15)
                        
                        Image(systemName: "star.fill")
                            .resizable()
                            .foregroundColor(Color.orange)
                            .frame(width: screenWidth / 5.5, height: screenHeight / 12)
                        
                    }
                    
                    Text("Popular Artists")
                        .font(.system(size: screenWidth / 18.5, weight: .semibold))
                        .frame(width: screenWidth / 2.8)
                        .lineLimit(1)
                    
                }
                .padding(.trailing, screenWidth / 25)
                .padding(.leading, screenWidth / 37.5)
                
            }
            
        }
        
    }
    
}

struct HomeViewDiscover_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewDiscover(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width)
    }
}
