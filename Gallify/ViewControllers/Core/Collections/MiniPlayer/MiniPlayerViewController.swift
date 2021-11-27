//
//  MiniPlayerViewController.swift
//  Gallify
//
//  Created by Gianluca Profio on 11/27/21.
//

import SwiftUI

struct MiniPlayerViewController: View {
    
    let screenWidth: CGFloat
    let screenHeight: CGFloat

    // MiniPlayerMain Properties
    @State var expand = false
    
    @Namespace var animation
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            MiniPlayerMain(animation: animation, expand: $expand, screenWidth: screenWidth)
        }
        )
    }
}

struct MiniPlayerViewController_Previews: PreviewProvider {
    static var previews: some View {
        MiniPlayerViewController(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}
