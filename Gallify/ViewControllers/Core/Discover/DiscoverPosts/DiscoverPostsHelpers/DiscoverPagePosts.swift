//
//  DiscoverPagePosts.swift
//  Gallify
//
//  Created by Patron on 11/17/21.
//
import SwiftUI

struct DiscoverPagePosts: View {
    
    @EnvironmentObject var viewModel: TabBarViewModel
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
    }
    
}

struct DiscoverPagePosts_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverPagePosts()
            .environmentObject(TabBarViewModel())
    }
}
