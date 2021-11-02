//
//  ExpandedHeader.swift
//  Gallify
//
//  Created by Gianluca Profio on 9/26/21.
//

import SwiftUI
import RealityKit

struct CollectionReelHeader: View {
    let screenWidth: CGFloat
    var body: some View {
        HStack {
            
            NavigationLink (
                destination: CollectionRecentActivityView(screenWidth: screenWidth),
                label: {
                Image (systemName: "chevron.left")
                    .resizable()
                    .foregroundColor(Color.black)
                    .frame(width: screenWidth / 15, height: screenWidth / 15)
                    .padding(.leading, screenWidth / 25)
                })
                .buttonStyle(ThemeAnimationStyle())
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle("")
                .navigationBarHidden(true)
            
            Spacer()
            
            NavigationLink (
                destination: CollectionLikedView(screenWidth: screenWidth),
                label: {
                Image (systemName: "arkit")
                    .resizable()
                    .foregroundColor(Color.black)
                    .frame(width: screenWidth / 10, height: screenWidth / 10)
                    .padding(.trailing, screenWidth / 30)
                    .animation(.easeInOut)
                })
                .buttonStyle(ThemeAnimationStyle())
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
    }
}

struct CollectionReelHeader_Previews: PreviewProvider {
    static var previews: some View {
        CollectionReelHeader(screenWidth: UIScreen.main.bounds.width)
    }
}


