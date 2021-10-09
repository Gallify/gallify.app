//
//  OvalTextField.swift
//  Gallify
//
//  Created by Patron on 10/4/21.
//

import SwiftUI

struct OvalTextFieldStyle: TextFieldStyle {
    
    let screenWidth: CGFloat
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.all)
            .background(Color.white)
            .cornerRadius(screenWidth / 15)
            .overlay(RoundedRectangle(cornerRadius: screenWidth / 15).stroke(Color.black, lineWidth: 1))
        
    }
}


