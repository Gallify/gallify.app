//
//  USDZPost.swift
//  Gallify
//
//  Created by Anshul on 1/4/22.
//

import SwiftUI

struct USDZPost: View {
    
    @EnvironmentObject var viewModel: TabBarViewModel
    @State var isMovable = false
    @State var text = "Check out 3-D model"
    
    let model: String
        
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        ScrollView(showsIndicators: false) {
            
            if isMovable == true {
                
                USDZPostHelper(modelName: model, isMovable: true)
                    .frame(width: screenWidth / 1.2, height: screenHeight / 2.4)
                
            }
            
            else {
                
                USDZPostHelper(modelName: model, isMovable: false)
                    .frame(width: screenWidth / 1.2, height: screenHeight / 2.4)
                
            }
            
            Button(action: {
                
                isMovable.toggle()
                
                if isMovable {
                    
                    text = "Press to keep scrolling down"
                    
                }
                
                else {
                    
                    text = "Check out 3-D model"
                    
                }
                
            }, label: {
                
                Text(text)
                
            })
            
        }
        
        
    }
    
}

struct USDZPost_Previews: PreviewProvider {
    static var previews: some View {
        USDZPost(model: "toy_car.usdz")
            .environmentObject(TabBarViewModel())
    }
}
