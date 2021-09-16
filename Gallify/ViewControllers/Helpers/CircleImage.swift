//
//  CircleImage.swift
//  Gallify
//
//  Created by Anshul on 9/1/21.
//
//  This is a helper method to create a circle image from a given image
//  Parameters:
//  image: The image who you want to convert into a circle image
//  length: Frame width for the desired image
//  breadth: Frame height for the desired image
//  overlayColor: Color of the border of the desired image
//  overlayRadius: Radius of the border
//  shadowRadius: Radius of the shadow

import SwiftUI

struct CircleImage: View {
    var image: Image
    var length: CGFloat
    var breadth: CGFloat
    var overlayColor: Color
    var overlayRadius: CGFloat
    var shadowRadius: CGFloat

    var body: some View {
            
            image
                .resizable()
                .frame(width: length, height: breadth)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .overlay(Circle().stroke(overlayColor, lineWidth: overlayRadius))
                .shadow(radius: shadowRadius)
        
        }

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("logo"), length: 100, breadth: 100, overlayColor: .white, overlayRadius: 4, shadowRadius: 3)
        }
    
    }

}
