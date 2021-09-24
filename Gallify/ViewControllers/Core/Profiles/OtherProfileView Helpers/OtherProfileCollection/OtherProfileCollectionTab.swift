//
//  OtherProfileCollectionTab.swift
//  Gallify
//
//  Created by Patron on 9/23/21.
//

import SwiftUI

struct OtherProfileCollectionTab: View {
    
    let screenWidth: CGFloat
    let image: Image
    let collectionName: String
    let artist: String
    
    var body: some View {
        
        HStack {
            
            image
                .resizable()
                .frame(width: screenWidth / 6, height: screenWidth / 6)
                .cornerRadius(screenWidth / 37.5)
            
            VStack(alignment: .leading){
                
                Text(collectionName)
                    .font(.title3)
                    .fontWeight(.bold)
                    .lineLimit(1)
                
                Text("by " + artist)
                    .lineLimit(1)
                
            }
            .padding(.leading, screenWidth / 37.5)
            
            Spacer()
            
        }
        .padding(.horizontal, screenWidth / 25)
        
    }
}

struct OtherProfileCollectionTab_Previews: PreviewProvider {
    static var previews: some View {
        OtherProfileCollectionTab(screenWidth: UIScreen.main.bounds.width, image: Image("lakemcdonald"), collectionName: "My TopCollection", artist: "jackbrown")
    }
}
