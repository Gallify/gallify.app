//
//  ErrorText.swift
//  Gallify
//
//  Created by Patron on 10/30/21.
//
import SwiftUI

struct ErrorText: View {
    
    let errorText: String
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    
    var body: some View {
        
        Text(errorText)
            .font(.system(size: screenWidth / 22))
            .foregroundColor(Color.white)
            .padding(.horizontal, screenWidth / 25)
            .padding(.vertical, screenHeight / 54)
            .background(Color.red)
            .cornerRadius(screenWidth / 15)
            .padding(.bottom, screenHeight / 65)
        
    }
    
}

struct ErrorText_Previews: PreviewProvider {
    static var previews: some View {
        ErrorText(errorText: "Hello World", screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width)
    }
}
