//
//  CollectionLikedFooter.swift
//  Gallify
//
//  Created by Gianluca Profio on 11/7/21.
//

import SwiftUI

struct CollectionLikedFooter: View {
    
    @EnvironmentObject var viewModel: TabBarViewModel

    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        HStack {
            
            NavigationLink(
                destination: CollectionReelView(),
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
            
            NavigationLink(
                destination: CollectionReelView(),
                label: {
                    Image(systemName: "chevron.down.circle")
                        .font(.system(size: 25))
                })
                .buttonStyle(ThemeAnimationStyle())
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .padding()
        }
        .background(Color(red: 0.827, green: 0.827, blue: 0.827))
        .cornerRadius(25)
        .padding()
    }
}
