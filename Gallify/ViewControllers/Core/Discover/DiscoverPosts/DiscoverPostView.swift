//
//  DiscoverPostsView.swift
//  Gallify
//
//  Created by Patron on 11/14/21.
//
import SwiftUI

struct DiscoverPostsView: View {
    
    @EnvironmentObject var viewModel: TabBarViewModel
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        VStack {
            
            DiscoverPostsViewTags(screenHeight: screenHeight, screenWidth: screenWidth)
            
            DiscoverPagePosts()
            
        }
        
    }
    
}

struct DiscoverPostsView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverPostsView()
            .environmentObject(TabBarViewModel())
    }
}
