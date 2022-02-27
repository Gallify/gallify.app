//
//  CustomARView.swift
//  Gallify
//
//  Created by Sourish Kundu on 2/12/22.
//

import RealityKit
import UIKit
import ARKit
import FocusEntity

import SceneKit

class CustomARView: ARView {
    
    var focusEntity: FocusEntity?
    
    /**
     The object that has been most recently intereacted with.
     The `selectedObject` can be moved at any time with the tap gesture.
     */
    var selectedObject: ModelEntity?
    
    /// The object that is tracked for use by the pan gestures.
    var trackedObject: ModelEntity? {
        didSet {
            guard trackedObject != nil else { return }
            selectedObject = trackedObject
        }
    }
    
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
        let panGesture = ThresholdPanGesture(target: self, action: #selector(handlePan(_:)))
        panGesture.delegate = self
        self.addGestureRecognizer(panGesture)
    }
    
    @objc func handlePan(_ gesture: ThresholdPanGesture) {
        switch gesture.state {
        case .began:
            // Check for an object at the touch location.
            let location = gesture.location(in: self)
            
            if let model = self.entity(at: location) as? ModelEntity {
                trackedObject = model
            }
            
        case .changed where gesture.isThresholdExceeded:
            let translation = gesture.translation(in: self)
            guard let entity = trackedObject else { return }
            
            // Move an object if the displacment threshold has been met.
            let currentPosition = self.project(entity.position)
            let updatedPosition = CGPoint(x: currentPosition!.x + translation.x, y: currentPosition!.y + translation.y)
            translate(entity, basedOn: updatedPosition)

            gesture.setTranslation(.zero, in: self)
            
        case .changed:
            // Ignore the pan gesture until the displacment threshold is exceeded.
            break
            
        case .ended:
            // Update the object's position when the user stops panning.
            let translation = gesture.translation(in: self)
            guard let entity = trackedObject else { break }
            //setDown(object, basedOn: updatedTrackingPosition(for: object, from: gesture))
            
            let currentPosition = self.project(entity.position)
            let updatedPosition = CGPoint(x: currentPosition!.x + translation.x, y: currentPosition!.y + translation.y)
            //translate(entity, basedOn: updatedPosition)
            
            // Create new AnchorEntity and Model, Remove old one
            entity.generateCollisionShapes(recursive: true)
            
            let anchorEntity = AnchorEntity(plane: .any)
            
            anchorEntity.addChild(entity)
            
            if let change = getTransformForTranslate(from: updatedPosition) {
                anchorEntity.anchoring = AnchoringComponent(ARAnchor(transform: change))
            }
            
            scene.addAnchor(anchorEntity)
            
            fallthrough
        default:
            print("hi")
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
