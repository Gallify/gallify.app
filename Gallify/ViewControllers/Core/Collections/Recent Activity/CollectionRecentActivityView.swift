//
//  SwiftUIView.swift
//  Gallify
//
//  Created by Gianluca Profio on 10/23/21.
//

import SwiftUI

struct CollectionRecentActivityView: View {
    let screenWidth: CGFloat
    var body: some View {
        NavigationView {
            VStack{
                CollectionRecentActivityHeader(screenWidth: screenWidth)
                ScrollView (showsIndicators: false) {
                    CollectionRecentActivityRow(screenWidth: screenWidth)
                }
                Spacer()
                CollectionRecentActivityFooter(screenWidth: screenWidth)
                
            }
        }
        .navigationBarHidden(true)
        .navigationBarTitle("")
    }
}

struct CollectionRecentActivityView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionRecentActivityView(screenWidth: UIScreen.main.bounds.width)
    }
}

