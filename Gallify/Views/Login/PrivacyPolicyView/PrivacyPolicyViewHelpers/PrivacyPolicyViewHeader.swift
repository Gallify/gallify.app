//
//  PrivacyPolicyViewHeader.swift
//  Gallify
//
//  Created by Anshul on 10/8/21.
//
import SwiftUI
import Firebase

struct PrivacyPolicyViewHeader: View {
    
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var user: User
    
    var body: some View {
            
        VStack {
                
            HStack {
                    
                CustomBackButton(buttonHeight: screenHeight / 32.5, buttonWidth: screenWidth / 15, image: Image(systemName: "chevron.left.circle"), presentationMode: _presentationMode)
                    .padding(.horizontal, screenWidth / 25)
                    .padding(.vertical, screenHeight / 100)
                    
                Spacer()
                    
            }
                
            HStack {
                            
                Text("Check Your Inbox")
                    .font(.system(size: screenWidth / 12.5, weight: .semibold))
                            
                Spacer()
                            
            }
            .padding(.leading, screenWidth / 12)
            .padding(.bottom, screenHeight / 400)
        
            
        }
        .padding(.top, screenHeight / 160)
            
    }
    
}

struct PrivacyPolicyViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyViewHeader(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width)
    }
}
