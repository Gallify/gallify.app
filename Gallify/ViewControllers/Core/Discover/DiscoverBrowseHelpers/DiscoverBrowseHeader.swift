//
//  DiscoverBrowseHeader.swift
//  Gallify
//
//  Created by Anshul on 11/29/21.
//

import SwiftUI

struct DiscoverBrowseHeader: View {
    
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
            
        VStack {
            
            HStack {
                
                CustomBackButton(buttonHeight: screenHeight / 32.5, buttonWidth: screenWidth / 15, image: Image(systemName: "chevron.left.circle"), presentationMode: _presentationMode)
                    .padding(.horizontal, screenWidth / 25)
                    .padding(.vertical, screenHeight / 100)
                
                Spacer()
                
            }
            
//            HStack {
//                        
//                Text("Recommended")
//                    .font(.system(size: screenWidth / 11, weight: .semibold))
//
//                Spacer()
//
//            }
//            .padding(.leading, screenWidth / 12)
//            .padding(.bottom, screenHeight / 32.5)
            
        }
        .padding(.top, screenHeight / 160)
            
    }
    
}

struct DiscoverBrowseHeader_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverBrowseHeader(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width)
    }
}
