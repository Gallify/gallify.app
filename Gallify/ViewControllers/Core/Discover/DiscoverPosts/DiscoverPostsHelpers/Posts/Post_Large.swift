//
//  Post_Large.swift
//  Gallify
//
//  Created by Patron on 11/20/21.
//

import SwiftUI

struct Post_Large: View {
    
    @EnvironmentObject var viewModel: TabBarViewModel
    let image: Image
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        image
            .resizable()
            .frame(width: screenWidth / 1.53, height: screenHeight / 3.38)
            .padding(.leading, -screenWidth / 75)
            .padding(.top, -screenHeight / 160)
        
    }
    
}

struct Post_Large_Previews: PreviewProvider {
    static var previews: some View {
        Post_Large(image: Image("lakemcdonald"))
            .environmentObject(TabBarViewModel())
    }
}
