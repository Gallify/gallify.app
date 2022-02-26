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
        self.enablePanGesture()
        
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
    
    func enablePanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        panGesture.delegate = self
        self.addGestureRecognizer(panGesture)
    }
    
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self)
        let location = gesture.location(in: self)
        
        if let entity = self.entity(at: location) as? ModelEntity {
            let currentPosition = self.project(entity.position)
            let updatedPosition = CGPoint(x: currentPosition!.x + translation.x, y: currentPosition!.y + translation.y)
            translate(entity, basedOn: updatedPosition)
        }
    }
    
    func translate(_ object: ModelEntity, basedOn screenPos: CGPoint) {
        // Update the object's position
        //ARAnchor(transform: getTransformForTranslate(from: screenPos)!)
        print("Moved object!")
        if let change = getTransformForTranslate(from: screenPos) {
            object.move(to: change, relativeTo: nil)
        }
    }
    
    private func getTransformForTranslate(from cgpoint: CGPoint) -> simd_float4x4? {
        guard let query = self.makeRaycastQuery(from: cgpoint, allowing: .estimatedPlane, alignment: .any) else {
            return nil
        }
        guard let raycastResult = self.session.raycast(query).first else { return nil }

        return raycastResult.worldTransform
    }
}
