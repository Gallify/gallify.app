//
//  HomeViewStories.swift
//  Gallify
//
//  Created by Anshul on 9/5/21.
//
import SwiftUI

struct HomeViewStories: View {
    
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    
    var body: some View {
        
        let heightPad = screenHeight / 160
        let widthPad = screenWidth / 75
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack {
                
                VStack {
                    
                    CircleImage(image: Image("turtlerock"), length: screenWidth / 5, breadth: screenHeight / 10.8, overlayColor: .purple, overlayRadius: screenWidth / 125, shadowRadius: screenWidth / 125)
                        .padding(.horizontal, widthPad)
                        .padding(.vertical, heightPad)
                    
                    Text("LoggedUser")
                        .font(.system(size: screenWidth / 22.5))
                        .foregroundColor(Color.gray)
                        .offset(y: -heightPad)
                        .frame(width: screenWidth / 5 + 2 * widthPad)
                        .lineLimit(1)
                    
                }
                .padding(.leading, widthPad + screenWidth / 125)
                
                VStack {
                    
                    CircleImage(image: Image("twinlake"), length: screenWidth / 5, breadth: screenHeight / 10.8, overlayColor: .white, overlayRadius: screenWidth / 125, shadowRadius: screenWidth / 125)
                        .padding(.horizontal, widthPad)
                        .padding(.vertical, heightPad)
                    
                    Text("Artist1")
                        .font(.system(size: screenWidth / 22.5))
                        .foregroundColor(Color.gray)
                        .offset(y: -heightPad)
                        .frame(width: screenWidth / 5 + 2 * widthPad)
                        .lineLimit(1)
                    
                }
                
                VStack {
                    
                    CircleImage(image: Image("icybay"), length: screenWidth / 5, breadth: screenHeight / 10.8, overlayColor: .white, overlayRadius: screenWidth / 125, shadowRadius: screenWidth / 125)
                        .padding(.horizontal, widthPad)
                        .padding(.vertical, heightPad)
                    
                    Text("Artist2")
                        .font(.system(size: screenWidth / 22.5))
                        .foregroundColor(Color.gray)
                        .offset(y: -heightPad)
                        .frame(width: screenWidth / 5 + 2 * widthPad)
                        .lineLimit(1)
                    
                }
                
                VStack {
                    
                    CircleImage(image: Image("chincoteague"), length: screenWidth / 5, breadth: screenHeight / 10.8, overlayColor: .white, overlayRadius: screenWidth / 125, shadowRadius: screenWidth / 125)
                        .padding(.horizontal, widthPad)
                        .padding(.vertical, heightPad)
                    
                    Text("Artist3")
                        .font(.system(size: screenWidth / 22.5))
                        .foregroundColor(Color.gray)
                        .offset(y: -heightPad)
                        .frame(width: screenWidth / 5 + 2 * widthPad)
                        .lineLimit(1)
                    
                }
                
                VStack {
                    
                    CircleImage(image: Image("umbagog"), length: screenWidth / 5, breadth: screenHeight / 10.8, overlayColor: .white, overlayRadius: screenWidth / 125, shadowRadius: screenWidth / 125)
                        .padding(.horizontal, widthPad)
                        .padding(.vertical, heightPad)
                    
                    Text("Artist4")
                        .font(.system(size: screenWidth / 22.5))
                        .foregroundColor(Color.gray)
                        .offset(y: -heightPad)
                        .frame(width: screenWidth / 5 + 2 * widthPad)
                        .lineLimit(1)
                    
                }
                .padding(.trailing, widthPad * 2)
                
            }
            
        }
        
    }
    
}

struct HomeViewStories_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewStories(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width)
    }
}
