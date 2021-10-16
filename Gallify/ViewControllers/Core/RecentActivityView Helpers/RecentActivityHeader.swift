//
//  RecentlyViewedHeader.swift
//  Gallify
//
//  Created by Gianluca Profio on 9/26/21.
//

import SwiftUI

struct RecentlyViewedHeader: View {
    let screenWidth: CGFloat
    var body: some View {
        HStack {
            HStack {
                NavigationLink(
                    destination: TabBarView(),
                    label: {
                        
                        Image(systemName: "lessthan")
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
                                        
                    Text("Recent Activity")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                
                Spacer()
                
                Text("")
                .foregroundColor(Color.black)
                .frame(width: screenWidth / 15, height: screenWidth / 15)
                .padding(.leading, screenWidth / 25)
                
            }
        }
    }
}

struct RecentlyViewedHeader_Previews: PreviewProvider {
    static var previews: some View {
        RecentlyViewedHeader(screenWidth: UIScreen.main.bounds.width)
    }
}
