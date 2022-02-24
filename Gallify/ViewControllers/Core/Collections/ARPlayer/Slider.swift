//
//  Slider.swift
//  Gallify
//
//  Created by Sourish Kundu on 2/12/22.
//

import SwiftUI
import RealityKit
import SDWebImageSwiftUI

struct Slider: View {
    @EnvironmentObject var modelsViewModel: ModelsViewModel
    @EnvironmentObject var firestoreQuery : FirestoreQuery
    @EnvironmentObject var placementSettings: PlacementSettings
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: [GridItem()]) {
                // Text("MODELS VIEW MODEL COUNT IS: \(modelsViewModel.models.count)")
                
                ForEach(0..<firestoreQuery.models.count) { index in
                    let model = firestoreQuery.models[index]

                    SliderItem(model: model) {
                        if(model.art.content_type == 0){
                            placeImage(model : model)
                        }
                        else if(model.contentLoaded){
                            self.placementSettings.selectedModel = model
                        }
                        else{
                            model.asyncLoadModelEntity { completed, error in
                                if completed {
                                    //select model for placement
                                    model.contentLoaded = true
                                    self.placementSettings.selectedModel = model
                                }
                            }
                        }
                       
                        print("BrowseView selected \(model.art.name) for placement")
                    }
                }
            }
        }
        //.padding(.bottom, 15)
        .frame(height: 200)
    }
    
    private func placeImage(model: Model) {
        
        let remoteURL = URL(string: "https://www.sourish.dev/resources/images/CenterPiecePhoto.JPG")!
        // Create a temporary file URL to store the image at the remote URL.
        let fileURL = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
        // Download contents of imageURL as Data.  Use a URLSession if you want to do this asynchronously.
        let data = try! Data(contentsOf: remoteURL)
        
        // Write the image Data to the file URL.
        try! data.write(to: fileURL)
        
        let imgTexture = try! MaterialParameters.Texture.init(.load(contentsOf: fileURL)) //change gallify name.
            
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
            material.color = .init(tint: .white, texture: imgTexture)
            material.roughness = 1
            material.metallic = 1
            
            let mesh = MeshResource.generatePlane(width: planeWidth!, depth: planeHeight!)
            let object = ModelEntity(mesh: mesh, materials: [material])
            
            //let model = Model(name: "image", modelEntity: object)
            model.modelEntity = object
            
            placementSettings.selectedModel = model
        }
}

struct SliderItem: View {
    var model: Model
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            
            if(model.contentLoaded){
                WebImage(url: URL(string: model.art.thumbnail))
                    .resizable()
                    .frame(width: 75, height: 75)
                    .aspectRatio(1/1, contentMode: .fit)
                    .background(Color(UIColor.secondarySystemFill))
                    .clipShape(Circle())
                
            }
            else{
                WebImage(url: URL(string: model.art.thumbnail))
                    .resizable()
                    .colorMultiply(Color("Gallify-Pink"))
                    .frame(width: 75, height: 75)
                    .aspectRatio(1/1, contentMode: .fit)
                    .background(Color(UIColor.secondarySystemFill))
                    .clipShape(Circle())
            }
            
            
    
        }
        .padding()
        
        
    }
}
