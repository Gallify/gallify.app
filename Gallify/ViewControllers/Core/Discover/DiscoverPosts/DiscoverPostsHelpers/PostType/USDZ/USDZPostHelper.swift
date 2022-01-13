//
//  USDZPostHelper.swift
//  Gallify
//
//  Created by Anshul on 1/4/22.
//

import SwiftUI
import SceneKit

struct USDZPostHelper: UIViewRepresentable {
    
    let modelName: String
    let isMovable: Bool
    
    typealias UIViewType = SCNView
    
    func makeUIView(context: Context) -> SCNView {
        
        let scene = SCNScene(named: modelName)
        let scnView = SCNView()
        
        scnView.allowsCameraControl = isMovable
        
        scnView.autoenablesDefaultLighting = true
        
        scnView.backgroundColor = UIColor.white
        
        scnView.scene = scene
        
        return scnView
        
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
            
        }
    
}

struct USDZPostHelper_Previews: PreviewProvider {
    static var previews: some View {
        USDZPostHelper(modelName: "toy_car.usdz", isMovable: true)
    }
}
