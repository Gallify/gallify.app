//
//  CollectionLikedFooter.swift
//  Gallify
//
//  Created by Gianluca Profio on 11/7/21.
//

import SwiftUI

struct CollectionLikedFooter: View {
    
    let screenWidth: CGFloat
    let screenHeight: CGFloat

    var body: some View {
        HStack {
            NavigationLink(
                destination: CollectionReelView(screenWidth: screenWidth,screenHeight: screenHeight),
                label: {
                    Image("leonardo")
                        .resizable()
                        .frame(width: screenWidth / 6, height: screenWidth / 6)
                        .cornerRadius(15)
                })
                .buttonStyle(ThemeAnimationStyle())
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .padding()
            
            Text("2 of 15")
                .font(.system(size: 19))
                .fontWeight(.bold)
                .padding(.trailing)
                .multilineTextAlignment(.center)
            
            Text("Leonardo Da Vinci")
                .fontWeight(.semibold)
                .font(.system(size: 19))
                .multilineTextAlignment(.center)
            
            Spacer()
        }
        .background(Color(red: 1.0, green: 0.55, blue: 1.0, opacity: 0.6))
        .cornerRadius(25)
        .padding()
    }
}


struct CollectionLikedFooter_Previews: PreviewProvider {
    static var previews: some View {
        CollectionLikedFooter(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}
