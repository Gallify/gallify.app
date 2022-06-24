//
//  RecentlyViewedHeader.swift
//  Gallify
//
//  Created by Gianluca Profio on 9/26/21.
//

import SwiftUI

struct CollectionRecentActivityHeader: View {
    
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        HStack {
                
            CustomBackButton(buttonHeight: screenHeight / 32.5, buttonWidth: screenWidth / 15, image: Image(systemName: "chevron.left.circle"), presentationMode: _presentationMode)
                .padding(.horizontal, screenWidth / 25)
                .padding(.vertical, screenHeight / 100)
                
            Spacer()
                
            Text("Recent Activity")
                .font(.system(size: screenWidth / 18, weight: .semibold))
                .padding(.trailing, screenWidth / 7.5)
                
            Spacer()
                
        }
        
    }
    
}

struct CollectionRecentActivityHeader_Previews: PreviewProvider {
    static var previews: some View {
        CollectionRecentActivityHeader(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}

