//
//  Slabs.swift
//  Gallify
//
//  Created by Anshul on 11/29/21.
//

import SwiftUI

struct Slabs: View {
    
    @EnvironmentObject var viewModel: TabBarViewModel
    
    let slabType: String
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        NavigationLink(destination: DiscoveryCategoryView(screenWidth: screenWidth, screenHeight: screenHeight),
                       label: {
            
            ZStack {
                
                Image(systemName: "square.fill")
                    .resizable()
                    .frame(width: screenWidth / 2.3, height: screenHeight / 10.8)
                    .foregroundColor(Color.gray)
                .opacity(0.7)
                
                Text(slabType)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                
                
            }
            
        })
        
    }
    
}

struct Slabs_Previews: PreviewProvider {
    static var previews: some View {
        Slabs(slabType: "Abstract")
            .environmentObject(TabBarViewModel())
    }
}
