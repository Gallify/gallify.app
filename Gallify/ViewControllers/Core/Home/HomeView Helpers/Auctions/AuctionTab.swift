//
//  AuctionTab.swift
//  Gallify
//
//  Created by Patron on 9/21/21.
//

import SwiftUI

struct AuctionTab: View {
    
    let screenWidth: CGFloat
    let image: Image
    let daysLeft: Int
    let hoursLeft: Int
    let minutesLeft: Int
    let auctioneer: String
        
    var body: some View {
        
        
        let daysTime = daysLeft > 0 ? String(daysLeft) + "d " : ""
        let hoursTime = hoursLeft > 0 ? String(hoursLeft) + "h " : ""
        let minutesTime = minutesLeft > 0 ? String(minutesLeft) + "m" : ""
        let Time = (daysTime == "" && hoursTime == "") ? "< " + minutesTime : daysTime + hoursTime + minutesTime
        
        ZStack {
                
            RoundedRectangle(cornerRadius: screenWidth / 30)
                .foregroundColor(Color.gray)
                .frame(width: screenWidth / 2.4, height: screenWidth / 7.5)
                
            HStack {
                    
                image
                    .resizable()
                    .frame(width: screenWidth / 7.5, height: screenWidth / 7.5)
                    .cornerRadius(screenWidth / 30)
                
                Spacer()
                
                VStack {
                    
                    Text(Time)
                        .font(.footnote)
                        .foregroundColor(Time.prefix(1) == "<" ? Color.red : Color.white)
                        .lineLimit(1)
                    
                    Text(auctioneer)
                        .font(.footnote)
                        .foregroundColor(Color.white)
                        .lineLimit(1)
                    
                }
                
                Spacer()
                    
            }
            .frame(width: screenWidth / 2.4, height: screenWidth / 7.5)
                    
        }
                    
    }
}

struct AuctionTab_Previews: PreviewProvider {
    static var previews: some View {
        AuctionTab(screenWidth: UIScreen.main.bounds.width, image: Image("rainbowlake"), daysLeft: 1, hoursLeft: 2, minutesLeft: 10, auctioneer: "Beeple Auction")
    }
}
