//
//  ARViewContainer.swift
//  Gallify
//
//  Created by Apple on 23/12/21.
//

import Foundation
import SwiftUI
import RealityKit
import ARKit

private let anchorNamePrefix = "model-"

struct ARViewContainer: UIViewRepresentable {
    @EnvironmentObject var placementSettings: PlacementSettings
    @EnvironmentObject var sessionSettings: SessionSettings
    @EnvironmentObject var scenemanager: SceneManager
    @EnvironmentObject var modelsViewModel: ModelsViewModel
    @EnvironmentObject var modelDeletionManager: ModelDeletionManager

    func makeUIView(context: Context) -> CustomARView {
        let arView = CustomARView(frame: .zero, sessionSettings: sessionSettings, modelDeletionManager: modelDeletionManager)
        
        arView.session.delegate = context.coordinator

        // Subscribe to SceneEvents.Update
        self.placementSettings.sceneObserver = arView.scene.subscribe(to: SceneEvents.Update.self, { (event) in
            self.updateScene(for: arView)
            self.updatePersistenceAvailbilty(for: arView)
            self.handlePersistence(for: arView)
        })

        return arView
    }

    func updateUIView(_ uiView: CustomARView, context: Context) {}

    private func updateScene(for arView: CustomARView) {
        arView.focusEntity?.isEnabled = self.placementSettings.selectedModel != nil

        //Add model(s) to scene if confirmed for placement
        if let modelAnchor = self.placementSettings.modelsConfirmedForPlacement.popLast(), let modelEntity = modelAnchor.model.modelEntity {
            
            if let anchor = modelAnchor.anchor {
                // Anchor is being loaded from persisted scene
                self.place(modelEntity, for: anchor, in: arView)
                arView.session.add(anchor: anchor)
                
                //self.placementSettings.recentlyPlaced.append(modelAnchor.model)
            } else if let transform = getTransformForPlacement(in: arView) {
                // Anchor needs to be created for model placement
                let anchorName = anchorNamePrefix + modelAnchor.model.name
                let anchor = ARAnchor(name: anchorName, transform: transform)
                
                self.place(modelEntity, for: anchor, in: arView)
                arView.session.add(anchor: anchor)
                self.placementSettings.recentlyPlaced.append(modelAnchor.model) 
            }
        }
    }

    private func place(_ modelEntity: ModelEntity, for anchor: ARAnchor, in arView: ARView) {
        //1. Clone modelEntity. Created identical copy of modelEntity and references same model, allows for multiple models of the same asset in our scene.
        let clonedEntity = modelEntity.clone(recursive: true)
        print()

        //2. Enable translation and rotation gestures
        clonedEntity.generateCollisionShapes(recursive: true)
        arView.installGestures([.translation,.rotation], for: clonedEntity)

        //3. Create anchor entity and add cloneEntity to it
        let anchorEntity = AnchorEntity(plane: .any)
        anchorEntity.addChild(clonedEntity)
        
        anchorEntity.anchoring = AnchoringComponent(anchor)

        //4. Add anchorEntity to arView.scene
        arView.scene.addAnchor(anchorEntity)
        
        self.scenemanager.anchorEntities.append(anchorEntity)
        print("Added modelEntity to scene")
    }
    
    private func getTransformForPlacement(in arView: ARView) -> simd_float4x4? {
        guard let query = arView.makeRaycastQuery(from: arView.center, allowing: .estimatedPlane, alignment: .any) else {
            return nil
        }
        guard let raycastResult = arView.session.raycast(query).first else { return nil }
        
        return raycastResult.worldTransform
    }

}

// MARK: - Persistence

class SceneManager : ObservableObject {
    @Published var isPersistenceAvailible: Bool = false
    @Published var anchorEntities: [AnchorEntity] = [] // Keeps trsck of anchor ENtites in the scene.
    
    var shouldSaveSceneToFileSystem: Bool = false // Flag to trigger save scene to filesystem function
    var shouldLoadSceneFromFileSystem: Bool = false // Flag to trigger load scene from filesystem function
    
    
    lazy var persistenceURL: URL = {
        do {
            return try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("arf.persistence")
        } catch {
            fatalError("Unable to get persistenceURL: \(error.localizedDescription)")
        }
    }()
    
    var scenePersistenceData: Data? {
        return try? Data(contentsOf: persistenceURL)
    }
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

    private func handlePersistence(for arView: CustomARView) {
        if self.scenemanager.shouldSaveSceneToFileSystem {
            print(self.scenemanager.anchorEntities[0].children[0].transform)
            print(self.scenemanager.anchorEntities[0].transform)
            print(self.scenemanager.anchorEntities[0].children[0])
            
            ScenePersistenceHelper.saveSceneAsArray(for: arView, at: self.scenemanager.persistenceURL, with: self.modelsViewModel.models)
            self.scenemanager.shouldSaveSceneToFileSystem = false
        } else if self.scenemanager.shouldLoadSceneFromFileSystem {
            guard let scenePersistenceData = self.scenemanager.scenePersistenceData else {
                print("Unable to retrieve scenePersistenceData. Canceled loadScene operation.")
                self.scenemanager.shouldLoadSceneFromFileSystem = false
                return
            }
            self.modelsViewModel.clearModelEntitiesFromMemory()
            self.scenemanager.anchorEntities.removeAll(keepingCapacity: true)
            ScenePersistenceHelper.loadScene(for: arView, with: scenePersistenceData)
            self.scenemanager.shouldLoadSceneFromFileSystem = false
            
        }
    }
}

// MARK: - ARSessionDelegate + Coordinator

extension ARViewContainer {
    class Coordinator: NSObject, ARSessionDelegate {
        var parent: ARViewContainer
        
        init(_ parent: ARViewContainer) {
            self.parent = parent
        }
        
        func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
            for anchor in anchors {
                if anchor is ARImageAnchor {
                    print("IMAGE DETECTED")
                    
                    let model = self.parent.modelsViewModel.models[1]
                    
                    model.asyncLoadModelEntity { completed, error in
                        if completed {
                            let modelAnchor = ModelAnchor(model: model, anchor: ARAnchor(transform: anchor.transform))
                            self.parent.placementSettings.modelsConfirmedForPlacement.append(modelAnchor)
                            print("Adding modelAnchor with name: \(model.name)")
                            print("Adding modelAnchor with name: \(model.scaleCompensation)")
                        }
                    }
                }
                
                if let anchorName = anchor.name, anchorName.hasPrefix(anchorNamePrefix) {
                    let modelName = anchorName.dropFirst(anchorNamePrefix.count)
                    print("ARSession: didAdd anchor for modelName: \(modelName)")
                    
                    guard let model = self.parent.modelsViewModel.models.first(where: { $0.name == modelName }) else {
                        print("Unable to retrieve model from modelsViewModel.")
                        return
                    }
                    if model.modelEntity == nil {
                        model.asyncLoadModelEntity { completed, error in
                            if completed {
                                let modelAnchor = ModelAnchor(model: model, anchor: anchor)
                                self.parent.placementSettings.modelsConfirmedForPlacement.append(modelAnchor)
                                print("Adding modelAnchor with name: \(model.name)")
                            }
                        }
                    }
                }
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}

extension ARViewContainer {
    func printAnchors() {
        print(self.scenemanager.anchorEntities)
    }
}
