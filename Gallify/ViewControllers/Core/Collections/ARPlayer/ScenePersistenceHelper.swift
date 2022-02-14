//
//  ScenePersistenceHelper.swift
//  Gallify
//
//  Created by Dhruv Gupta on 12/27/21.
//

import Foundation
import RealityKit
import ARKit
import AlgoliaSearchClient

struct SaveData {
    var models: [ModelAnchor]
}

private let anchorNamePrefix = "model-"

class ScenePersistenceHelper {
    
    class func saveScene(for arView: CustomARView, at persistenceURL: URL) {
        print("Save Scene to local file system")
        
        for anchor in arView.scene.anchors {
            print(anchor.name)
            print(anchor.transform)
        }

        
        //1. Get current worldmap from arView.session
        arView.session.getCurrentWorldMap { worldMap, error in
            //2. Safely unwrap worldMap
            guard let map = worldMap else {
                print("Persistence Error: Unable to get worldMap: \(error!.localizedDescription)")
                // TODO: Create better way to alert user
                return
            }
            
            //3. Archive data and write to filesystem
            do {
                let sceneData = try NSKeyedArchiver.archivedData(withRootObject: map, requiringSecureCoding: true)
                try sceneData.write(to: persistenceURL, options: [.atomic])
            } catch {
                print("Persistence Error: Unable to save scene to local filesystem: \(error)")
            }
        }
    }
    
    class func saveSceneAsArray(for arView: CustomARView, at persistenceURL: URL, with models: [Model]) {
        print("Save Scene to local file system - AS ARRAY")
        var saveModels: [ModelAnchor] = []
        
        //1. Get current worldmap from arView.session
        arView.session.getCurrentWorldMap { worldMap, error in
            //2. Safely unwrap worldMap
            guard let map = worldMap else {
                print("Persistence Error: Unable to get worldMap: \(error!.localizedDescription)")
                // TODO: Create better way to alert user
                return
            }
            
            for anchor in map.anchors {
                if let anchorName = anchor.name, anchorName.hasPrefix(anchorNamePrefix) {
                    let modelName = anchorName.dropFirst(anchorNamePrefix.count)
                    
                    guard let model = models.first(where: { $0.name == modelName }) else {
                        print("Persistence: Unable to retrieve model from modelsViewModel.")
                        return
                    }
                    
                    let modelAnchor = ModelAnchor(model: model, anchor: anchor)
                    saveModels.append(modelAnchor)
                    
                    print("Saving modelAnchor with name: \(model.name)")
                }
            }
            
            //3. Archive data and write to filesystem
            do {
                let saveData = SaveData(models: saveModels)
                let sceneData = try NSKeyedArchiver.archivedData(withRootObject: saveData, requiringSecureCoding: true)
                try sceneData.write(to: persistenceURL, options: [.atomic])
            } catch {
                print("Persistence Error: Unable to save scene to local filesystem: \(error.localizedDescription)")
            }
        }
    }
    
    class func loadScene(for arView: CustomARView, with scenePersistenceData: Data) {
        print("Load Scene from local file system")
        
        //1. Unarchive the data from the filesystem
        let worldMap: ARWorldMap = {
            do {
                guard let worldMap = try NSKeyedUnarchiver.unarchivedObject(ofClass: ARWorldMap.self, from: scenePersistenceData) else {
                    fatalError("Persistence Error: No ARWorldMap in archive.")
                }
                
                return worldMap
            } catch {
                fatalError("Persistence Error: Unable to Unarchive ARWorldMap from Scene Persistence: \(error.localizedDescription)")
            }
        }()
        
        //2. Reset configurations and load worldMap as initialWorldMap
        let newConfig = arView.defaultConfiguration
        newConfig.initialWorldMap = worldMap
        arView.session.run(newConfig, options: [.resetTracking, .removeExistingAnchors])
    }
}
