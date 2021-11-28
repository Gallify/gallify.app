//
//  MainLogoAndSubtext.swift
//  Gallify
//
//  Created by Anshul on 10/1/21.
//
import SwiftUI

struct LoginViewLogoAndSubtext: View {
    
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    
    var body: some View {
        
        VStack {
            
            Logo(height: screenHeight / 3, width: screenWidth / 1.45)
                .padding(.top, screenHeight / 16.25)
            
            Text("Gallify")
                .font(.system(size: screenWidth / 9, weight: .bold))
                .foregroundColor(Color.black)
                .padding(.top, -screenHeight / 54)
            
            HStack{
                Text("Changing the Art World Forever.")
                    .font(.system(size: screenWidth / 21))
                    .foregroundColor(Color.gray)
                
            }
            
        }
        
    }
    
}

struct MainLogoAndSubtext_Previews: PreviewProvider {
    static var previews: some View {
        LoginViewLogoAndSubtext(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width)
    }
}
