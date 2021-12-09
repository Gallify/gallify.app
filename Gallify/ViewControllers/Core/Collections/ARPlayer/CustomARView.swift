//
//  CustomARView.swift
//  Gallify
//
//  Created by Dhruv Gupta on 12/9/21.
//

import RealityKit
import ARKit
import FocusEntity

class CustomARView: ARView {
    
    var focusEntity: FocusEntity?
    
    required init(frame frameReact: CGRect) {
        super.init(frame: frameReact)
        
        focusEntity = FocusEntity(on: self, focus: .classic)
        
        configure()
        
    }
    
    @objc required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal,.vertical]
        session.run(config)
    }
    
}


