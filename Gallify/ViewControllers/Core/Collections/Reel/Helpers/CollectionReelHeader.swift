//
//  ExpandedHeader.swift
//  Gallify
//
//  Created by Gianluca Profio on 9/26/21.
//

import SwiftUI
import RealityKit
import UIKit
import ARKit

class collection2: UIViewController, ObservableObject, ARSessionDelegate {
//
//    @IBAction func showplayer(_ sender: Any){
//        let test = ARPlayerViewController()
//        navigationController?pushViewController(test, animated: true)
//    }
    //@IBOutlet weak var showPlayer: UIButton!
    
//    @IBAction func ar(_ sender: UIButton) {
//        navigationController?.pushViewController(ARPlayerViewController(), animated: true)
//    }
    
    var name: String = ""
    func updatename (_name : String){
        self.name = "nae"
    }
    
    //a button is pressed.
    
    //then a method in this class calls a view controller.
    
    
}


//class arVieww: UIViewController, ObservableObject, ARSessionDelegate {
//
//    // MARK: - Properties
//
//    var arView: ARView!
//    weak var restartButton: UIButton!
//
//    let coachingOverlay = ARCoachingOverlayView()
//    let configuration = ARWorldTrackingConfiguration()
//
//
//    enum Instruction: String {
//        case freezeFacialExpression = "Tap to freeze facial expression"
//        case noFaceDetected = "Face not recognized"
//        case moveFurtherAway = "Move further away from placed head"
//    }
//
//    // MARK: - View controller lifecycle
//
//    /// - Tag: RunConfiguration
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        arView.session.run(configuration)
//    }
//
//    override func viewDidLoad() {
//       //var arView: ARView
//        super.viewDidLoad()
//
//        guard ARWorldTrackingConfiguration.supportsUserFaceTracking else {
//            fatalError("This sample code requires iOS 13 / iPad OS 13, and an iOS device with a front TrueDepth camera. Note: 2020 iPads do not support user face-tracking while world tracking.")
//        }
//
//        arView.session.delegate = self
//
//        // We want to run a custom configuration.
//        arView.automaticallyConfigureSession = false
//
//        // Make sure the robot head remains crisp at all times when attached to the camera.
//        arView.renderOptions.insert(.disableMotionBlur)
//
//        // Enable environment texturing.
//        configuration.environmentTexturing = .automatic
//
//        // Enable tracking the user's face during the world tracking session.
//        configuration.userFaceTrackingEnabled = true
//
//        // Prevent the screen from being dimmed to avoid interuppting the AR experience.
//        UIApplication.shared.isIdleTimerDisabled = true
//
//
//    }
//
//}

struct SwiftUIView: View {
    var body: some View {
        SwiftUIViewController()
    }
}

struct CollectionReelHeader: View {
    
    @EnvironmentObject var viewModel: collection2
    //@EnvironmentObject var viewModel2: arVieww

    let screenWidth: CGFloat
    var body: some View {
        HStack {
            
            NavigationLink(
                destination: CollectionRecentActivityView(screenWidth: screenWidth),
                label: {
                    Image(systemName: "chevron.up.circle")
                        .font(.system(size: 40))
                        .padding(.leading)
                })
                .buttonStyle(ThemeAnimationStyle())
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle("")
                .navigationBarHidden(true)
            
            Spacer()
            
            //var v = ViewController.arView
//            let test = ARPlayerViewController()
//            navigationController?pushViewController(test, animated: true)
//
            NavigationLink (
                destination: SwiftUIView(),
                label: {
                Image (systemName: "arkit")
                    .resizable()
                    .foregroundColor(Color.black)
                    .frame(width: screenWidth / 10, height: screenWidth / 10)
                    .padding(.trailing, screenWidth / 30)
                    .animation(.easeInOut)
                })
                .buttonStyle(ThemeAnimationStyle())
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle("")
                .navigationBarHidden(true)
            
           
       //     Spacer() //added
            
//            Button(action: {
////                arVieww().viewWillAppear(true)
////                arVieww().viewDidLoad()
//                //viewModel2.viewDidLoad()
//               // var test = ARPlayerViewController()
//               // navigationController?pushViewController(test, animated: true)
//                SwiftUIViewController()
//
//            }) {
//
//                    HStack {
//
//                        Text("AR")
//                            .font(.title3)
//                            .fontWeight(.bold)
//                            .foregroundColor(Color.white)
//                            .background(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
//
//
//                    }
//
//                }
//
//
        }
        
        
        
    }
}

struct CollectionReelHeader_Previews: PreviewProvider {
    static var previews: some View {
        CollectionReelHeader(screenWidth: UIScreen.main.bounds.width)
    }
}


