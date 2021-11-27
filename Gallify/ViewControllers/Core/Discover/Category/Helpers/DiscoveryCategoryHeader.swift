//
//  SignInViewHeader.swift
//  Gallify
//
//  Created by Patron on 10/1/21.
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
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.top)
                        
                Spacer()
                        
            }
            .padding(.leading, screenWidth / 12)
            .padding(.bottom, screenWidth / 15)
            
        }
            
    }
    
}

struct DiscoveryCategoryHeader_Previews: PreviewProvider {
    static var previews: some View {
        DiscoveryCategoryHeader(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}
