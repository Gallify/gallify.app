//
//  SelfProfileCollectionList.swift
//  Gallify
//
//  Created by Patron on 9/23/21.
//

import SwiftUI

struct SelfProfileCollectionList: View {
    
    let screenWidth: CGFloat
    
    var body: some View {
        
        VStack {
            
            SelfProfileCollectionTab(screenWidth: screenWidth, image: Image("charleyrivers"), collectionName: "My TopCollection1", artist: "jackbrown")
            
            SelfProfileCollectionTab(screenWidth: screenWidth, image: Image("umbagog"), collectionName: "My TopCollection2", artist: "jackbrown")
            
            SelfProfileCollectionTab(screenWidth: screenWidth, image: Image("twinlake"), collectionName: "My TopCollection3", artist: "jackbrown")
            
            SelfProfileCollectionTab(screenWidth: screenWidth, image: Image("hiddenlake"), collectionName: "My TopCollection4", artist: "jackbrown")
            
            SelfProfileCollectionTab(screenWidth: screenWidth, image: Image("turtlerock"), collectionName: "My TopCollection5", artist: "jackbrown")
            
        }
        .padding(.vertical, screenWidth / 37.5)
        
    }
}

struct SelfProfileCollectionList_Previews: PreviewProvider {
    static var previews: some View {
        SelfProfileCollectionList(screenWidth: UIScreen.main.bounds.width)
    }
}
