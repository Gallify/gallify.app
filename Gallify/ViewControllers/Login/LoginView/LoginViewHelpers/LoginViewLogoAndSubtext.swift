//
//  MainLogoAndSubtext.swift
//  Gallify
//
//  Created by Patron on 10/1/21.
//

import SwiftUI

struct LoginViewLogoAndSubtext: View {
    
    let width: CGFloat
    
    var body: some View {
        
        VStack {
            
            Logo()
                .padding(.top, width / 7.5)
            
            Text("Gallify")
                .font(.system(size: 40))
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                .padding(.top, -width / 25)
            
            HStack{
                Text("Changing the Art World Forever.")
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color.gray)
            }
            
        }
        
    }
    
}

struct MainLogoAndSubtext_Previews: PreviewProvider {
    static var previews: some View {
        LoginViewLogoAndSubtext(width: UIScreen.main.bounds.width)
    }
}
