//
//  DiscoverPagePosts.swift
//  Gallify
//
//  Created by Anshul on 11/17/21.
//

import SwiftUI

struct DiscoverPagePosts: View {
    
    @EnvironmentObject var viewModel: TabBarViewModel
    
    var body: some View {
        
        let screenWidth = viewModel.screenWidth
        
        VStack {
            
            HStack {
                    
                VStack {
                    
                    HStack {
                        
                        Post_Small(image: Image("hiddenlake"))
                        
                        Post_Small(image: Image("chincoteague"))
                        
                    }
                    
                    Post_Large(image: Image("charleyrivers"))
                    
                }
                
                
                VStack {
                    
                    Reel(image: Image("twinlake"))
                    
                    Post_Small(image: Image("lakemcdonald"))
                    
                }
                
            }
            
            HStack {
                
                Post_Small(image: Image("icybay"))
                
                Post_Small(image: Image("turtlerock"))
                
                Post_Small(image: Image("umbagog"))
                
            }
            
            HStack {
                
                VStack {
                    
                    Post_Small(image: Image("silversalmoncreek"))
                    
                    Post_Small(image: Image("rainbowlake"))
                    
                }
                
                Post_Large(image: Image("stmarylake"))
                
            }
            
        }
        .padding(.leading, screenWidth / 75)
        
        
    }
    
}

struct DiscoverPagePosts_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverPagePosts()
            .environmentObject(TabBarViewModel())
    }
}
