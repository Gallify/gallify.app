//
//  ExpandedView.swift
//  Gallify
//
//  Created by Gianluca Profio on 10/23/21.
//

import SwiftUI

struct CollectionReelView: View {
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    var body: some View {
        NavigationView {
            VStack{
                /*CollectionReelHeader(screenWidth: screenWidth, screenHeight: screenHeight)
                    .padding()*/
                ScrollView {
                    CollectionReelListing(screenWidth: screenWidth, screenHeight: screenHeight)
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
        CollectionReelView(screenWidth: UIScreen.main.bounds.width,screenHeight: UIScreen.main.bounds.height)
    }
}
