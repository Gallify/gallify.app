//
//  ExpandedHeader.swift
//  Gallify
//
//  Created by Gianluca Profio on 9/26/21.
//

import SwiftUI

struct ExpandedHeader: View {
    let screenWidth: CGFloat
    var body: some View {
        HStack {
            
            NavigationLink (
                destination: LikedView(screenWidth: screenWidth),
                label: {
                Image (systemName: "chevron.down")
                    .resizable()
                    .foregroundColor(Color.black)
                    .frame(width: screenWidth / 10, height: screenWidth / 15)
                    .padding(.leading, screenWidth / 25)
                })
                .buttonStyle(ThemeAnimationStyle())
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle("")
                .navigationBarHidden(true)
            
            Spacer()
            
            NavigationLink (
                destination: TabBarView(),
                label: {
                Image (systemName: "perspective")
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

struct ExpandedHeader_Previews: PreviewProvider {
    static var previews: some View {
        ExpandedHeader(screenWidth: UIScreen.main.bounds.width)
    }
}

