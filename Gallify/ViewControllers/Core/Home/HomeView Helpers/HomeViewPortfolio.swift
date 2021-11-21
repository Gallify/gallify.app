//
//  HomeViewPortfolio.swift
//  Gallify
//
//  Created by Patron on 9/5/21.
//
import SwiftUI

struct HomeViewPortfolio: View {
    
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    
    var body: some View {
        
            Image("graph")
                .resizable()
                .frame(width: screenWidth / 1.2, height: screenHeight / 4)
            
    }
    
}

struct HomeViewPortfolio_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewPortfolio(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width)
    }
}
