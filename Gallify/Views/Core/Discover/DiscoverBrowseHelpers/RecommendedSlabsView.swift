//
//  RecommendedSlabsView.swift
//  Gallify
//
//  Created by Anshul on 11/29/21.
//

import SwiftUI

struct RecommendedSlabsView: View {
    
    @EnvironmentObject var viewModel: TabBarViewModel
    
    var body: some View {
        
        VStack {
            
            let screenHeight = viewModel.screenHeight
            let screenWidth = viewModel.screenWidth
            
            HStack {
                
                Slabs(slabType: "Abstract")
                    .padding(.horizontal, screenWidth / 125)
                    .padding(.vertical, screenHeight / 160)
                
                Slabs(slabType: "Contemporary")
                    .padding(.horizontal, screenWidth / 125)
                    .padding(.vertical, screenHeight / 160)
                
            }
            
            HStack {
                
                Slabs(slabType: "Top Art")
                    .padding(.horizontal, screenWidth / 125)
                    .padding(.vertical, screenHeight / 160)
                
                Slabs(slabType: "Classics")
                    .padding(.horizontal, screenWidth / 125)
                    .padding(.vertical, screenHeight / 160)
                
            }
            
        }
        
    }
    
}

struct RecommendedSlabsView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedSlabsView()
            .environmentObject(TabBarViewModel())
    }
}
