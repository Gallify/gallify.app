//
//  HomeViewAuction.swift
//  Gallify
//
//  Created by Patron on 9/5/21.
//

import SwiftUI

struct HomeViewAuction: View {
    var body: some View {
        
        ZStack {
            
            Image(systemName: "squareshape.fill")
                .resizable()
                .foregroundColor(Color.red)
                .frame(width: 250, height: 250)
                .cornerRadius(50)
            
            VStack {
                
                HStack {
                    
                    Image(systemName: "hammer.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                    
                    Image(systemName: "banknote.fill")
                        .resizable()
                        .foregroundColor(Color.green)
                        .frame(width: 50, height: 30)
                    
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
        HomeViewAuction()
    }
}
