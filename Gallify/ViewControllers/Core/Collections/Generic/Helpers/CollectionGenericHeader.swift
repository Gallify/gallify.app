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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        HStack {
                
            CustomBackButton(buttonHeight: screenHeight / 32.5, buttonWidth: screenWidth / 15, image: Image(systemName: "chevron.left.circle"), presentationMode: _presentationMode)
                .padding(.horizontal, screenWidth / 25)
                .padding(.vertical, screenHeight / 100)
                
            Spacer()
                                        
                Text("Collection_Name")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .padding(.trailing, screenWidth / 7.5)
                
            Spacer()
                
        }
        
    }
    
}

struct CollectionGenericHeader_Previews: PreviewProvider {
    static var previews: some View {
        CollectionGenericHeader(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width)
    }
}
