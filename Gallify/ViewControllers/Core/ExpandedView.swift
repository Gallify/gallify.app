//
//  ExpandedView.swift
//  Gallify
//
//  Created by Gianluca Profio on 10/23/21.
//

import SwiftUI

struct ExpandedView: View {
    let screenWidth: CGFloat
    var body: some View {
        NavigationView {
            VStack{
                ExpandedHeader(screenWidth: screenWidth)
                ScrollView {ExpandedListing(screenWidth: screenWidth)}
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

struct ExpandedView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandedView(screenWidth: UIScreen.main.bounds.width)
    }
}
