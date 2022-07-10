//
//  ARPlayerView.swift
//  Reale
//
//  Created by Sahil Srivastava on 5/26/22.
//

import SwiftUI
import Combine

struct ARPlayerView: View {
    
    @StateObject var arVM = ARViewModel()
    @State var pos: String = ""
    @State var showAR: Bool = true
    
    var body: some View {
        ZStack {
            
                ARCamView(pos: $pos)
                    .blur(radius: arVM.pauseAR ? 5 : 0)
                OverlayView(positionText: $pos, pauseAR: $arVM.pauseAR, showAR: $showAR)

        }
        .environmentObject(arVM)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ARPlayerView_Preview: PreviewProvider {
    static var previews: some View {
        ARPlayerView()
    }
}
