//
//  CreateViewHeader.swift
//  Gallify
//
//  Created by Gianluca Profio on 10/31/21.
//

import SwiftUI

struct CreatePublishHeader: View {
    
    let screenWidth: CGFloat

    var body: some View {
        HStack {
            NavigationLink(
                destination: TabBarView(),
                label: {
                    
                    Image(systemName: "chevron.left")
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
        }
    }
}

struct CreatePublishHeader_Previews: PreviewProvider {
    static var previews: some View {
        CreatePublishHeader(screenWidth: UIScreen.main.bounds.width)
    }
}

