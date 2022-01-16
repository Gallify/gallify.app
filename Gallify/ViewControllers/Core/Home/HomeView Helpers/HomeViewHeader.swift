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
        
        VStack {
            
            HStack {
                
                Logo(height: screenHeight / 12, width: screenWidth / 5.5)
                    .padding(.leading, screenWidth / 37.5)
                    .padding(.trailing, -screenWidth / 25)
                
                Text("Gallify")
                    .font(.system(size: screenWidth / 11))
                
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
            .padding(.bottom, -screenHeight / 270)
            .padding(.top, screenHeight / 68)
            
            Divider()
            
        }
        
    }
}

struct HomeViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewHeader(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width)
    }
}
