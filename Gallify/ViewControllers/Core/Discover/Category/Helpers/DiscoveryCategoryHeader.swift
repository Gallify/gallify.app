//
//  SignInViewHeader.swift
//  Gallify
//
//  Created by Anshul on 10/1/21.
//

import SwiftUI

struct DiscoveryCategoryHeader: View {
    
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    
    var body: some View {
            
        VStack {
            
            HStack {
                
                CustomBackButton(buttonHeight: screenHeight / 39, buttonWidth: screenWidth / 18, image: Image(systemName: "lessthan"), presentationMode: _presentationMode)
                    .padding(.horizontal, screenWidth / 25)
                    .padding(.vertical, screenHeight / 100)
                
                Spacer()
                
            }
            
            HStack {
                        
                Text("Sample Category")
                    .font(.system(size: screenWidth / 11, weight: .semibold))
                        
                Spacer()
                        
            }
            .padding(.leading, screenWidth / 12)
            .padding(.bottom, screenHeight / 32.5)
            
        }
        .padding(.top, screenHeight / 160)
            
    }
    
}

struct DiscoveryCategoryHeader_Previews: PreviewProvider {
    static var previews: some View {
        DiscoveryCategoryHeader(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}
