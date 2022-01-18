//
//  ConnectButton.swift
//  Gallify
//
//  Created by Anshul on 1/17/22.
//

import SwiftUI

struct ConnectButton: View {
    
    @State var buttonClicked: Bool
    var buttonWidth: CGFloat
    var buttonHeight: CGFloat

    var body: some View {
        
        Button(action: {
            
            buttonClicked.toggle()
            
        }) {
            
            ZStack {
                
                RoundedRectangle(cornerRadius: buttonWidth / 8)
                    .foregroundColor(buttonClicked ? .white : .blue)
                    .frame(width: buttonWidth, height: buttonHeight)
                    .overlay(buttonClicked ? RoundedRectangle(cornerRadius: buttonWidth / 8).stroke(Color.gray, lineWidth: buttonWidth / 125) : RoundedRectangle(cornerRadius: buttonWidth / 8).stroke(Color.blue, lineWidth: buttonWidth / 50))
                
                Text(buttonClicked ? "Pending" : "Connect")
                    .font(.system(size: buttonWidth / 10, weight: .bold))
                    .foregroundColor(buttonClicked ? .black : .white)
                
            }
            
        }
        
    }
    
}

struct ConnectButton_Previews: PreviewProvider {
    static var previews: some View {
        ConnectButton(buttonClicked: true, buttonWidth: UIScreen.main.bounds.width / 3, buttonHeight: UIScreen.main.bounds.height / 26)
    }
}
