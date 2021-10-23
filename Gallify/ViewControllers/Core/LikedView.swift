//
//  LikedView.swift
//  Gallify
//
//  Created by Gianluca Profio on 10/23/21.
//

import SwiftUI
import UIKit

struct LikedView: View {
    let screenWidth: CGFloat
    var body: some View {
        VStack{
            LikedHeader(screenWidth: screenWidth)
            ScrollView (showsIndicators: false) {
                LikedRow(screenWidth: screenWidth)
            }
            Spacer()
            HStack {
                Spacer()
                Image(systemName: "house.fill")
                Spacer()
                Image(systemName: "magnifyingglass")
                Spacer()
                Image(systemName: "person.fill")
                Spacer()
            }
        }
    }
}

struct LikedView_Previews: PreviewProvider {
    static var previews: some View {
        LikedView(screenWidth: UIScreen.main.bounds.width)
    }
}

