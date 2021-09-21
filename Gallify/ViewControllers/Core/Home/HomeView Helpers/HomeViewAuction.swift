//
//  HomeViewAuction.swift
//  Gallify
//
//  Created by Patron on 9/5/21.
//

import SwiftUI

struct HomeViewAuction: View {
    
    let screenWidth: CGFloat
    
    var body: some View {
        
        ZStack {
            
            Image(systemName: "squareshape.fill")
                .resizable()
                .foregroundColor(Color.red)
                .frame(width: screenWidth / 1.5, height: screenWidth / 1.5)
                .cornerRadius(screenWidth / 7.5)
            
            VStack {
                
                HStack {
                    
                    Image(systemName: "hammer.fill")
                        .resizable()
                        .frame(width: screenWidth / 7.5, height: screenWidth / 7.5)
                    
                    Image(systemName: "banknote.fill")
                        .resizable()
                        .foregroundColor(Color.green)
                        .frame(width: screenWidth / 7.5, height: screenWidth / 12.5)
                    
                }
                
                Text("Auctions")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
            }
                
        }
        
    }
    
}

struct HomeViewAuction_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewAuction(screenWidth: UIScreen.main.bounds.width)
    }
}
