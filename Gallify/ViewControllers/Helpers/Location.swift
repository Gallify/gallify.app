//
//  Location.swift
//  Gallify
//
//  Created by Patron on 9/10/21.
//
import SwiftUI

struct Location: View {
    
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    
    var body: some View {
        
        ZStack {
            
            Image(systemName: "rectangle")
                .resizable()
                .foregroundColor(.pink)
                .frame(width: screenWidth / 3, height: screenHeight / 25)
                .cornerRadius(screenWidth / 25)
                
            HStack {
                
                Image(systemName: "circle.fill")
                    .resizable()
                    .foregroundColor(Color.green)
                    .frame(width: screenWidth / 30, height: screenHeight / 65)
            
                Text("Madison, WI")
                    .font(.system(size: screenWidth / 29))
                    .frame(width: screenWidth / 5)
                    .lineLimit(1)
            }
            .frame(width: screenWidth / 3.5, height: screenHeight / 25)

        }
        
    }
}

struct Location_Previews: PreviewProvider {
    static var previews: some View {
        Location(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width)
    }
}
