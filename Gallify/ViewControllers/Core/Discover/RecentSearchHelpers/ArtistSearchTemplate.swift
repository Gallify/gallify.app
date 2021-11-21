//
//  ArtistSearchTemplate.swift
//  Gallify
//
//  Created by Patron on 11/13/21.
//
import SwiftUI

struct ArtistSearchTemplate: View {
    
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    let image: Image
    let artistName: String
    
    var body: some View {
        
        HStack {
            
            CircleImage(image: image, length: screenWidth / 7.5, breadth: screenHeight / 16.25, overlayColor: .white, overlayRadius: screenHeight / 400, shadowRadius: screenHeight / 400)
            
            VStack(alignment: .leading) {
                
                Text(artistName)
                    .font(.system(size: screenWidth / 20, weight: .bold))
                    .foregroundColor(.black)
                
                Text("Artist")
                    .font(.system(size: screenWidth / 25))
                    .foregroundColor(.black)
                
            }
            .padding(.horizontal, screenWidth / 50)
            
            Spacer()
            
        }
        .padding(.horizontal, screenWidth / 25)
        .padding(.bottom, screenHeight / 80)
        
    }
    
}

struct ArtistSearchTemplate_Previews: PreviewProvider {
    static var previews: some View {
        ArtistSearchTemplate(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width, image: Image("umbagog"), artistName: "Adele")
    }
}
