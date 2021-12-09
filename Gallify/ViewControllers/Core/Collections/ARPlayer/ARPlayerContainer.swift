//
//  ARPlayerContainer.swift
//  Gallify
//
//  Created by Tejvir Mann on 12/3/21.
//

import Foundation
import SwiftUI
import RealityKit

/*
 ARPlayerContainer.swift
 
 FullARView() is called from CollectionReelHeader.swift.
 The FullARView() calls the ARViewContainer view and other views to help with buttons.
 */


struct FullARView: View {
    @EnvironmentObject var placementSettings: PlacementSettings
    @State private var isControlsVisible: Bool = true
    @State private var showBrowse: Bool = false 
    
    
    
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    var body: some View {
        ZStack(alignment: .bottom){
        
            ARViewContainer()
            
            if self.placementSettings.selectedModel == nil{
                ARPlayerContentView(isControlsVisible: $isControlsVisible, showBrowse: $showBrowse)
            }else{
                PlacementView()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    @EnvironmentObject var placementSettings: PlacementSettings
    
    func makeUIView(context: Context) -> CustomARView {
        let arView = CustomARView(frame: .zero)
        
        // Subscribe to SceneEvents.Update
        self.placementSettings.sceneObserver = arView.scene.subscribe(to: SceneEvents.Update.self, { (event) in
            self.updateScene(for: arView)
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
        print("Added modelEntity to scene")
    }
    
}

//struct ContentView_Previews: PreviewProvider{
//    static var previews: some View {
//        ARPlayerContentView(isControlsVisible: $isControlsVisible, showBrowse: $showBrowse).environmentObject(PlacementSettings())
//
//    }
//}
