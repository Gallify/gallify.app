//
//  Logo.swift
//  GallifyLogin
//
//  Created by Jade Lee on 7/13/21.
//
import SwiftUI

struct Logo: View {
    
    let height: CGFloat
    let width: CGFloat
    
    var body: some View {
        
        Image("logo")
            .resizable()
            .frame(width: width, height: height)
        
    }
}

struct Logo_Previews: PreviewProvider {
    static var previews: some View {
        Logo(height: UIScreen.main.bounds.height / 3, width: UIScreen.main.bounds.width / 1.45)
    }
}
