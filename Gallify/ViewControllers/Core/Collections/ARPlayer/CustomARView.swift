//
//  CustomARView.swift
//  Gallify
//
//  Created by Sourish Kundu on 2/12/22.
//

import RealityKit
import ARKit
import FocusEntity

import SceneKit

class CustomARView: ARView {
    
    var focusEntity: FocusEntity?
    
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
        
        focusEntity = FocusEntity(on: self, focus: .classic)
        
        configure()
    }
    
    @MainActor @objc required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        
//        guard let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "ImageDetection", bundle: nil) else {
//            fatalError("Missing expected asset catalog resources.")
//        }
//        config.detectionImages = referenceImages
//
//        guard let referenceObjects = ARReferenceObject.referenceObjects(inGroupNamed: "ObjectDetection", bundle: nil) else {
//            fatalError("Missing expected asset catalog resources.")
//        }
//        config.detectionObjects = referenceObjects
        
        config.environmentTexturing = .automatic
        config.frameSemantics.insert(.personSegmentationWithDepth)
        
        session.run(config, options: [.resetTracking, .removeExistingAnchors])
    }
}
