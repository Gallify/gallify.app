//
//  SwiftUIView.swift
//  Gallify
//
//  Created by Gianluca Profio on 10/23/21.
//

import SwiftUI

struct CollectionRecentActivityView: View {
    
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                CollectionRecentActivityHeader(screenWidth: screenWidth, screenHeight: screenHeight, presentationMode: _presentationMode)
                
                ScrollView (showsIndicators: false) {
                    
                    CollectionRecentActivityRow()
                    
                }
                
                Spacer()
                
                CollectionRecentActivityFooter()
                
            }
            
        }
        .navigationBarHidden(true)
        
    }
    
}

struct CollectionRecentActivityView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionRecentActivityView(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}

