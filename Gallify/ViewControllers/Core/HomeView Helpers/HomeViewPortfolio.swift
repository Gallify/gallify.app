//
//  HomeViewPortfolio.swift
//  Gallify
//
//  Created by Patron on 9/5/21.
//

import SwiftUI

struct HomeViewPortfolio: View {
    
    let screenWidth: CGFloat
    
    var body: some View {
        
            Image("graph")
                .resizable()
                .frame(width: screenWidth / 1.2, height: screenWidth / 1.8)
            
    }
    
}

struct HomeViewPortfolio_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewPortfolio(screenWidth: UIScreen.main.bounds.width)
    }
}
