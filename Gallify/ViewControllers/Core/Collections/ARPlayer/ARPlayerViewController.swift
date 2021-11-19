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

//class ViewController: UIViewController, ARSessionDelegate {
//
//
//    @IBOutlet weak var arView: ARView!{
//        didSet {
//            if arView == nil {
//                print("sdjfnksdjfnksjd arView set to nil!")
//                // ^ SET A BREAKPOINT IN THIS LINE
//            }
//        }
//    }
//
//
//
//
//    // The 3D character to display.
//    var character: BodyTrackedEntity?
//    let characterOffset: SIMD3<Float> = [-1.0, 0, 0] // Offset the character by one meter to the left
//    let characterAnchor = AnchorEntity()
//
//
//    //add a viewDidLoad().
//    override func loadView(){
//        super.loadView()
//        print("loaded")
//    }
//
//    override func viewDidLoad() {
//
//        super.viewDidLoad()
//        print("didload")
//       // self.view.addSubview()
//
//
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        _ = self.view
//        print("willappear")
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        arView.session.delegate = self //here
//        print("didappear")
//
//        // If the iOS device doesn't support body tracking, raise a developer error for
//        // this unhandled case.
//        guard ARBodyTrackingConfiguration.isSupported else {
//            fatalError("This feature is only supported on devices with an A12 chip")
//        }
//
//        // Run a body tracking configration.
//        let configuration = ARBodyTrackingConfiguration()
//        arView.session.run(configuration)
//
//        arView.scene.addAnchor(characterAnchor)
//
//        // Asynchronously load the 3D character.
//        var cancellable: AnyCancellable? = nil
//        cancellable = Entity.loadBodyTrackedAsync(named: "character/robot").sink(
//            receiveCompletion: { completion in
//                if case let .failure(error) = completion {
//                    print("Error: Unable to load model: \(error.localizedDescription)")
//                }
//                cancellable?.cancel()
//        }, receiveValue: { (character: Entity) in
//            if let character = character as? BodyTrackedEntity {
//                // Scale the character to human size
//                character.scale = [1.0, 1.0, 1.0]
//                self.character = character
//                cancellable?.cancel()
//            } else {
//                print("Error: Unable to load model as BodyTrackedEntity")
//            }
//        })
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//    }
//
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//    }
//
//    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
//        for anchor in anchors {
//            guard let bodyAnchor = anchor as? ARBodyAnchor else { continue }
//
//            // Update the position of the character anchor's position.
//            let bodyPosition = simd_make_float3(bodyAnchor.transform.columns.3)
//            characterAnchor.position = bodyPosition + characterOffset
//            // Also copy over the rotation of the body anchor, because the skeleton's pose
//            // in the world is relative to the body anchor's rotation.
//            characterAnchor.orientation = Transform(matrix: bodyAnchor.transform).rotation
//
//            if let character = character, character.parent == nil {
//                // Attach the character to its anchor as soon as
//                // 1. the body anchor was detected and
//                // 2. the character was loaded.
//                characterAnchor.addChild(character)
//            }
//        }
//    }
//
//
//}

//class ViewController: UIViewController {
//
//    let label:UILabel = {
//        let label = UILabel()
//        label.text = "Hello World"
//        label.font = UIFont.boldSystemFont(ofSize: 40)
//        label.textColor = .systemBlue
//        label.contentMode = .center
//        label.textAlignment = .center
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.view.addSubview(label)
//
//        NSLayoutConstraint.activate([
//            label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
//        ])
//
//    }
//
//}

class ViewController: UIViewController {
    
    var arView: ARSCNView {
        return self.view as! ARSCNView
    }
    
    override func loadView() {
        self.view = ARSCNView(frame: .zero)
        self.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        arView.delegate = self
        arView.scene = SCNScene()
        
        #if DEBUG
        arView.showsStatistics = true
        arView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
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
