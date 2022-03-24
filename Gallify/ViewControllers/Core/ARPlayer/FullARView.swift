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
 */


struct FullARView: View {
    @EnvironmentObject var firestoreQuery : FirestoreQuery
    
    @EnvironmentObject var modelsViewModel: ModelsViewModel
    @EnvironmentObject var placementSettings: PlacementSettings
    //@Environment(\.presentationMode) var presentationMode
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var showSlider: Bool = false
    @State private var overlayVisible: Bool = false //used to be true, wasnt loading so skipped it

    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        

        ZStack(alignment: .top) {
            ARViewContainer(overlayVisible: $overlayVisible)
//                .environmentObject(modelsViewModel)
//                .environmentObject(placementSettings)
                .edgesIgnoringSafeArea(.all)
            
            HStack{
                
                Button(action: {
                    if let url = URL(string: "https://polygonscan.com/token/") {
                       UIApplication.shared.open(url)
                    }
                }) {
                    HStack {
                        Text("HI")
                            .font(.system(size: 10))
                    }
                }
                
                Button{
                    //firestoreQuery.showNewScreen.toggle()
                    firestoreQuery.artPlaying = true
                    firestoreQuery.showCameraScreen = false
                    print(firestoreQuery.showCameraScreen)
                }
                    label: {
                        Image(systemName: "chevron.down")
                            .font(.system(size: 30))
                            .padding(.leading)
                            .foregroundColor(.white)
                    }
                    .buttonStyle(ThemeAnimationStyle())
                    .navigationBarBackButtonHidden(true)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
//                    .onTapGesture {
//                        firestoreQuery.showCameraScreen.toggle()
//                    }
                
                
                Spacer()
                
                CustomBackButton(buttonHeight: screenHeight / 32.5, buttonWidth: screenWidth / 15, image: Image(systemName: "square"), presentationMode: _presentationMode)
                    .padding(.horizontal,screenWidth / 25)
                    .padding(.vertical, screenHeight / 100)
                    .foregroundColor(.white)
                    .onTapGesture {
                        firestoreQuery.showCameraScreen = false
                    }
                
                Button{
                    //firestoreQuery.showNewScreen.toggle()
                    firestoreQuery.artPlaying = true
                    firestoreQuery.showCameraScreen = false
                    print(firestoreQuery.showCameraScreen)
                }
                    label: {
                        Image(systemName: "chevron.down")
                            .font(.system(size: 30))
                            .padding(.leading)
                            .foregroundColor(.white)
                    }
                    .buttonStyle(ThemeAnimationStyle())
                    .navigationBarBackButtonHidden(true)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
//                    .onTapGesture {
//                        firestoreQuery.showCameraScreen.toggle()
//                    }
                
            }
            
            if !overlayVisible {
                if placementSettings.selectedModel == nil {
                    if showSlider {
                        Slider()
                    } else {
                        Button(action: {
                            print("Toggle slider button pressed!!!")
                            showSlider.toggle()
                        }) {
                            Image(systemName: "face.smiling")
                                .font(.system(size: 45))
                                .foregroundColor(.white)
                                .buttonStyle(PlainButtonStyle())
                        }
                    }
                } else {
                    AddModelBar()
                }
            }
        }.task{
                if(firestoreQuery.models.isEmpty){
                    await firestoreQuery.fetchModelData()
                }
            }

    }
}


struct ARViewContainer: UIViewRepresentable {
    @EnvironmentObject var modelsViewModel: ModelsViewModel
    @EnvironmentObject var firestoreQuery: FirestoreQuery
    @EnvironmentObject var placementSettings: PlacementSettings
    @Binding var overlayVisible: Bool
    
    let coachingOverlay = ARCoachingOverlayView()
    
    func makeUIView(context: Context) -> ARView {
        let arView = CustomARView(frame: .zero)
        
        arView.session.delegate = context.coordinator
        
        // Subscribe to SceneEvents.update
        self.placementSettings.sceneObserver = arView.scene.subscribe(to: SceneEvents.Update.self, { (event) in
            self.updateScene(for: arView)
        })
        
        self.setupCoachingOverlay(arView: arView)
        
        return arView
    }
    
    func setupCoachingOverlay(arView: CustomARView) {
        coachingOverlay.session = arView.session
        coachingOverlay.delegate = arView.session.delegate as? ARCoachingOverlayViewDelegate
        
        coachingOverlay.translatesAutoresizingMaskIntoConstraints = false
        
        arView.addSubview(coachingOverlay)
        
        NSLayoutConstraint.activate([
            coachingOverlay.centerXAnchor.constraint(equalTo: arView.centerXAnchor),
            coachingOverlay.centerYAnchor.constraint(equalTo: arView.centerYAnchor),
            coachingOverlay.widthAnchor.constraint(equalTo: arView.widthAnchor),
            coachingOverlay.heightAnchor.constraint(equalTo: arView.heightAnchor)
            ])
        
        coachingOverlay.activatesAutomatically = true
        
        coachingOverlay.goal = .horizontalPlane
    }
    
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
        arView.installGestures([.rotation], for: clonedEntity) //.translation,
        
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
