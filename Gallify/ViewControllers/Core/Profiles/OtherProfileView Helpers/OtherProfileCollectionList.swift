//
//  OtherProfileCollectionList.swift
//  Gallify
//
//  Created by Anshul on 9/23/21.
//
import SwiftUI

struct OtherProfileCollectionList: View {
    
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    
    var body: some View {
        
        VStack {
            
            OtherProfileCollectionTab(screenHeight: screenHeight, screenWidth: screenWidth, image: Image("icybay"), collectionName: "My TopCollection1", artist: "jackbrown")
            
            OtherProfileCollectionTab(screenHeight: screenHeight, screenWidth: screenWidth, image: Image("stmarylake"), collectionName: "My TopCollection2", artist: "jackbrown")
            
            OtherProfileCollectionTab(screenHeight: screenHeight, screenWidth: screenWidth, image: Image("rainbowlake"), collectionName: "My TopCollection3", artist: "jackbrown")

            OtherProfileCollectionTab(screenHeight: screenHeight, screenWidth: screenWidth, image: Image("silversalmoncreek"), collectionName: "My TopCollection4", artist: "jackbrown")

            OtherProfileCollectionTab(screenHeight: screenHeight, screenWidth: screenWidth, image: Image("lakemcdonald"), collectionName: "My TopCollection5", artist: "jackbrown")

        }
        .padding(.vertical, screenHeight / 80)
        
    }
    
}

struct OtherProfileCollectionList_Previews: PreviewProvider {
    static var previews: some View {
        OtherProfileCollectionList(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width)
    }
}
