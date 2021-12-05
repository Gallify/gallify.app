//
//  DiscoveryCategoryContent.swift
//  Gallify
//
//  Created by Gianluca Profio on 11/7/21.
//

import SwiftUI

struct DiscoveryCategoryContent: View {
    
    let screenWidth: CGFloat

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            
            VStack {
                HStack {
                    
                    VStack {
                        
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
                        
                    }
                    .padding(.leading, screenWidth / 37.5)
                    
                    VStack {
                        
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
                        
                    }
                    .padding(.trailing, screenWidth / 25)
                    .padding(.leading, screenWidth / 37.5)
                    
                }
            }
            .padding(.bottom)
            
            ScrollView(.horizontal, showsIndicators: false)
            {
                
                VStack {
                    
                    HStack {
                        
                        VStack {
                            
                            ZStack {
                                
                                Image(systemName: "squareshape.fill")
                                    .resizable()
                                    .foregroundColor(Color.black)
                                    .frame(width: screenWidth / 2.8, height: screenWidth / 2.8)
                                    .cornerRadius(screenWidth / 15)
                                
                                Image(systemName: "flame.fill")
                                    .resizable()
                                    .foregroundColor(Color.yellow)
                                    .frame(width: screenWidth / 5.5, height: screenWidth / 5.5)
                                
                            }
                            
                            Text("Hottest Art")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .frame(width: screenWidth / 2.8)
                                .lineLimit(1)
                            
                        }
                        .padding(.leading, screenWidth / 25)
                        
                        VStack() {
                            
                            Image("silversalmoncreek")
                                .resizable()
                                .frame(width: screenWidth / 2.8, height: screenWidth / 2.8)
                                .cornerRadius(screenWidth / 15)
                            
                            Text("Mountains")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .frame(width: screenWidth / 2.8)
                                .lineLimit(1)
                            
                        }
                        .padding(.leading, screenWidth / 37.5)
                        
                        VStack {
                            
                            Image("hiddenlake")
                                .resizable()
                                .frame(width: screenWidth / 2.8, height: screenWidth / 2.8)
                                .cornerRadius(screenWidth / 15)
                            
                            Text("Snowy Areas")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .frame(width: screenWidth / 2.8)
                                .lineLimit(1)
                            
                        }
                        .padding(.trailing, screenWidth / 25)
                        .padding(.leading, screenWidth / 37.5)
                        
                    }
                    
                }
                
            }
            .padding(.bottom, screenWidth / 25)
            
        }
        .padding(.bottom)
        
    }
    
}


struct DiscoveryCategoryContent_Previews: PreviewProvider {
    static var previews: some View {
        DiscoveryCategoryContent(screenWidth: UIScreen.main.bounds.width)
    }
}
