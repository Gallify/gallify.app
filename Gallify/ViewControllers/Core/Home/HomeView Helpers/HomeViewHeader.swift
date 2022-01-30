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
            
            //height, width. //844, 390. iphone 12 pro
            Image("logo-full")
                .resizable()
                .frame(width: screenWidth/2.3, height: screenHeight/14)
                .offset(x: 15)
            
            Spacer()
            
            
            NavigationLink (
                            destination: CreateLandingView(screenWidth: screenWidth, screenHeight: screenHeight),
                            label: {
                                ZStack {
                                    
                                    RoundedRectangle(cornerRadius: 5)
                                        .foregroundColor(Color("Gallify-Pinkish"))
                                        .padding(.all, screenWidth / 55)
                                        .frame(width: screenWidth / 9, height: screenWidth / 9)
                                    
                                    Image(systemName: "plus")
                                        .resizable()
                                        .foregroundColor(Color.white)
                                        .frame(width: screenWidth / 25, height: screenWidth / 25)
                                        
                                    
                                }
                                .padding(.trailing, screenWidth / 37.5)
                            })
                            .buttonStyle(ThemeAnimationStyle())
                            .navigationBarBackButtonHidden(true)
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
            
        }
        .padding(.bottom, -screenHeight / 240) //270
        //.padding(.top, screenHeight / 178) //68
        
       // Divider()
        
    }
}

struct HomeViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewHeader(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width)
    }
}
