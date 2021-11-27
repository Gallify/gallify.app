//
//  LikedView.swift
//  Gallify
//
//  Created by Gianluca Profio on 10/23/21.
//

import SwiftUI
import UIKit

struct CollectionLikedView: View {
    let screenWidth: CGFloat
    let screenHeight: CGFloat

    var body: some View {
        VStack{
            CollectionLikedHeader(screenHeight: screenHeight, screenWidth: screenWidth)
                .padding()
            ScrollView (showsIndicators: false) {
                CollectionLikedRow(screenWidth: screenWidth, screenHeight: screenHeight
)
            }
            MiniPlayerViewController(screenWidth: screenWidth, screenHeight: screenHeight)
            Spacer()
        }
    }
}

struct CollectionLikedView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionLikedView(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}


