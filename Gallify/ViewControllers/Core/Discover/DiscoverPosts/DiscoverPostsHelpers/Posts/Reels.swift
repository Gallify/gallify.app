//
//  Reel.swift
//  Gallify
//
//  Created by Anshul on 11/20/21.
//

import SwiftUI

struct Reel: View {
    
    @EnvironmentObject var viewModel: TabBarViewModel
    let image: Image
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        image
            .resizable()
            .frame(width: screenWidth / 3.1, height: screenHeight / 3.38)
            .padding(.leading, -screenWidth / 75)
            .padding(.top, -screenHeight / 160)
        
    }
    
}

struct Reel_Previews: PreviewProvider {
    static var previews: some View {
        Reel(image: Image("chincoteague"))
            .environmentObject(TabBarViewModel())
    }
}
