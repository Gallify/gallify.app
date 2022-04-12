////
////  ARPlayerContainer.swift
////  Gallify
////
////  Created by Tejvir Mann on 12/3/21.
////
//import Foundation
//import SwiftUI
//import RealityKit
//import ARKit
//
///*
// ARPlayerContainer.swift
// FullARView() is called from CollectionReelHeader.swift.
// The FullARView() calls the ARViewContainer view and other views to help with buttons.
// */
//
//
//struct FullARView: View {
//    @EnvironmentObject var modelsViewModel: ModelsViewModel
//    @EnvironmentObject var firestoreQuery : FirestoreQuery
//    @EnvironmentObject var placementSettings: PlacementSettings
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//
//    
//    @State private var showSlider: Bool = false
//    @State private var overlayVisible: Bool = false //used to be true, wasnt loading so skipped it
//    var body: some View {
//        ZStack(alignment: .bottom) {
//            ARViewContainer(overlayVisible: $overlayVisible)
//                .edgesIgnoringSafeArea(.all)
//            
//            if !overlayVisible {
//                if placementSettings.selectedModel == nil {
//                    if showSlider {
//                        Slider()
//                    } else {
//                        
//                        HStack{
//                            
////                            Button(action: {
////                                presentationMode.wrappedValue.dismiss()
////                                }) {
////                                    HStack {
////
////                                        Image(systemName: "square")
////                                            .resizable()
////                                            .foregroundColor(Color.pink)
////                                            .frame(width: 10, height: 10)
////                                            .onTapGesture {
////                                                firestoreQuery.showCameraScreen = false
////                                            }
////
////                                    }
////
////                                }
//                            
//                            Button(action: {
//                                print("Toggle slider button pressed!!!")
//                                showSlider.toggle()
//                            }) {
//                                Image(systemName: "square")
//                                    .font(.system(size: 45))
//                                    .foregroundColor(.white)
//                                    .buttonStyle(PlainButtonStyle())
//                            }
//                
//                        }
//                        
//                    }
//                } else {
//                    AddModelBar()
//                }
//            }
//        }.task{
//            if(firestoreQuery.models.isEmpty){
//                await firestoreQuery.fetchModelData()
//            }
//        }
//        
//    }
//}
//
//
//struct ARViewContainer: UIViewRepresentable {
//    @EnvironmentObject var modelsViewModel: ModelsViewModel
//    @EnvironmentObject var firestoreQuery: FirestoreQuery
//    @EnvironmentObject var placementSettings: PlacementSettings
//    @Binding var overlayVisible: Bool
//    
//    let coachingOverlay = ARCoachingOverlayView()
//    
//    func makeUIView(context: Context) -> ARView {
//        let arView = CustomARView(frame: .zero)
//        
//        arView.session.delegate = context.coordinator
//        
//        // Subscribe to SceneEvents.update
//        self.placementSettings.sceneObserver = arView.scene.subscribe(to: SceneEvents.Update.self, { (event) in
//            self.updateScene(for: arView)
//        })
//        
//        self.setupCoachingOverlay(arView: arView)
//        
//        return arView
//    }
//    
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
//    
//    func updateUIView(_ uiView: ARView, context: Context) {}
//    
//    private func updateScene(for arView: CustomARView) {
//        
//        // Only display focusEntity when the user has selected a model for placement
//        arView.focusEntity?.isEnabled = self.placementSettings.selectedModel != nil
//        
//        // Add model to scene if confirmed for placement
//        if let confirmedModel = self.placementSettings.confirmedModel, let modelEntity = confirmedModel.modelEntity {
//            
//            confirmedModel.modelAnchor = ARAnchor(transform: getTransformForPlacement(in: arView)!)
//            self.place(modelEntity, anchor: confirmedModel.modelAnchor!, in: arView)
//            arView.session.add(anchor: confirmedModel.modelAnchor!)
//            self.placementSettings.confirmedModel = nil
//            self.placementSettings.selectedModel = nil // This line is if the image is detected while the user is placing another model
//        }
//    }
//    
//    private func place(_ modelEntity: ModelEntity, anchor: ARAnchor, in arView: ARView) {
//        // 1. Clone modelEntity. This creates an identical copy of modelEntity and references the same model. This also allows us ot have mulitple models of the same asset in our scene.
//        let clonedEntity = modelEntity.clone(recursive: true)
//        
//        // 2. Enable translation and rotation gestures
//        clonedEntity.generateCollisionShapes(recursive: true)
//        arView.installGestures([.translation, .rotation, .scale], for: clonedEntity)
//        
//        // 3. Create an anchorEntity and add clonedEntity to the anchorEntity.
//        let anchorEntity = AnchorEntity(plane: .any)
//        anchorEntity.addChild(clonedEntity)
//        
//        anchorEntity.anchoring = AnchoringComponent(anchor)
//        
//        // 4. Add the anchorEntity to the arView.scene
//        arView.scene.addAnchor(anchorEntity)
//        
//        print("Added modelEntity to scene.")
//    }
//    
//    private func getTransformForPlacement(in arView: ARView) -> simd_float4x4? {
//        guard let query = arView.makeRaycastQuery(from: arView.center, allowing: .estimatedPlane, alignment: .any) else {
//            return nil
//        }
//        guard let raycastResult = arView.session.raycast(query).first else { return nil }
//
//        return raycastResult.worldTransform
//    }
//}
//
//extension ARViewContainer {
//    class Coordinator: NSObject, ARSessionDelegate, ARCoachingOverlayViewDelegate {
//        var parent: ARViewContainer
//
//        init(_ parent: ARViewContainer) {
//            self.parent = parent
//        }
//        
//        func coachingOverlayViewWillActivate(_ coachingOverlayView: ARCoachingOverlayView) {
//            self.parent.overlayVisible = true
//        }
//    
//        func coachingOverlayViewDidDeactivate(_ coachingOverlayView: ARCoachingOverlayView) {
//            self.parent.overlayVisible = false
//        }
//    }
//    
//    func makeCoordinator() -> Coordinator {
//        return Coordinator(self)
//    }
//}
