//
//  ForgotPasswordViewHeader.swift
//  Gallify
//
//  Created by Anshul on 10/16/21.
//
import SwiftUI

struct ForgotPasswordViewHeader: View {
    
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
                        
                Text("Forgot My Password")
                    .font(.system(size: screenWidth / 12.5, weight: .semibold))
                        
                Spacer()
                        
            }
            .padding(.leading, screenWidth / 12)
            .padding(.bottom, screenHeight / 32.5)
            
        }
            
    }
    
}

struct ForgotPasswordViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordViewHeader(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width)
    }
}
