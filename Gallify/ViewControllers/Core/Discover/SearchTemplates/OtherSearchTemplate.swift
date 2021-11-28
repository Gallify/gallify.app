//
//  OtherSearchTemplate.swift
//  Gallify
//
//  Created by Anshul on 11/13/21.
//
import SwiftUI

struct OtherSearchTemplate: View {
        
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    let image: Image
    let title: String
    let searchType: String
    let artistName: String
        
    var body: some View {
            
        HStack {
                
            image
                .resizable()
                .frame(width: screenWidth / 7.5, height: screenHeight / 16.25)
                
            VStack(alignment: .leading) {
                    
                Text(title)
                    .font(.system(size: screenWidth / 20, weight: .bold))
                    .foregroundColor(.black)
                    
                Text(searchType + ", by " + artistName)
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

struct OtherSearchTemplate_Previews: PreviewProvider {
    static var previews: some View {
        OtherSearchTemplate(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width, image: Image("umbagog"), title: "Starry Night", searchType: "Art", artistName: "Adele")
    }
}
