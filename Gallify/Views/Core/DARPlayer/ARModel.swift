//
//  ARModel.swift
//  Reale
//
//  Created by Sahil Srivastava on 5/26/22.
//

import Foundation
import SwiftUI
import RealityKit
import ARKit
import Combine
import AVFoundation

class ARModel: Equatable {
    static func == (lhs: ARModel, rhs: ARModel) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    //var image: UIImage
    var name: String
    var entity: Entity?
    var modelAnchor: ARAnchor? //just so error for old ar player go away.
    
    var art : Art
    var modelURL : URL?
    var contentLoaded: Bool
    var isLoading: Bool?
    
    var cancellable: AnyCancellable?
    
    init(artwork: Art) {
        self.name = artwork.name
        // Get image asset
       // self.image = UIImage(named: name) ?? UIImage(systemName: "photo")!
        self.art = artwork
        self.contentLoaded = false
        self.isLoading = false
    }
    
    /*
    func loadEntity(completion: @escaping (Entity?) -> () = { _ in }) {
        cancellable = ModelEntity.loadAsync(named: name + ".usdz")
            .sink { status in
                switch status {
                case .failure(let error):
                    completion(nil)
                    print(error.localizedDescription)
                case .finished:
                    print("Entity Loaded")
                }
            } receiveValue: { entity in
                self.entity = entity
                completion(entity)
            }

    }
    */
    
    func loadEntity(completion: @escaping (Entity?) -> () = { _ in }) {
        
        let type = art.contentType
        let loaded = contentLoaded
       
        //if image
        if(type==0 && !loaded){
            
            
            //DispatchQueue.global().async{
                //Test: https://cdn.britannica.com/45/5645-050-B9EC0205/head-treasure-flower-disk-flowers-inflorescence-ray.jpg
                print(self.art.contentUrl)
                let remoteURL = URL(string: String(self.art.contentUrl))!
                
                // Create a temporary file URL to store the image at the remote URL.
                let fileURL = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
                // Download contents of imageURL as Data.  Use a URLSession if you want to do this asynchronously.
                let data = try! Data(contentsOf: remoteURL)
                
                // Write the image Data to the file URL.
                try! data.write(to: fileURL)
                
                let imgTexture = try! MaterialParameters.Texture.init(.load(contentsOf: fileURL))
                
//                var textureRequest: AnyCancellable? = nil
//                textureRequest = TextureResource.loadAsync(contentsOf: fileURL).sink { (error) in
//                    print(error)
//                    textureRequest?.cancel()
//                } receiveValue: { (texture) in
//                    var material = UnlitMaterial()
//                    material.baseColor = MaterialColorParameter.texture(texture)
//                    // Do another setup
//                    textureRequest?.cancel()
//                }
                
                let longerLength: Float = 0.5
                var planeHeight: Float? = nil
                var planeWidth: Float? = nil
                if imgTexture.resource.height > imgTexture.resource.width {
                    planeHeight = longerLength
                    planeWidth = Float(imgTexture.resource.width) / (Float(imgTexture.resource.height) / longerLength)
                } else {
                    planeWidth = longerLength
                    planeHeight = Float(imgTexture.resource.height) / (Float(imgTexture.resource.width) / longerLength)
                }
                
                var material = SimpleMaterial()
                material.color = .init(tint: .init(hue: 1, saturation: 0, brightness: 5, alpha: 1), texture: imgTexture)
    //            material.roughness = 1
    //            material.metallic = 1
                
                let mesh = MeshResource.generatePlane(width: planeWidth!, depth: planeHeight!)
                let entity = ModelEntity(mesh: mesh, materials: [material])
            
                self.entity = entity
                self.contentLoaded = true
                
              //  DispatchQueue.main.async{
                    completion(entity)
             //   }
            //}
            
        }
        
        //if image already loaded.
        if(type==0 && loaded){
            let entity = self.entity
            completion(entity)
        }
        
        //if usdz
        if(type==1 && !loaded){
            
            //Get Content Path. ex. "/models/toy_robot_vintage.usdz", "/model/cc8e6efa-3d77-43b9-9938-37c37357db6c"
            let pictureItem = art.contentUrl
            let url_token = pictureItem.split(separator: "?")
            var url = url_token[0].split(separator: "/")
            url.reverse()
        
            let path = url[0].components(separatedBy: "%2F")
           
            
            let contentPath = "/" + "\(path[0])" + "/" + "\(path[1])"
            
            FirebaseStorageHelper.asyncDownloadToFilesystem(relativePath: contentPath) { localUrl in
                
                print("jnjn")
                
                self.cancellable = ModelEntity.loadAsync(contentsOf: localUrl)
                    .sink { status in
                        switch status {
                        case .failure(let error):
                            completion(nil)
                            print("starrt")
                            print(error.localizedDescription)
                            print("starrt")
                        case .finished:
                            print("Entity Loaded")
                        }
                    } receiveValue: { entity in
                        self.entity = entity
                        self.modelURL = localUrl
                        self.contentLoaded = true
                        completion(entity)
                    }
            }
        }
        
        //if video
        if(type==2 && !loaded){
            FirebaseStorageHelper.asyncDownloadToFilesystem(relativePath: "\(art.storageName)") { localUrl in
                    
                    //grabs the localURL
                    // Create an AVPlayer instance to control playback of that movie.
                    let player = AVPlayer(url: localUrl)

                    // Instantiate and configure the video material.
                    let material = VideoMaterial(avPlayer: player)

                    // Configure audio playback mode.
                    material.controller.audioInputMode = .spatial
                    let planeHeight: Float = 1
                    let planeWidth: Float = 1
                    
                    /*
                    let imgTexture = try! MaterialParameters.Texture.init(.load(contentsOf: url)) //change gallify name.

                    let longerLength: Float = 0.5
                    if imgTexture.resource.height > imgTexture.resource.width {
                        planeHeight = longerLength
                        planeWidth = Float(imgTexture.resource.width) / (Float(imgTexture.resource.height) / longerLength)
                    } else {
                        planeWidth = longerLength
                        planeHeight = Float(imgTexture.resource.height) / (Float(imgTexture.resource.width) / longerLength)
                    }
                     */
                    
                    // Create a new model entity using the video material.
                    let modelEntity = ModelEntity(mesh: MeshResource.generatePlane(width: planeHeight, height: planeWidth), materials: [material])
                    
                    // Start playing the video.
                    player.play()
                    
                    self.entity = modelEntity
                    completion(modelEntity)
                
            }
        }
        
        //if gif
        if(type==3 && !loaded){
            //todo
        }

    }
    
    
    //Create a method to async load model Entity
    func asyncLoadModelEntity(handler: @escaping (_ completed: Bool, _ error: Error?) -> Void){
        print(self.art.contentType, contentLoaded, "HHH")
        if(self.art.contentType == 1 && self.contentLoaded==false){
            FirebaseStorageHelper.asyncDownloadToFilesystem(relativePath: "\(self.art.storageName)") { localUrl in //models/
                print("LOCAL URL")
                print(localUrl)
                
                self.isLoading = true
                self.cancellable = ModelEntity.loadModelAsync(contentsOf: localUrl) //loadModelAsync
                    .sink(receiveCompletion: { loadCompletion in
                        
                        switch loadCompletion {
                        case .failure(let error): print("Unable to load modelEntityfor \(self.art.name). Error: \(error.localizedDescription)")
                            handler(false, error)
                        case .finished:
                            break
                        }
                            
                    }, receiveValue: { modelEntity in
                        
                        self.modelURL = localUrl
                        print("MODEL URL L")
                        //print(self.modelURL)
                        print(localUrl)
                        self.entity = modelEntity
                       // self.modelEntity?.scale *= self.scaleCompensation //scale?
                        
                        handler(true, nil)
                        
                       
                        print("modelEntity for \(self.art.name) has been loaded.")
                        
                    })
            }
        }
        else{
            handler(true, nil)
        }
        
    }
}





//class ARVideoModel: ARModel {
//    override func loadEntity(completion: @escaping (Entity?) -> () = { _ in }) {
//        print(name)
//
//
//        if let url = Bundle.main.url(forResource: name, withExtension: "mov") {
//            print(url.absoluteString)
//            // Create an AVPlayer instance to control playback of that movie.
//            let player = AVPlayer(url: url)
//
//            // Instantiate and configure the video material.
//            let material = VideoMaterial(avPlayer: player)
//
//            // Configure audio playback mode.
//            material.controller.audioInputMode = .spatial
//            let planeHeight: Float = 1
//            let planeWidth: Float = 1
//
//            /*
//            let imgTexture = try! MaterialParameters.Texture.init(.load(contentsOf: url)) //change gallify name.
//
//            let longerLength: Float = 0.5
//            if imgTexture.resource.height > imgTexture.resource.width {
//                planeHeight = longerLength
//                planeWidth = Float(imgTexture.resource.width) / (Float(imgTexture.resource.height) / longerLength)
//            } else {
//                planeWidth = longerLength
//                planeHeight = Float(imgTexture.resource.height) / (Float(imgTexture.resource.width) / longerLength)
//            }
//             */
//
//            // Create a new model entity using the video material.
//            let modelEntity = ModelEntity(mesh: MeshResource.generatePlane(width: planeHeight, height: planeWidth), materials: [material])
//
//            // Start playing the video.
//            player.play()
//
//            self.entity = modelEntity
//            completion(modelEntity)
//        } else {
//            print("ERROR")
//        }
//
////        cancellable = ModelEntity.loadModelAsync(named: name + ".mp4")
////            .sink { status in
////                switch status {
////                case .failure(let error):
////                    completion(nil)
////                    print(error.localizedDescription)
////                case .finished:
////                    print("Entity Loaded")
////                }
////            } receiveValue: { entity in
////                self.entity = entity
////                completion(entity)
////            }
//    }
//}

//class ARImageModel: ARModel {
//    override func loadEntity(completion: @escaping (Entity?) -> () = { _ in }) {
//
//        let remoteURL = URL(string: String("https://www.sourish.dev/resources/images/CenterPiecePhoto.JPG"))! //String(model.art.contentUrl) //https://www.sourish.dev/resources/images/CenterPiecePhoto.JPG
//        // Create a temporary file URL to store the image at the remote URL.
//        let fileURL = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
//        // Download contents of imageURL as Data.  Use a URLSession if you want to do this asynchronously.
//        let data = try! Data(contentsOf: remoteURL)
//
//        // Write the image Data to the file URL.
//        try! data.write(to: fileURL)
//
//        let imgTexture = try! MaterialParameters.Texture.init(.load(contentsOf: fileURL)) //change gallify name.
//
//            let longerLength: Float = 0.5
//            var planeHeight: Float? = nil
//            var planeWidth: Float? = nil
//            if imgTexture.resource.height > imgTexture.resource.width {
//                planeHeight = longerLength
//                planeWidth = Float(imgTexture.resource.width) / (Float(imgTexture.resource.height) / longerLength)
//            } else {
//                planeWidth = longerLength
//                planeHeight = Float(imgTexture.resource.height) / (Float(imgTexture.resource.width) / longerLength)
//            }
//
//            var material = SimpleMaterial()
//            material.color = .init(tint: .white, texture: imgTexture)
//            material.roughness = 1
//            material.metallic = 1
//
//            let mesh = MeshResource.generatePlane(width: planeWidth!, depth: planeHeight!)
//            let modelEntity = ModelEntity(mesh: mesh, materials: [material])
//
//            completion(modelEntity)
//    }
//}









