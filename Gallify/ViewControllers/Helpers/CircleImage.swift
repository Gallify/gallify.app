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
//  color: Color of the border of the desired image

import SwiftUI

struct CircleImage: View {
    var image: Image
    var length: CGFloat
    var breadth: CGFloat
    var color: Color

    var body: some View {
            
            image
                .resizable()
                .frame(width: length, height: breadth)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .overlay(Circle().stroke(color, lineWidth: 4))
                .shadow(radius: 3)
        
        }

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("logo"), length: 100, breadth: 100, color: .white)
        }
    
    }

}
