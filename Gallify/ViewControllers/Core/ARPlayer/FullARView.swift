//
//  ARPlayerContainer.swift
//  Gallify
//
//  Created by Tejvir Mann on 12/3/21.
//
import Foundation
import SwiftUI
import RealityKit
import ARKit

/*
 ARPlayerContainer.swift
 FullARView() is called from CollectionReelHeader.swift.
 The FullARView() calls the ARViewContainer view and other views to help with buttons.
 
 UPDATE: //used to be focus entity 2.2.5. as of 05/8/22 it was updated to the Feb28th version. The latest version.
 */


struct FullARView: View {
    @EnvironmentObject var modelsViewModel: ModelsViewModel
    @EnvironmentObject var firestoreQuery : FirestoreQuery
    @EnvironmentObject var placementSettings: PlacementSettings
    @EnvironmentObject var modelDeletionManager: ModelDeletionManager
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    
    @State private var showSlider: Bool = false
    @State private var overlayVisible: Bool = false //used to be true, wasnt loading so skipped it
    @State private var showAbout: Bool = false
    @State private var hideAll: Bool = false
    
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        
        
        ZStack(alignment: .bottom) {

            ARViewContainer(overlayVisible: $overlayVisible)
                .edgesIgnoringSafeArea(.all)
                .navigationBarHidden(true)

            VStack{
                HStack{
                    Button(action: {
                       //if else checks if both camera and reels screen are minimized currently.
                        if(firestoreQuery.showCameraScreen==false && firestoreQuery.showNewScreen==false){
                            firestoreQuery.bothScreensMinimized = true
                        }
                        else{
                            firestoreQuery.bothScreensMinimized = false
                        }

                        firestoreQuery.showCameraScreen = false
                        firestoreQuery.showNewScreen = false
                        firestoreQuery.cameraPlaying = true
                        firestoreQuery.artPlaying = false
                        firestoreQuery.artisClicked = ""


                        }) {
                                Image(systemName: "chevron.down")
                                    .font(.system(size: 30))
                                    .foregroundColor(Color.white)
                                    .padding(.leading)
                                    //.frame(maxHeight: .infinity, alignment: .top)
                                    .padding(.vertical, screenHeight / 12) //screenHeight / 70
                                    .padding(.horizontal, screenHeight / 75)

                        }
                        .frame(maxHeight: .infinity, alignment: .top)
                    

                    Spacer()
                    
                    Button(action: {
                        showAbout =  true
                        }) {
                            Text("?")
                                .font(.system(size: screenWidth / 25, weight: .medium))
                                .foregroundColor(Color(.white))
//                                .padding(.horizontal, 20)
//                                .padding(.vertical, screenHeight / 120)
                            
                                //.padding(.leading)
                                .padding(.vertical, screenHeight / 12) //screenHeight / 70
                                .padding(.horizontal, screenHeight / 75)
//                                .overlay(
//                                    Capsule(style: .continuous)
//                                        .stroke(Color.white, style: StrokeStyle(lineWidth: 2))
//                                )
                        }
                        .frame(maxHeight: .infinity, alignment: .top)
                        .alert(isPresented: $showAbout) {
                            Alert(title: Text("Tips!"), message: Text("Move your device around so it can track your space. Double Tap Art to Delete. Also, saving coming soon!"), dismissButton: .default(Text("Cancel")))
                        } 
                    
                    Button(action: {
                        
                        }) {
                            Text("Save")
                                .font(.system(size: screenWidth / 25, weight: .medium))
                                .foregroundColor(Color(.white))
//                                .padding(.horizontal, 20)
//                                .padding(.vertical, screenHeight / 120)
                            
                                //.padding(.leading)
                                .padding(.vertical, screenHeight / 12) //screenHeight / 70
                                .padding(.horizontal, screenHeight / 75)
//                                .overlay(
//                                    Capsule(style: .continuous)
//                                        .stroke(Color.white, style: StrokeStyle(lineWidth: 2))
//                                )
                        }
                        .frame(maxHeight: .infinity, alignment: .top)
                    

                    Button(action: {
                        //if else checks if both camera and reels screen are minimized currently.
                        if(firestoreQuery.showCameraScreen==false && firestoreQuery.showNewScreen==false){
                            firestoreQuery.bothScreensMinimized = true
                        }
                        else{
                            firestoreQuery.bothScreensMinimized = false
                        }
                        firestoreQuery.showCameraScreen = false
                        firestoreQuery.showNewScreen = true
                        firestoreQuery.cameraPlaying = false
                        firestoreQuery.artPlaying = true

                        //pause or end session here
                        }) {
                                Image(systemName: "square")
                                    .resizable()
                                    .foregroundColor(Color.white)
                                    .frame(width: screenWidth / 15, height: screenHeight / 32.5)
                                    .padding(.trailing, 4.0)
                                    .padding(.vertical, screenHeight / 12.5)
                                    .padding(.horizontal, screenHeight / 90)
                        }
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding(.trailing, 20)
                        .onTapGesture {
                            firestoreQuery.showCameraScreen = false
                            firestoreQuery.showNewScreen = true
                            firestoreQuery.cameraPlaying = false
                        }
                        
                        
                        


                }
                
            
                
//                HStack{
//
//                    Spacer()
//
//                    Button(action: {
//
//                    }) {
//
//                        Text("Save")
//
//                            .font(.system(size: screenWidth / 25, weight: .medium))
//                            .foregroundColor(Color(.white))
//                            .padding(.horizontal, 20)
//                            .padding(.vertical, screenHeight / 120)
//                            .overlay(
//                                Capsule(style: .continuous)
//                                    .stroke(Color.white, style: StrokeStyle(lineWidth: 2))
//                            )
//                            .background(Color.white)
//                            .opacity(0.3)
//                    }
//                    .frame(maxHeight: .infinity, alignment: .top)
//
//                }
                
//                HStack{
//
//                    Spacer()
//
//                    Button(action: {
//                        showAbout =  true
//                    }) {
//
//                        Text("?")
//
//                            .font(.system(size: screenWidth / 25, weight: .medium))
//                            .foregroundColor(Color(.white))
//                            .padding(.horizontal, 20)
//                            .padding(.vertical, screenHeight / 120)
//                            .overlay(
//                                Capsule(style: .continuous)
//                                    .stroke(Color.white, style: StrokeStyle(lineWidth: 2))
//                            )
//
//                    }
//                    .frame(maxHeight: .infinity, alignment: .top)
//                    .alert(isPresented: $showAbout) {
//                        Alert(title: Text("Tip!"), message: Text("Move your device around so it can track your space. Double Tap Art to Delete. Also, saving coming soon!"), dismissButton: .default(Text("Cancel")))
//                    }
//
//                }
                


                HStack(alignment: .bottom){
                    if placementSettings.selectedModel == nil {
                        if placementSettings.selectedModel != nil {
                            AddModelBar()
                        }
                        else if modelDeletionManager.entitySelectedForDeletion != nil {

                            DeletionView()
                        }
                        else {
                            
                            Slider()
                            
                        }
                    }
                    else {
                        AddModelBar()
                    }
                }



            }

        }

        
        
    }
}


struct ARViewContainer: UIViewRepresentable {
    @EnvironmentObject var modelsViewModel: ModelsViewModel
    @EnvironmentObject var firestoreQuery: FirestoreQuery
    @EnvironmentObject var placementSettings: PlacementSettings
    @EnvironmentObject var modelDeletionManager: ModelDeletionManager
    @Binding var overlayVisible: Bool
    
    //let coachingOverlay = ARCoachingOverlayView()
    
    func makeUIView(context: Context) -> ARView {
        let arView = CustomARView(frame: .zero, modelDeletionManager: modelDeletionManager)
        
        arView.session.delegate = context.coordinator
        
        // Subscribe to SceneEvents.update
        self.placementSettings.sceneObserver = arView.scene.subscribe(to: SceneEvents.Update.self, { (event) in
            self.updateScene(for: arView)
        })
        
       // self.setupCoachingOverlay(arView: arView)
        
        return arView
    }
    
//    func setupCoachingOverlay(arView: CustomARView) {
//        coachingOverlay.session = arView.session
//        coachingOverlay.delegate = arView.session.delegate as? ARCoachingOverlayViewDelegate
//
//        coachingOverlay.translatesAutoresizingMaskIntoConstraints = false
//
//        arView.addSubview(coachingOverlay)
//
//        NSLayoutConstraint.activate([
//            coachingOverlay.centerXAnchor.constraint(equalTo: arView.centerXAnchor),
//            coachingOverlay.centerYAnchor.constraint(equalTo: arView.centerYAnchor),
//            coachingOverlay.widthAnchor.constraint(equalTo: arView.widthAnchor),
//            coachingOverlay.heightAnchor.constraint(equalTo: arView.heightAnchor)
//            ])
//
//        coachingOverlay.activatesAutomatically = true
//
//        coachingOverlay.goal = .horizontalPlane
//    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    private func updateScene(for arView: CustomARView) {
        
        // Only display focusEntity when the user has selected a model for placement
        arView.focusEntity?.isEnabled = self.placementSettings.selectedModel != nil
        
        // Add model to scene if confirmed for placement
        if let confirmedModel = self.placementSettings.confirmedModel, let modelEntity = confirmedModel.modelEntity {
            
            confirmedModel.modelAnchor = ARAnchor(transform: getTransformForPlacement(in: arView)!)
            self.place(modelEntity, anchor: confirmedModel.modelAnchor!, in: arView)
            arView.session.add(anchor: confirmedModel.modelAnchor!)
            self.placementSettings.confirmedModel = nil
            self.placementSettings.selectedModel = nil // This line is if the image is detected while the user is placing another model
        }
    }
    
    private func place(_ modelEntity: ModelEntity, anchor: ARAnchor, in arView: ARView) {
        // 1. Clone modelEntity. This creates an identical copy of modelEntity and references the same model. This also allows us ot have mulitple models of the same asset in our scene.
        let clonedEntity = modelEntity.clone(recursive: true)
        
        // 2. Enable translation and rotation gestures
        clonedEntity.generateCollisionShapes(recursive: true)
        arView.installGestures([.translation, .rotation, .scale], for: clonedEntity)
        
        // 3. Create an anchorEntity and add clonedEntity to the anchorEntity.
        let anchorEntity = AnchorEntity(plane: .any)
        anchorEntity.addChild(clonedEntity)
        
        anchorEntity.anchoring = AnchoringComponent(anchor)
        
        // 4. Add the anchorEntity to the arView.scene
        arView.scene.addAnchor(anchorEntity)
        
        print("Added modelEntity to scene.")
    }
    
    private func getTransformForPlacement(in arView: ARView) -> simd_float4x4? {
        guard let query = arView.makeRaycastQuery(from: arView.center, allowing: .estimatedPlane, alignment: .any) else {
            return nil
        }
        guard let raycastResult = arView.session.raycast(query).first else { return nil }

        return raycastResult.worldTransform
    }
}

extension ARViewContainer {
    class Coordinator: NSObject, ARSessionDelegate, ARCoachingOverlayViewDelegate {
        var parent: ARViewContainer

        init(_ parent: ARViewContainer) {
            self.parent = parent
        }
        
        func coachingOverlayViewWillActivate(_ coachingOverlayView: ARCoachingOverlayView) {
            self.parent.overlayVisible = true
        }
    
        func coachingOverlayViewDidDeactivate(_ coachingOverlayView: ARCoachingOverlayView) {
            self.parent.overlayVisible = false
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}



