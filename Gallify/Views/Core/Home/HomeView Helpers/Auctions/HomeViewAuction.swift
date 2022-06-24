//
//  HomeViewAuction.swift
//  Gallify
//
//  Created by Anshul on 9/5/21.
//
import SwiftUI

struct HomeViewAuction: View {
    
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                AuctionTab(screenHeight: screenHeight, screenWidth: screenWidth, image: Image("rainbowlake"), daysLeft: 1, hoursLeft: 2, minutesLeft: 10, auctioneer: "Beeple Auction")
                
                Spacer()
                
                AuctionTab(screenHeight: screenHeight, screenWidth: screenWidth, image: Image("twinlake"), daysLeft: 2, hoursLeft: 10, minutesLeft: 35, auctioneer: "Sample Auction A")
                
            }
            .padding(.horizontal, screenWidth / 25)
            
            HStack {
                
                AuctionTab(screenHeight: screenHeight, screenWidth: screenWidth, image: Image("charleyrivers"), daysLeft: 0, hoursLeft: 0, minutesLeft: 20, auctioneer: "Sample Auction B")
                
                Spacer()
                
                AuctionTab(screenHeight: screenHeight, screenWidth: screenWidth, image: Image("stmarylake"), daysLeft: 0, hoursLeft: 18, minutesLeft: 50, auctioneer: "Sample Auction C")
                
            }
            .padding(.horizontal, screenWidth / 25)
            
        }
        
    }
    
}

struct HomeViewAuction_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewAuction(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width)
    }
}
