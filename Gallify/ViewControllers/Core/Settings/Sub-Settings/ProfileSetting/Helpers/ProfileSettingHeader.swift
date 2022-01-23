//
//  MainSettingsViewHeader.swift
//  Gallify
//
//  Created by Gianluca Profio on 1/23/22.
//

import SwiftUI

struct ProfileSettingHeader: View {
    
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            
            HStack {
                
                CustomBackButton(buttonHeight: screenHeight / 19.5, buttonWidth: screenWidth / 9, image: Image(systemName: "chevron.left.circle"), presentationMode: _presentationMode)
                    .padding(.horizontal, screenWidth / 25)
                    .padding(.vertical, screenHeight / 100)
                
                Spacer()
                
            }
            
            HStack {
                        
                Text("Profile")
                    .font(.system(size: screenWidth / 11, weight: .semibold))
                        
                Spacer()
                        
            }
            .padding(.leading, screenWidth / 12)
            .padding(.bottom, screenHeight / 32.5)
            
        }
        .padding(.top, screenHeight / 160)
    }
}

struct ProfileSettingHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettingHeader(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}
