//
//  Slider.swift
//  Gallify
//
//  Created by Sourish Kundu on 2/12/22.
//

import SwiftUI
import RealityKit

struct Slider: View {
    @EnvironmentObject var modelsViewModel: ModelsViewModel
    @EnvironmentObject var firestoreQuery : FirestoreQuery
    @EnvironmentObject var placementSettings: PlacementSettings
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: [GridItem()]) {
                // Text("MODELS VIEW MODEL COUNT IS: \(modelsViewModel.models.count)")
                
                ForEach(0..<modelsViewModel.models.count) { index in
                    let model = modelsViewModel.models[index]

                    SliderItem(model: model) {
                        //call model method to async load entity
                        model.asyncLoadModelEntity { completed, error in
                            if completed {
                                //select model for placement
                                self.placementSettings.selectedModel = model
                            }
                        }
                        print("BrowseView selected \(model.name) for placement")
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
            Image(uiImage: self.model.thumbnail)
            // Image(systemName: "face.smiling")
                .resizable()
                .frame(width: 75, height: 75)
                .aspectRatio(1/1, contentMode: .fit)
                .background(Color(UIColor.secondarySystemFill))
                .clipShape(Circle())
        }
        .padding()
        
        
    }
}
