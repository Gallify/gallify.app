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
                        if(model.contentLoaded){
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
