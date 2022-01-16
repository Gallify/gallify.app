//
//  CreateLandingHeader.swift
//  Gallify
//
//  Created by Gianluca Profio on 10/31/21.
//

import SwiftUI

struct CreateLandingHeader: View {
    
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        HStack {
            
            CustomBackButton(buttonHeight: screenHeight / 39, buttonWidth: screenWidth / 18, image: Image(systemName: "lessthan"), presentationMode: _presentationMode)
                .padding(.horizontal, screenWidth / 25)
                .padding(.vertical, screenHeight / 100)
            
            Spacer()
            
        }
        
    }
    
}

struct CreateLandingHeader_Previews: PreviewProvider {
    static var previews: some View {
        CreateLandingHeader(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}
