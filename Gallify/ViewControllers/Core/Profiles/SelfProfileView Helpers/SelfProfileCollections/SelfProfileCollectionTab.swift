//
//  SelfProfileCollectionTab.swift
//  Gallify
//
//  Created by Anshul on 9/23/21.
//
import SwiftUI

struct SelfProfileCollectionTab: View {
    
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    let image: Image
    let collectionName: String
    let artist: String
    
    var body: some View {
        
        HStack {
            
            image
                .resizable()
                .frame(width: screenWidth / 6, height: screenHeight / 13)
                .cornerRadius(screenWidth / 37.5)
            
            VStack(alignment: .leading) {
                
                Text(collectionName)
                    .font(.system(size: screenWidth / 18.5, weight: .bold))
                    .lineLimit(1)
                
                Text("by " + artist)
                    .font(.system(size: screenWidth / 22))
                    .lineLimit(1)
                
            }
            .padding(.leading, screenWidth / 37.5)
            
            Spacer()
            
        }
        .padding(.horizontal, screenWidth / 25)
        
    }
}

struct SelfProfileCollectionTab_Previews: PreviewProvider {
    static var previews: some View {
        SelfProfileCollectionTab(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width, image: Image("lakemcdonald"), collectionName: "My TopCollection", artist: "jackbrown")
    }
}
