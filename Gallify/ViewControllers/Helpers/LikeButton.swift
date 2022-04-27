//
//  LikeButton.swift
//  Gallify
//
//  Created by Anshul on 4/20/22.
//

import SwiftUI

struct LikeButton: View {
    
    var imageHeight: CGFloat
    var imageWidth: CGFloat
    var liked: Bool
    
    var body: some View {
        
        /*if liked {
            
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: imageWidth, height: imageHeight)
                .foregroundColor(Color("Gallify-Pink"))
            
        }
        
        else {
            
            Image(systemName: "heart")
                .resizable()
                .frame(width: imageWidth, height: imageHeight)
                .foregroundColor(.black)
            
        }*/
        
        Image(systemName: liked ? "heart.fill" : "heart")
            .resizable()
            .frame(width: imageWidth, height: imageHeight)
            .foregroundColor(liked ? Color("Gallify-Pink") : Color.black)
        
    }
    
}

struct LikeButton_Previews: PreviewProvider {
    static var previews: some View {
        LikeButton(imageHeight: UIScreen.main.bounds.height / 40, imageWidth: UIScreen.main.bounds.width / 18.5, liked: true)
    }
}
