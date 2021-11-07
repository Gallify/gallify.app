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
    var body: some View {
        VStack{
            CollectionLikedHeader(screenWidth: screenWidth)
                .padding()
            ScrollView (showsIndicators: false) {
                CollectionLikedRow(screenWidth: screenWidth)
            }
            CollectionLikedFooter(screenWidth: screenWidth)
            Spacer()
        }
    }
}

struct CollectionLikedView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionLikedView(screenWidth: UIScreen.main.bounds.width)
    }
}


