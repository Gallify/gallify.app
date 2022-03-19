//
//  DiscoverViewTag.swift
//  Gallify
//
//  Created by Anshul on 11/14/21.
//
import SwiftUI

struct DiscoverViewTag: View {
    
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    let tag: String
    let bgColor: Color
    
    var body: some View {
        
        Text(tag)
            .fontWeight(.bold)
            .foregroundColor(.white) //.white
            .padding(.horizontal, screenWidth / 20)
            .padding(.vertical, screenHeight / 100)
            .background(bgColor) //bgColor
            .cornerRadius(screenWidth / 50)
            
        
        
/*        NavigationLink(destination: DiscoveryCategoryView(screenWidth: screenWidth, screenHeight: screenHeight),
                       label: {
            
            Text(tag)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.horizontal, screenWidth / 20)
                .padding(.vertical, screenHeight / 100)
                .background(bgColor)
                .cornerRadius(screenWidth / 30)
            
        })
        .navigationBarHidden(true)
 */
        
        
    }
    
}

struct DiscoverViewTag_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverViewTag(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width, tag: "Browse", bgColor: Color.gray.opacity(0.7))
    }
}

