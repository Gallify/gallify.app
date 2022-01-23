//
//  ProfileSetting.swift
//  Gallify
//
//  Created by Gianluca Profio on 1/15/22.
//

import SwiftUI
import FirebaseStorage

struct ProfileSetting: View {
    
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    
    var body: some View {
        VStack {

            ProfileSettingHeader(screenWidth: screenWidth, screenHeight: screenHeight)
            
            ScrollView (showsIndicators: false) {
                
                ProfileSettingBody(screenWidth: screenWidth, screenHeight: screenHeight)
                
            }
            
        }
        
    }
    
}

/*struct ProfileSetting_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSetting(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}*/
