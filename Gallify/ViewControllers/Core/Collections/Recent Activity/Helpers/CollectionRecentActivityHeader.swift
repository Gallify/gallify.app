//
//  RecentlyViewedHeader.swift
//  Gallify
//
//  Created by Gianluca Profio on 9/26/21.
//

import SwiftUI

struct CollectionRecentActivityHeader: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let screenWidth: CGFloat
    let screenHeight: CGFloat;
    var body: some View {
        HStack {
            HStack {
                CustomBackButton(buttonHeight: screenHeight / 39, buttonWidth: screenWidth / 18, image: Image(systemName: "lessthan"), presentationMode: _presentationMode)
                    .padding(.horizontal, screenWidth / 25)
                    .padding(.vertical, screenHeight / 100)
                
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

struct CollectionRecentActivityHeader_Previews: PreviewProvider {
    static var previews: some View {
        CollectionRecentActivityHeader(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}

