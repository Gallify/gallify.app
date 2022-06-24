//
//  USDZPostHelper.swift
//  Gallify
//
//  Created by Anshul on 1/4/22.
//
import SwiftUI
import SceneKit
import SDWebImage

struct USDZPostHelper: UIViewRepresentable {
    
    let modelName: Model
    let isMovable: Bool
    let url = URL(string: "http://www.example.com/image.jpg")
    
    typealias UIViewType = SCNView
    
    func makeUIView(context: Context) -> SCNView {

        let scnView = SCNView()
        var scene = SCNScene()
        
        let remoteURL = URL(string: modelName.art.contentUrl)!
        let remoteURL2 = modelName.modelURL //URL(string: modelName.modelURL)!
        // Create a temporary file URL to store the image at the remote URL.
        let fileURL = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
        // Download contents of imageURL as Data.  Use a URLSession if you want to do this asynchronously.
        let data = try! Data(contentsOf: remoteURL)
        
        // Write the image Data to the file URL.
        try! data.write(to: fileURL)
        
        
       // var documents = ""
        do{
           // documents = try String(contentsOf: (modelName.modelURL ?? url)!)
//            print("Model URL")
//            print(modelName.modelURL)
           // let documents = "yourValidPath"
           // scene = try SCNScene(url: URL(fileURLWithPath: "file:///var/mobile/Containers/Data/Application/0FF5CFD6-245B-4CF8-A950-D35B9F49E5FB/Documents/models/air_force.usdz"), options: nil)
            print("File URL")
            print(fileURL)
            scene = try SCNScene(url: remoteURL2!)
          //  scene = try SCNScene(named: "toy_car.usdz")!
        }
        catch{
           // print(documents)
            print("error USDZPost Helper: URL likely wrong")
        }
//       // let scene = try SCNScene(named: "toy_car.usdz")
//        //let scene = try SCNScene(url: (((fileURL) ?? url) ?? url)!)
//        let documents = "yourValidPath"
//        let scene = try SCNScene(url: URL(fileURLWithPath: documents), options: nil)
//       // let scene = try SCNScene(url: URL(fileURLWithPath: String(modelName.modelURL)), options: nil)
//
//

        
        
        scnView.allowsCameraControl = isMovable

        scnView.autoenablesDefaultLighting = true

        scnView.backgroundColor = UIColor.white

        scnView.scene = scene

        return scnView
//
        
//
//        let scnView = SCNView()
//
//                do{
//                    if(modelName.modelURL != nil){
//
//                        //let scene = try SCNScene(url: modelName.modelURL!)
//                        let scene = SCNScene(named: "toy_car.usdz")
//
//                        let scnView = SCNView()
//
//                        scnView.allowsCameraControl = isMovable
//
//                        scnView.autoenablesDefaultLighting = true
//
//                        scnView.backgroundColor = UIColor.white
//
//                        scnView.scene = scene
//                    }
//
//
//                }
//                catch{
//                    print("Error: URL for this model doesn't exist or is wrong.")
//                }
//
//                return scnView
        
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
            
        }
    
}

//struct USDZPostHelper_Previews: PreviewProvider {
//    static var previews: some View {
//        USDZPostHelper(modelName: "toy_car.usdz", isMovable: true)
//    }
//}
