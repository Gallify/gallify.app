//
//  BrowseSlabsView.swift
//  Gallify
//
//  Created by Anshul on 11/29/21.
//

import SwiftUI

struct BrowseSlabsView: View {
    
    @EnvironmentObject var viewModel: TabBarViewModel
    
    var body: some View {
        
        VStack {
            
            let screenHeight = viewModel.screenHeight
            let screenWidth = viewModel.screenWidth
            
            HStack {
                
                Slabs(slabType: "Trending")
                    .padding(.horizontal, screenWidth / 125)
                    .padding(.vertical, screenHeight / 160)
                
                Slabs(slabType: "Hottest")
                    .padding(.horizontal, screenWidth / 125)
                    .padding(.vertical, screenHeight / 160)
                
            }
            
            HStack {
                
                Slabs(slabType: "Most Viewed")
                    .padding(.horizontal, screenWidth / 125)
                    .padding(.vertical, screenHeight / 160)
                
                Slabs(slabType: "Top Local")
                    .padding(.horizontal, screenWidth / 125)
                    .padding(.vertical, screenHeight / 160)
                
            }
            
            HStack {
                
                Slabs(slabType: "Popular")
                    .padding(.horizontal, screenWidth / 125)
                    .padding(.vertical, screenHeight / 160)
                
                Slabs(slabType: "Museums")
                    .padding(.horizontal, screenWidth / 125)
                    .padding(.vertical, screenHeight / 160)
                
            }
            
            HStack {
                
                Slabs(slabType: "Top Collectors")
                    .padding(.horizontal, screenWidth / 125)
                    .padding(.vertical, screenHeight / 160)
                
                Slabs(slabType: "India")
                    .padding(.horizontal, screenWidth / 125)
                    .padding(.vertical, screenHeight / 160)
                
            }
            
        }
        
    }
    
}

struct BrowseSlabsView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseSlabsView()
            .environmentObject(TabBarViewModel())
    }
}
