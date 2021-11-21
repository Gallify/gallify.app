//
//  DiscoveryCategoryView.swift
//  Gallify
//
//  Created by Gianluca Profio on 11/7/21.
//

import SwiftUI

struct DiscoveryCategoryView: View {
    
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    
    var body: some View {
        
        NavigationView {
            VStack{
                DiscoveryCategoryHeader(screenWidth: screenWidth, screenHeight: screenHeight)
                    .padding(.leading)
                ScrollView (showsIndicators: false) {
                    DiscoveryCategoryContent(screenWidth: screenWidth)
                }
            }
        }
        .navigationBarHidden(true)
        .navigationBarTitle("")
        
    }
}

struct DiscoveryCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoveryCategoryView(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}
