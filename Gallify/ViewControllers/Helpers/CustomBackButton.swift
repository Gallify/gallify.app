//
//  CustomBackButton.swift
//  Gallify
//
//  Created by Patron on 10/22/21.
//

import SwiftUI

struct CustomBackButton: View {
    
    let width: CGFloat
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        Button(action: {
            presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    
                    Image(systemName: "lessthan")
                        .resizable()
                        .foregroundColor(Color.black)
                        .frame(width: width / 18, height: width / 18)
                    
                }
                
            }
        
    }
    
}

struct CustomBackButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomBackButton(width: UIScreen.main.bounds.width)
    }
}
