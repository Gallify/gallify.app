

//
//  OvalTextField.swift
//  Gallify
//
//  Created by Anshul on 10/4/21.
//
import SwiftUI

struct OvalTextFieldStyle: TextFieldStyle {
    
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        
        configuration
            .padding(.horizontal, screenWidth / 28)
            .padding(.vertical, screenHeight / 60)
            .background(Color.white)
            .cornerRadius(screenWidth / 15)
            .overlay(RoundedRectangle(cornerRadius: screenWidth / 15).stroke(Color.black, lineWidth: 1))
        
    }
    
}

