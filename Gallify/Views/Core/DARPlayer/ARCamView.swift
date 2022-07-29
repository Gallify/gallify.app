//
//  ARView.swift
//  Reale
//
//  Created by Sahil Srivastava on 5/27/22.
//

import Foundation
import SwiftUI
import RealityKit
import ARKit
import FocusEntity

struct ARCamView: UIViewRepresentable {
    
    @EnvironmentObject var arVM: ARViewModel
    
    @Binding var pos: String
    
    func makeUIView(context: Context) -> CustomARView {
        let arView = CustomARView(frame: .zero)
        // Configure
        configure(our: arView)
        // Set up coordinator
        context.coordinator.view = arView
        // Enable gestures for ARView
        arView.addGestureRecognizer(UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap(_:))))
        arView.addGestureRecognizer(UILongPressGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleLongPress(_:))))
        return arView
    }
    
    func updateUIView(_ uiView: CustomARView, context: Context) {
        // Place model if user has confirmed placement
        if let confirmedModel = arVM.placedModel, let entity = confirmedModel.entity {
            place(entity, in: uiView)
            arVM.clearSelected()
            arVM.clearPlace()
        }
        
        toggleFocus(in: uiView)
        toggleSceneUnderstanding(in: uiView)
        
        if arVM.pauseAR {
            uiView.session.pause()
        } else {
            configure(our: uiView)
            
        }
    }
    
    private func toggleFocus(in arView: CustomARView) {
        // Enable focus only if we are placing a model
        if arVM.selectedModel != nil { arView.focusEntity?.isEnabled = true }
        else { arView.focusEntity?.isEnabled = false }
    }
    
    private func toggleSceneUnderstanding(in arView: CustomARView) {
        // Toggle sceneUnderstanding
        if arVM.sceneUnderstanding {
            arView.debugOptions.insert(.showSceneUnderstanding)
        } else {
            arView.debugOptions.remove(.showSceneUnderstanding)
        }
    }
    
    private func place(_ entity: Entity, in arView: CustomARView) {
        
        //create cloned entity
        let clonedEntity = entity.clone(recursive: true)
        clonedEntity.generateCollisionShapes(recursive: true) //not sure if needed
        
        //create parent ModelEntity. add cloned entity to it.
        let parentEntity = ModelEntity()
        parentEntity.addChild(clonedEntity)
        
        //create anchor entity, add parent entity to it.
        let anchorEntity = AnchorEntity(plane: .any)
        //anchorEntity.addChild(clonedEntity)
        anchorEntity.addChild(parentEntity)
        arView.scene.addAnchor(anchorEntity)
        
        
        for anim in clonedEntity.availableAnimations {
            if #available(iOS 15.0, *) {
                clonedEntity.playAnimation(anim.repeat())
            } else {
                // Fallback on earlier versions
                print("NOT UP TO DATE")
            }
        }
        
        // Add a collision component to the parentEntity with a rough shape and appropriate offset for the model that it contains
        let entityBounds = entity.visualBounds(relativeTo: parentEntity)
        parentEntity.collision = CollisionComponent(shapes: [ShapeResource.generateBox(size: entityBounds.extents).offsetBy(translation: entityBounds.center)])
                   
        // installing gestures for the parentEntity
        arView.installGestures([.all], for: parentEntity)
        
        
        
        
        print(entity.availableAnimations.count, clonedEntity.availableAnimations.count)
        
        print("Entity Placed")
    }
    
    @discardableResult
    private func configure(our arView: CustomARView) -> ARConfiguration {
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        
//        guard let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else {
//            fatalError("Missing expected asset catalog resources.")
//        }
        
      //  config.detectionImages = referenceImages
        
        
        // Enable lidar
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
            config.sceneReconstruction = .mesh
        }
        arView.session.run(config)
        return config
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(pos: $pos)
    }
    
    class Coordinator: NSObject {
        
        weak var view: CustomARView?
        var pos: Binding<String>
        
        init(pos: Binding<String>) {
            self.pos = pos
        }
        
        @objc func handleTap(_ recognzier: UIGestureRecognizer) {
            guard let view = view else { return }
            
            let tapLocation = recognzier.location(in: view)
            
            if let entity = view.entity(at: tapLocation) {
            let res = entity.position(relativeTo: AnchorEntity(.camera)) //will become AnchorEntity Reference Image.

                
                
                pos.wrappedValue = "\(res.x) \(res.y) \(res.z)"
            }
        }
        
        @objc func handleLongPress(_ recognzier: UIGestureRecognizer) {
            guard let view = view else { return }
            
            let tapLocation = recognzier.location(in: view)
            
            if let entity = view.entity(at: tapLocation), let anchor = entity.anchor {
                view.scene.removeAnchor(anchor)
            }
        }
    }
}

class CustomARView: ARView {
    
    var focusEntity: FocusEntity?
    
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
        
        focusEntity = FocusEntity(on: self, focus: .classic)
    }
    
    @MainActor required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
