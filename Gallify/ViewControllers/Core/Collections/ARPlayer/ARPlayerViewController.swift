//
//  ARPlayerViewController.swift
//  Gallify
//
//  Created by Tejvir Mann on 11/15/21.
//

import UIKit
import RealityKit
import ARKit
import SwiftUI
import Combine

class ViewController: UIViewController {
    let updateQueue = DispatchQueue(label: Bundle.main.bundleIdentifier! +
        ".serialSceneKitQueue")
    
    var arView: ARSCNView {
        return self.view as! ARSCNView
    }
    
    override func loadView() {
     
        self.view = ARSCNView(frame: .zero)

        self.arView.frame = self.view.bounds
        self.arView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        arView.delegate = self
        arView.scene = SCNScene()
       
        
        #if DEBUG
       // arView.showsStatistics = false
        //arView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        #endif
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let configuration = arView.session.configuration {
            // Already got a config? Run it
            arView.session.run(configuration)
        } else {
            // Create a config the first time
            let configuration = ARWorldTrackingConfiguration()
            configuration.worldAlignment = .gravity
            configuration.planeDetection = [.horizontal, .vertical]
            
            guard let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "ImageDetection", bundle: nil) else {
                fatalError("Missing expected asset catalog resources.")
            }
            configuration.detectionImages = referenceImages
            
            configuration.environmentTexturing = .automatic
            configuration.frameSemantics.insert(.personSegmentationWithDepth)
            
            arView.session.run(configuration)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        arView.session.pause()
    }

}

extension ViewController: ARSCNViewDelegate {
    // Implement whichever delegate methods you want
    
}







struct SwiftUIViewController: UIViewControllerRepresentable {
    
    let v = ViewController()
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
    }
    
}
