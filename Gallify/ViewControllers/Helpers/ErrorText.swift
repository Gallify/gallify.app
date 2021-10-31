//
//  ErrorText.swift
//  Gallify
//
//  Created by Patron on 10/30/21.
//

import SwiftUI

struct ErrorText: View {
    
    let text: String
    let width: CGFloat
    
    var body: some View {
        
        Text(text)
            .foregroundColor(Color.white)
            .multilineTextAlignment(.center)
            .padding(width / 25)
            .background(Color.red)
            .cornerRadius(width / 15)
            .padding(.bottom, width / 30)
        
    }
    
}

struct ErrorText_Previews: PreviewProvider {
    static var previews: some View {
        ErrorText(text: "Hello World!!", width: UIScreen.main.bounds.width)
    }
}
