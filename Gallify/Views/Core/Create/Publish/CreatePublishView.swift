//
//  CreateView.swift
//  Gallify
//
//  Created by Gianluca Profio on 10/31/21.
//

import SwiftUI

struct CreatePublishView: View {
    
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    
    var body: some View {
        VStack {
        CreatePublishHeader(screenWidth: screenWidth)
        CreatePublishListing(screenWidth: screenWidth, screenHeight: screenHeight)
        }
    }
}

struct CreatePublishView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePublishView(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}
