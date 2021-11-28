//
//  PrivacyPolicyViewHeader.swift
//  Gallify
//
//  Created by Anshul on 10/8/21.
//
import SwiftUI

struct PrivacyPolicyViewHeader: View {
    
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
                        
                Text("User Agreement")
                    .font(.system(size: screenWidth / 11, weight: .semibold))
                        
                Spacer()
                        
            }
            .padding(.leading, screenWidth / 12)
            .padding(.bottom, screenHeight / 32.5)

            
            HStack {
                
                Text("Last updated: May 23rd 2021")
                    .font(.system(size: screenWidth / 29))
                    .foregroundColor(.gray)
                
                Spacer()
                
            }
            .padding(.leading, screenWidth / 12)
            
        }
        .padding(.top, screenHeight / 160)
            
    }
    
}

struct PrivacyPolicyViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyViewHeader(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width)
    }
}
