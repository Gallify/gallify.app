//
//  ARViewContainer.swift
//  Gallify
//
//  Created by Apple on 23/12/21.
//

import Foundation
import SwiftUI
import RealityKit


struct ARViewContainer: UIViewRepresentable {
    @EnvironmentObject var placementSettings: PlacementSettings
    @EnvironmentObject var sessionSettings: SessionSettings
    @EnvironmentObject var scenemanager: SceneManager

    func makeUIView(context: Context) -> CustomARView {
        let arView = CustomARView(frame: .zero, sessionSettings: sessionSettings)

        // Subscribe to SceneEvents.Update
        self.placementSettings.sceneObserver = arView.scene.subscribe(to: SceneEvents.Update.self, { (event) in
            self.updateScene(for: arView)
            self.updatePersistenceAvailbilty(for: arView)
        })

        return arView
    }

    func updateUIView(_ uiView: CustomARView, context: Context) {}

    private func updateScene(for arView: CustomARView) {
        arView.focusEntity?.isEnabled = self.placementSettings.selectedModel != nil

        //Add model to scene if confirmed for placement
        if let confirmedModel = self.placementSettings.confirmedModel, let modelEntity = confirmedModel.modelEntity {
            self.place(modelEntity, in: arView)
            self.placementSettings.confirmedModel = nil
            
        }
    }

    private func place(_ modelEntity: ModelEntity, in arView: ARView) {
        //1. Clone modelEntity. Created identical copy of modelEntity and references same model, allows for multiple models of the same asset in our scene.
        let clonedEntity = modelEntity.clone(recursive: true)

        //2. Enable translation and rotation gestures
        clonedEntity.generateCollisionShapes(recursive: true)
        arView.installGestures([.translation,.rotation], for: clonedEntity)

        //3. Create anchor entity and add cloneEntity to it
        let anchorEntity = AnchorEntity(plane: .any)
        anchorEntity.addChild(clonedEntity)

        //4. Add anchorEntity to arView.scene
        arView.scene.addAnchor(anchorEntity)
        
        self.scenemanager.anchorEntities.append(anchorEntity)
        print("Added modelEntity to scene")
    }

}

// MARK: - Persistence

class SceneManager : ObservableObject {
    @Published var isPersistenceAvailible: Bool = false
    @Published var anchorEntities: [AnchorEntity] = [] // Keeps trsck of anchor ENtites in the scene.
    
    
}


extension ARViewContainer {
    private func updatePersistenceAvailbilty(for arView: ARView ){
        guard let currentFrame = arView.session.currentFrame else {
            print("ARFrame not availible.")
            return
        }
        
        switch currentFrame.worldMappingStatus {
        case .mapped, .extending :
            self.scenemanager.isPersistenceAvailible = !self.scenemanager.anchorEntities.isEmpty
        default:
            self.scenemanager.isPersistenceAvailible = false
            
        }
        
    }
}

