//
//  SwiftUIView.swift
//  Gallify
//
//  Created by Gianluca Profio on 10/23/21.
//

import SwiftUI

struct CollectionGenericView: View {
    
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        
        NavigationView {
            
            VStack {
                
                CollectionGenericHeader(screenHeight: screenHeight, screenWidth: screenWidth, presentationMode: _presentationMode)
                
                ScrollView (showsIndicators: false) {
                    
                    CollectionGenericRow(screenWidth: screenWidth, screenHeight: screenHeight)
                    
                }
                
                Spacer()
                
                CollectionGenericFooter(screenWidth: screenWidth, screenHeight: screenHeight)
                
            }
            
        }
        .navigationBarHidden(true)
        
    }
    
}

struct CollectionGenericView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionGenericView(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}

