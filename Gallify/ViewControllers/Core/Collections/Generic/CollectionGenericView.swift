//
//  SwiftUIView.swift
//  Gallify
//
//  Created by Gianluca Profio on 10/23/21.
//

import SwiftUI

struct CollectionGenericView: View {
    let screenWidth: CGFloat
    var body: some View {
        NavigationView {
            VStack{
                CollectionGenericHeader(screenWidth: screenWidth)
                    .padding()
                ScrollView (showsIndicators: false) {
                    CollectionGenericRow(screenWidth: screenWidth)
                }
                Spacer()
                CollectionGenericFooter(screenWidth: screenWidth)
                
            }
        }
        .navigationBarHidden(true)
        .navigationBarTitle("")
    }
}

struct CollectionGenericView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionGenericView(screenWidth: UIScreen.main.bounds.width)
    }
}

