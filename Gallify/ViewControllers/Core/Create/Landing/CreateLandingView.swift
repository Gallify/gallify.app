//
//  CreateLandingView.swift
//  Gallify
//
//  Created by Gianluca Profio on 10/31/21.
//

import SwiftUI

struct CreateLandingView: View {
    
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        
        VStack {
            
            CreateLandingHeader(screenWidth: screenWidth, screenHeight: screenHeight, presentationMode: _presentationMode)
            
            ScrollView{
                Spacer()
            
                
                CreateLandingOptions(screenWidth: screenWidth, screenHeight: screenHeight)
            
                Spacer()
            }
            
        }
        .navigationBarHidden(true)
        
    }
    
}

struct CreateLandingView_Previews: PreviewProvider {
    static var previews: some View {
        CreateLandingView(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}
