//
//  MembershipSetting.swift
//  Gallify
//
//  Created by Gianluca Profio on 1/23/22.
//

import SwiftUI

struct MembershipSetting: View {
    
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    
    var body: some View {

        MembershipSettingHeader(screenWidth: screenWidth, screenHeight: screenHeight)
        
    }
}

struct MembershipSetting_Previews: PreviewProvider {
    static var previews: some View {
        MembershipSetting(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}
