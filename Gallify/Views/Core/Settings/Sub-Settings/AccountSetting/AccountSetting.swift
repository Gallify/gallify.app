//
//  AccountSetting.swift
//  Gallify
//
//  Created by Gianluca Profio on 1/15/22.
//

import SwiftUI

struct AccountSetting: View {
    
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    
    var body: some View {
        VStack {

            AccountSettingHeader(screenWidth: screenWidth, screenHeight: screenHeight)
            
            ScrollView (showsIndicators: false) {
                
                AccountSettingBody(screenWidth: screenWidth, screenHeight: screenHeight)
                
            }
            
        }
        
    }
    
}

/*struct AccountSetting_Previews: PreviewProvider {
    static var previews: some View {
        AccountSetting(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}*/
