//
//  Model.swift
//  Gallify
//
//  Created by Sourish Kundu on 2/12/22.
//

import SwiftUI
import ARKit
import RealityKit
import Combine
import SDWebImageSwiftUI

class Model {
    var name: String
    //var thumbnail: Image
    var thumbnail_url: String
    var content_url: String
    //add scale compensation later.
    //add transforms later.
   
    var modelEntity: ModelEntity?
    var modelAnchor: ARAnchor?
    
    private var cancellable: AnyCancellable?
    
    init(name: String, thumbnail_url: String, content_url: String) {
        self.name = name
        //self.thumbnail = UIImage(named: name) ?? UIImage(systemName: "photo")!
        self.thumbnail_url = thumbnail_url
        self.content_url = content_url
        
//        self.thumbnail = AsyncImage(url: URL(string: "\(self.thumbnail_url)"))
//
//        AsyncImage(url: URL(string: self.thumbnail_url)!,
//                   self.thumbnail: { Image(uiImage: $0).resizable() })

     //   self.thumbnail = Image(AsyncImage(url: URL(string: self.thumbnail_url)))
        
    }
    
    // TODO: Create a method to async load modelEntity
//    func asyncLoadModelEntity(handler: @escaping (_ completed: Bool, _ error: Error?) -> Void) {
//        self.modelAnchor = nil
//
//        let filename = self.name + ".usdz"
//
//        self.cancellable = ModelEntity.loadModelAsync(named: filename)
//            .sink { loadCompletion in
//                switch loadCompletion {
//                case .failure(let error): print("Unable to loadmodelEntity for \(filename). Error: \(error.localizedDescription)")
//                    handler(false, error)
//                case .finished:
//                    break
//                }
//            } receiveValue: { modelEntity in
//                self.modelEntity = modelEntity
//                handler(true, nil)
//                print("modelEntity for \(self.name) has been loaded.")
//            }
//
//    }
    
//    func asyncLoadModelEntity(handler: @escaping (_ completed: Bool, _ error: Error?) -> Void) {
//        self.modelAnchor = nil
//
//        let filename = self.name
//
//       // let url = URL(string: "urlString")
//        let fileUrl = NSURL(string: self.content_url)
//        self.cancellable = ModelEntity.loadModelAsync(contentsOf: fileUrl! as URL)
//            .sink { loadCompletion in
//                switch loadCompletion {
//
//                case .failure(let error):
//                    print(self.content_url)
//                    print("Unable to loadmodelEntity for \(filename). Error: \(error.localizedDescription)")
//                    handler(false, error)
//                case .finished:
//                    break
//                }
//            } receiveValue: { modelEntity in
//                self.modelEntity = modelEntity
//                handler(true, nil)
//                print("modelEntity for \(self.name) has been loaded.")
//            }
//
//    }
    
    func asyncLoadModelEntity(handler: @escaping (_ completed: Bool, _ error: Error?) -> Void) {
        
        let url = URL(string: self.content_url)
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let destination = documents.appendingPathComponent(url!.lastPathComponent)
        let session = URLSession(configuration: .default,
                                      delegate: nil,
                                 delegateQueue: nil)
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let downloadTask = session.downloadTask(with: request, completionHandler: { (location: URL?,
                                  response: URLResponse?,
                                     error: Error?) -> Void in
            
        let fileManager = FileManager.default
            
        if fileManager.fileExists(atPath: destination.path) {
            try! fileManager.removeItem(atPath: destination.path)
        }
        try! fileManager.moveItem(atPath: location!.path,
                                  toPath: destination.path)
            
        DispatchQueue.main.async {
                do {
                    let model = try ModelEntity.load(contentsOf: destination)
    //                    let anchor = AnchorEntity(world: [0,-0.2,0])
    //                        anchor.addChild(model)
    //                    anchor.scale = [5,5,5]
    //                    self.arView.scene.addAnchor(anchor)
                    self.modelEntity? = model as! ModelEntity
                    handler(true, nil)
                    print("modelEntity for \(self.name) has been loaded.")
                    
                   // model.playAnimation(model.availableAnimations.first!.repeat())
                } catch {
                    print("Unable to loadmodelEntity for \(self.name). Error: \(error.localizedDescription)")
                    handler(false, error)
                }
            }
        })
        downloadTask.resume()
    }
    
    
}
