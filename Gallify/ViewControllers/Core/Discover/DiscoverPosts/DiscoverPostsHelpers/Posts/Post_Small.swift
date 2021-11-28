//
//  Post_Small.swift
//  Gallify
//
//  Created by Anshul on 11/20/21.
//

import SwiftUI

struct Post_Small: View {
    
    @EnvironmentObject var viewModel: TabBarViewModel
    let image: Image
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        image
            .resizable()
            .frame(width: screenWidth / 3.1, height: screenHeight / 6.8)
            .padding(.leading, -screenWidth / 75)
            .padding(.top, -screenHeight / 160)
        
    }
    
}

struct Post_Small_Previews: PreviewProvider {
    static var previews: some View {
        Post_Small(image: Image("lakemcdonald"))
            .environmentObject(TabBarViewModel())
    }
}
