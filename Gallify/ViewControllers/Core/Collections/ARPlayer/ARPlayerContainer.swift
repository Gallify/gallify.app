//
//  ARPlayerContainer.swift
//  Gallify
//
//  Created by Tejvir Mann on 12/3/21.
//

import Foundation
import SwiftUI
import RealityKit

/*
 ARPlayerContainer.swift
 
 FullARView() is called from CollectionReelHeader.swift.
 The FullARView() calls the ARViewContainer view and other views to help with buttons.
 */


struct FullARView: View {
    @EnvironmentObject var placementSettings: PlacementSettings
    @State private var isControlsVisible: Bool = true
    @State private var showBrowse: Bool = false 
    
    
    
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    var body: some View {
        ZStack(alignment: .bottom){
        
            ARViewContainer()
            
            if self.placementSettings.selectedModel == nil{
                ARPlayerContentView(isControlsVisible: $isControlsVisible, showBrowse: $showBrowse)
            }else{
                PlacementView()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

//struct ContentView_Previews: PreviewProvider{
//    static var previews: some View {
//        ARPlayerContentView(isControlsVisible: $isControlsVisible, showBrowse: $showBrowse).environmentObject(PlacementSettings())
//
//    }
//}
