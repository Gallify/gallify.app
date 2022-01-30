//
//  CuratorProgramSetting.swift
//  Gallify
//
//  Created by Gianluca Profio on 1/23/22.
//

import SwiftUI

struct CuratorProgramSetting: View {
    
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    
    var body: some View {

        CuratorProgramSettingHeader(screenWidth: screenWidth, screenHeight: screenHeight)

    }
}

struct CuratorProgramSetting_Previews: PreviewProvider {
    static var previews: some View {
        CuratorProgramSetting(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}
