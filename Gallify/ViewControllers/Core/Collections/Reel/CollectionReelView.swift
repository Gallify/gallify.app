//
//  ExpandedView.swift
//  Gallify
//
//  Created by Gianluca Profio on 10/23/21.
//

import SwiftUI

struct CollectionReelView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    var body: some View {
        VStack {
            
            CollectionReelHeader(screenWidth: screenWidth, screenHeight: screenHeight)
            
            ZStack {
                ScrollView {
                    CollectionReelListing(screenWidth: screenWidth, screenHeight: screenHeight)
                }
            }
        }
    }
}

struct CollectionReelView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionReelView(screenWidth: UIScreen.main.bounds.width,screenHeight: UIScreen.main.bounds.height)
    }
}
