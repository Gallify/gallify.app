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
            
            CustomBackButton(buttonHeight: 25.45, buttonWidth: 15, image: Image(systemName: "chevron.left"), presentationMode: _presentationMode)
                  .offset(x: 25)
                  .font(Font.title.weight(.light))
            
            Spacer()
            
        }
        
    }
    
}

struct CreateLandingHeader_Previews: PreviewProvider {
    static var previews: some View {
        CreateLandingHeader(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}
