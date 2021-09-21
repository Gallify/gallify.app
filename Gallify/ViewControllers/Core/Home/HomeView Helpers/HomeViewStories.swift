//
//  HomeViewStories.swift
//  Gallify
//
//  Created by Patron on 9/5/21.
//

import SwiftUI

struct HomeViewStories: View {
    
    let screenWidth: CGFloat
    
    var body: some View {
        
        let pad = screenWidth / 75
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack {
                
                VStack {
                    
                    CircleImage(image: Image("turtlerock"), length: screenWidth / 5, breadth: screenWidth / 5, overlayColor: .purple, overlayRadius: screenWidth / 125, shadowRadius: screenWidth / 125)
                        .padding(pad)
                    
                    Text("LoggedUser")
                        .foregroundColor(Color.gray)
                        .offset(y: -pad)
                        .frame(width: screenWidth / 5 + 2 * pad)
                        .lineLimit(1)
                        .allowsTightening(true)
                }
                .padding(.leading, pad + screenWidth / 125)
                
                VStack {
                    
                    CircleImage(image: Image("twinlake"), length: screenWidth / 5, breadth: screenWidth / 5, overlayColor: .white, overlayRadius: screenWidth / 125, shadowRadius: screenWidth / 125)
                        .padding(pad)
                    
                    Text("Artist1")
                        .foregroundColor(Color.gray)
                        .offset(y: -pad)
                        .frame(width: screenWidth / 5 + 2 * pad)
                        .lineLimit(1)
                        .allowsTightening(true)
                    
                }
                
                VStack {
                    
                    CircleImage(image: Image("icybay"), length: screenWidth / 5, breadth: screenWidth / 5, overlayColor: .white, overlayRadius: screenWidth / 125, shadowRadius: screenWidth / 125)
                        .padding(pad)
                    
                    Text("Artist2")
                        .foregroundColor(Color.gray)
                        .offset(y: -pad)
                        .frame(width: screenWidth / 5 + 2 * pad)
                        .lineLimit(1)
                        .allowsTightening(true)
                    
                }
                
                VStack {
                    
                    CircleImage(image: Image("chincoteague"), length: screenWidth / 5, breadth: screenWidth / 5, overlayColor: .white, overlayRadius: screenWidth / 125, shadowRadius: screenWidth / 125)
                        .padding(pad)
                    
                    Text("Artist3")
                        .foregroundColor(Color.gray)
                        .offset(y: -pad)
                        .frame(width: screenWidth / 5 + 2 * pad)
                        .lineLimit(1)
                        .allowsTightening(true)
                    
                }
                
                VStack {
                    
                    CircleImage(image: Image("umbagog"), length: screenWidth / 5, breadth: screenWidth / 5, overlayColor: .white, overlayRadius: screenWidth / 125, shadowRadius: screenWidth / 125)
                        .padding(pad)
                    
                    Text("Artist4")
                        .foregroundColor(Color.gray)
                        .offset(y: -pad)
                        .frame(width: screenWidth / 5 + 2 * pad)
                        .lineLimit(1)
                        .allowsTightening(true)
                    
                }
                .padding(.trailing, pad * 2)
            }
            
        }
        
    }
    
}

struct HomeViewStories_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewStories(screenWidth: UIScreen.main.bounds.width)
    }
}
