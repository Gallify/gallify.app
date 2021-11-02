//
//  RecentActivityFooter.swift
//  Gallify
//
//  Created by Gianluca Profio on 10/31/21.
//

import SwiftUI

struct CollectionRecentActivityFooter: View {
    let screenWidth: CGFloat
    var body: some View {
        HStack {
            NavigationLink(
                destination: CollectionReelView(screenWidth: screenWidth),
                label: {
                    Image("leonardo")
                        .resizable()
                        .frame(width: screenWidth / 6, height: screenWidth / 6)
                        .cornerRadius(15)
                })
                .buttonStyle(ThemeAnimationStyle())
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .padding()
            
            Text("Edition 2")
                .font(.system(size: 19))
                .fontWeight(.bold)
                .padding(.trailing)
                .multilineTextAlignment(.center)
            
            Text("Leonardo Da Vinci")
                .fontWeight(.semibold)
                .font(.system(size: 19))
                .multilineTextAlignment(.center)
            
            NavigationLink(
                destination: CollectionReelView(screenWidth: screenWidth),
                label: {
                    Image(systemName: "chevron.right")
                        .resizable()
                        .foregroundColor(Color.black)
                        .frame(width: screenWidth / 15, height: screenWidth / 15)
                })
                .buttonStyle(ThemeAnimationStyle())
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .padding()
        }
        .background(Color(red: 0.827, green: 0.827, blue: 0.827))
        .cornerRadius(25)
        .padding()
    }
}

struct CollectionRecentActivityFooter_Previews: PreviewProvider {
    static var previews: some View {
        CollectionRecentActivityFooter(screenWidth: UIScreen.main.bounds.width)
    }
}
