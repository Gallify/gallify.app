//
//  SelfProfileCollectionList.swift
//  Gallify
//
//  Created by Anshul on 9/23/21.
//
import SwiftUI

struct SelfProfileCollectionList: View {
    
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    
    var body: some View {
        
        VStack {
            
            SelfProfileCollectionTab(screenHeight: screenHeight, screenWidth: screenWidth, image: Image("charleyrivers"), collectionName: "My TopCollection1", artist: "jackbrown")
            
            SelfProfileCollectionTab(screenHeight: screenHeight, screenWidth: screenWidth, image: Image("umbagog"), collectionName: "My TopCollection2", artist: "jackbrown")
            
            SelfProfileCollectionTab(screenHeight: screenHeight, screenWidth: screenWidth, image: Image("twinlake"), collectionName: "My TopCollection3", artist: "jackbrown")
            
            SelfProfileCollectionTab(screenHeight: screenHeight, screenWidth: screenWidth, image: Image("hiddenlake"), collectionName: "My TopCollection4", artist: "jackbrown")
            
            SelfProfileCollectionTab(screenHeight: screenHeight, screenWidth: screenWidth, image: Image("turtlerock"), collectionName: "My TopCollection5", artist: "jackbrown")
            
        }
        .padding(.vertical, screenHeight / 80)
        
    }
}

struct SelfProfileCollectionList_Previews: PreviewProvider {
    static var previews: some View {
        SelfProfileCollectionList(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width)
    }
}
