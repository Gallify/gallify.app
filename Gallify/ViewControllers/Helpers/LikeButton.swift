//
//  LikeButton.swift
//  Gallify
//
//  Created by Anshul on 4/20/22.
//

import SwiftUI

struct LikeButton: View {
    
    var body: some View {
        
        Image(systemName: "heart.fill")
            .foregroundColor(Color("Gallify-Pink"))
        
    }
    
}

struct LikeButton_Previews: PreviewProvider {
    static var previews: some View {
        LikeButton()
    }
}
