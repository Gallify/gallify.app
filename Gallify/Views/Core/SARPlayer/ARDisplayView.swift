//
//  ARDisplayView.swift
//  Gallify
//
//  Created by Sahil Srivastava on 6/17/22.
//

import Foundation
import SwiftUI
import SwiftUI
import RealityKit
import ARKit
import FocusEntity
/*
struct ARDisplayView: UIViewRepresentable {
    
    @EnvironmentObject var arVM: ARViewModel
    
    func makeUIView(context: Context) -> SCustomARView {
        let arView = SCustomARView(frame: .zero)
        // Configure
        configure(our: arView)
        // Set up coordinator
        context.coordinator.view = arView
        // Enable gestures for ARView
        arView.addGestureRecognizer(UILongPressGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleLongPress(_:))))
        return arView
    }
    
    func updateUIView(_ uiView: SCustomARView, context: Context) {
        // Place model if user has confirmed placement
        if let confirmedModel = arVM.placedModel, let entity = confirmedModel.modelEntity {
            place(entity, in: uiView)
            arVM.clearSelected()
            arVM.clearPlace()
        }
        
        toggleFocus(in: uiView)
    }
    
    private func toggleFocus(in arView: SCustomARView) {
        // Enable focus only if we are placing a model
        if arVM.selectedModel != nil { arView.focusEntity?.isEnabled = true }
        else { arView.focusEntity?.isEnabled = false }
    }
    
    private func place(_ entity: ModelEntity, in arView: SCustomARView) {
        let clonedEntity = entity.clone(recursive: true)
        clonedEntity.generateCollisionShapes(recursive: true)
        arView.installGestures([.translation, .rotation], for: clonedEntity)
        
        let anchorEntity = AnchorEntity(plane: .any)
        anchorEntity.addChild(clonedEntity)
        
        arView.scene.addAnchor(anchorEntity)
        
        for anim in clonedEntity.availableAnimations {
            if #available(iOS 15.0, *) {
                clonedEntity.playAnimation(anim.repeat())
            } else {
                // Fallback on earlier versions
                print("NOT UP TO DATE")
            }
        }
        print(entity.availableAnimations.count, clonedEntity.availableAnimations.count)
        
        print("Entity Placed")
    }
    
    @discardableResult
    private func configure(our arView: SCustomARView) -> ARConfiguration {
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        
        // Enable lidar
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
            config.sceneReconstruction = .mesh
        }
        arView.session.run(config)
        return config
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject {
        
        weak var view: SCustomARView?
        
        @objc func handleLongPress(_ recognzier: UIGestureRecognizer) {
            guard let view = view else { return }
            
            let tapLocation = recognzier.location(in: view)
            
            if let entity = view.entity(at: tapLocation), let anchor = entity.anchor {
                view.scene.removeAnchor(anchor)
            }
        }
    }
}

class SCustomARView: ARView {
    
    var focusEntity: FocusEntity?
    
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
        
        focusEntity = FocusEntity(on: self, focus: .classic)
    }
    
    @MainActor required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
*/
