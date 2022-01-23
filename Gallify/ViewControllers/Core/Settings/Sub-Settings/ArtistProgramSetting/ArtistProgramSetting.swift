//
//  ArtistProgramSetting.swift
//  Gallify
//
//  Created by Gianluca Profio on 1/23/22.
//

import SwiftUI

struct ArtistProgramSetting: View {
    
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    
    var body: some View {

        ArtistProgramSettingHeader(screenWidth: screenWidth, screenHeight: screenHeight)

    }
}

struct ArtistProgramSetting_Previews: PreviewProvider {
    static var previews: some View {
        ArtistProgramSetting(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}
