//
//  CustomBackButton.swift
//  Gallify
//
//  Created by Anshul on 10/22/21.
//
import SwiftUI

struct CustomBackButton: View {
    
    let buttonHeight: CGFloat
    let buttonWidth: CGFloat
    let image: Image
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        Button(action: {
            presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    
                    image
                        .resizable()
                        .foregroundColor(Color.black)
                        .frame(width: buttonWidth, height: buttonHeight)
                    
                }
                
            }
        
    }
    
}

struct CustomBackButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomBackButton(buttonHeight: UIScreen.main.bounds.height / 39, buttonWidth: UIScreen.main.bounds.width / 18, image: Image(systemName: "chevron.left.circle"))
    }
}
