//
//  OtherProfileViewHeader.swift
//  Gallify
//
//  Created by Patron on 9/13/21.
//

import SwiftUI

struct OtherProfileViewHeader: View {
    
    let screenWidth: CGFloat
    
    var body: some View {
        
        HStack {
            
            NavigationLink(
                destination: TabBarView(),
                label: {
                    
                    Image(systemName: "lessthan")
                        .resizable()
                        .foregroundColor(Color.black)
                        .frame(width: screenWidth / 15, height: screenWidth / 15)
                        .padding(.leading, screenWidth / 25)
                    
                })
            
            Spacer()
            
            Text("jack_brown2")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
            
            Spacer()
                    
                Image(systemName: "list.bullet")
                    .resizable()
                    .frame(width: screenWidth / 15, height: screenWidth / 15)
                    .padding(.trailing, screenWidth / 25)
                    
        }
        
    }
}

struct OtherProfileViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        OtherProfileViewHeader(screenWidth: UIScreen.main.bounds.width)
    }
}
