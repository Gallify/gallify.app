//
//  SwiftUIView.swift
//  Gallify
//
//  Created by Gianluca Profio on 10/23/21.
//

import SwiftUI

struct RecentActivityView: View {
    let screenWidth: CGFloat
    var body: some View {
        NavigationView {
            VStack{
                RecentlyViewedHeader(screenWidth: screenWidth)
                ScrollView (showsIndicators: false) {
                    RecentActivityRow(screenWidth: screenWidth)
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
        .navigationBarHidden(true)
        .navigationBarTitle("")
    }
}

struct RecentActivityView_Previews: PreviewProvider {
    static var previews: some View {
        RecentActivityView(screenWidth: UIScreen.main.bounds.width)
    }
}
