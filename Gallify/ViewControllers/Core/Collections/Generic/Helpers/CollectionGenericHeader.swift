//
//  CollectionGenericViewHeader.swift
//  Gallify
//
//  Created by Gianluca Profio on 11/7/21.
//

import SwiftUI

struct CollectionGenericHeader: View {
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>;      var body: some View {
        HStack {
            HStack {
                CustomBackButton(buttonHeight: screenHeight / 39, buttonWidth: screenWidth / 18, image: Image(systemName: "lessthan"), presentationMode: _presentationMode)
                    .padding(.horizontal, screenWidth / 25)
                    .padding(.vertical, screenHeight / 100)
                
                Spacer()
                                        
                    Text("[Collection_Name]")
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

struct CollectionGenericHeader_Previews: PreviewProvider {
    static var previews: some View {
        CollectionGenericHeader(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width)
    }
}
