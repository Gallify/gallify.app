//
//  ExpandedView.swift
//  Gallify
//
//  Created by Gianluca Profio on 10/23/21.
//

import SwiftUI

struct CollectionReelView: View {
    let screenWidth: CGFloat
    var body: some View {
        NavigationView {
            VStack{
                CollectionReelHeader(screenWidth: screenWidth)
                    .padding()
                ScrollView {
                    CollectionReelListing(screenWidth: screenWidth)
                }
                Spacer()
            }
        }
        .navigationBarHidden(true)
        .navigationBarTitle("")
    }
}

struct CollectionReelView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionReelView(screenWidth: UIScreen.main.bounds.width)
    }
}
