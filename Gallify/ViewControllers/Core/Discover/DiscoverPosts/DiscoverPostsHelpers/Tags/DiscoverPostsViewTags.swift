//
//  DiscoverPostsViewTags.swift
//  Gallify
//
//  Created by Patron on 11/14/21.
//
import SwiftUI

struct DiscoverPostsViewTags: View {
    
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack {
                
                DiscoverViewTag(screenHeight: screenHeight, screenWidth: screenWidth, tag: "Browse", bgColor: Color.gray.opacity(0.7))
                
                DiscoverViewTag(screenHeight: screenHeight, screenWidth: screenWidth, tag: "Abstract", bgColor: Color.gray.opacity(0.7))
                
                DiscoverViewTag(screenHeight: screenHeight, screenWidth: screenWidth, tag: "International", bgColor: Color.gray.opacity(0.7))
                
                DiscoverViewTag(screenHeight: screenHeight, screenWidth: screenWidth, tag: "Marvel", bgColor: Color.gray.opacity(0.7))
                
                DiscoverViewTag(screenHeight: screenHeight, screenWidth: screenWidth, tag: "Food", bgColor: Color.gray.opacity(0.7))
                
            }
            .padding(.horizontal, screenWidth / 25)
            .padding(.vertical, screenHeight / 160)
            
        }
        
    }
    
}

struct DiscoverPostsViewTags_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverPostsViewTags(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width)
    }
}
