//
//  HomeViewHeader.swift
//  Gallify
//
//  Created by Anshul on 9/5/21.
//
import SwiftUI

struct HomeViewHeader: View {
    
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    
    var body: some View {
        
        HStack {
            
            Image("logo-full")
                .resizable()
                .frame(width: screenWidth / 2.25, height: screenHeight / 14)
                .offset(x: screenWidth / 25)
            
            Spacer()
            
            
            NavigationLink (destination: CreateLandingView(screenWidth: screenWidth, screenHeight: screenHeight),
                label: {
                
                    ZStack {
                                    
                        RoundedRectangle(cornerRadius: screenWidth / 50)
                            .foregroundColor(Color.pink)
                            .padding(.horizontal, screenWidth / 55)
                            .padding(.vertical, screenHeight / 120)
                            .frame(width: screenWidth / 7.5, height: screenHeight / 16.25)
                                    
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundColor(Color.white)
                            .frame(width: screenWidth / 25, height: screenHeight / 54)
                                        
                    }
                
            })
            .buttonStyle(ThemeAnimationStyle())
            .navigationBarHidden(true)
            .padding(.trailing, screenWidth / 37.5)
            
        }
        .padding(.top, screenHeight / 80)
        
    }
    
}

struct HomeViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewHeader(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width)
    }
}
