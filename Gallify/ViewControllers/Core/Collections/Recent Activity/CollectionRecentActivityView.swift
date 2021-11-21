//
//  SwiftUIView.swift
//  Gallify
//
//  Created by Gianluca Profio on 10/23/21.
//

import SwiftUI

struct CollectionRecentActivityView: View {
    let screenWidth: CGFloat
    let screenHeight: CGFloat

    var body: some View {
        NavigationView {
            VStack{
                CollectionRecentActivityHeader(screenWidth: screenWidth)
                    .padding()
                ScrollView (showsIndicators: false) {
                    CollectionRecentActivityRow(screenWidth: screenWidth, screenHeight: screenHeight)
                }
                Spacer()
                CollectionRecentActivityFooter(screenWidth: screenWidth, screenHeight: screenHeight)
                
            }
        }
        .navigationBarHidden(true)
        .navigationBarTitle("")
    }
}

struct CollectionRecentActivityView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionRecentActivityView(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}

