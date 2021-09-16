//
//  Location.swift
//  Gallify
//
//  Created by Patron on 9/10/21.
//

import SwiftUI

struct Location: View {
    
    let screenWidth: CGFloat
    
    var body: some View {
        
        ZStack {
            
            Image(systemName: "rectangle")
                .resizable()
                .foregroundColor(.pink)
                .frame(width: screenWidth / 3, height: screenWidth / 12)
                .cornerRadius(screenWidth / 25)
                
            HStack {
                
                Image(systemName: "circle.fill")
                    .resizable()
                    .foregroundColor(Color.green)
                    .frame(width: screenWidth / 30, height: screenWidth / 30)
            
                Text("Madison, WI")
                    .font(.footnote)
                    .frame(width: screenWidth / 5)
                    .lineLimit(1)
                    .allowsTightening(true)
            }
            .frame(width: screenWidth / 3.5, height: screenWidth / 12)

        }
        
    }
}

struct Location_Previews: PreviewProvider {
    static var previews: some View {
        Location(screenWidth: UIScreen.main.bounds.width)
    }
}
