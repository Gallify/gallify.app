//
//  VerifyEmailHeader.swift
//  Gallify
//
//  Created by Anshul on 10/26/21.
//
import SwiftUI

struct VerifyEmailHeader: View {
    
    let screenHeight: CGFloat
    let screenWidth: CGFloat
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
                        
                Text("Verify Email")
                    .font(.system(size: screenWidth / 12.5, weight: .semibold))
                        
                Spacer()
                        
            }
            .padding(.leading, screenWidth / 12)
            .padding(.bottom, screenHeight / 32.5)
            
        }
            
    }
    
}

struct VerifyEmailHeader_Previews: PreviewProvider {
    static var previews: some View {
        VerifyEmailHeader(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width)
    }
}
