//
//  HomeViewMadeForYou.swift
//  Gallify
//
//  Created by Anshul on 9/5/21.
//
import SwiftUI

struct HomeViewMadeForYou: View {
    
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false)
        {
            
            HStack {
                
                VStack {
                    
                    ZStack {
                        
                        Image(systemName: "squareshape.fill")
                            .resizable()
                            .foregroundColor(Color.black)
                            .frame(width: screenWidth / 2.8, height: screenHeight / 6)
                            .cornerRadius(screenWidth / 15)
                        
                        Image(systemName: "flame.fill")
                            .resizable()
                            .foregroundColor(Color.yellow)
                            .frame(width: screenWidth / 5.5, height: screenHeight / 12)
                        
                    }
                    
                    Text("Hottest Art")
                        .font(.system(size: screenWidth / 18.5, weight: .semibold))
                        .frame(width: screenWidth / 2.8)
                        .lineLimit(1)
                    
                }
                .padding(.leading, screenWidth / 25)
                
                VStack() {
                    
                    Image("silversalmoncreek")
                        .resizable()
                        .frame(width: screenWidth / 2.8, height: screenHeight / 6)
                        .cornerRadius(screenWidth / 15)
                    
                    Text("Mountains")
                        .font(.system(size: screenWidth / 18.5, weight: .semibold))
                        .frame(width: screenWidth / 2.8)
                        .lineLimit(1)
                    
                }
                .padding(.leading, screenWidth / 37.5)
                
                VStack {
                    
                    Image("hiddenlake")
                        .resizable()
                        .frame(width: screenWidth / 2.8, height: screenHeight / 6)
                        .cornerRadius(screenWidth / 15)
                    
                    Text("Snowy Areas")
                        .font(.system(size: screenWidth / 18.5, weight: .semibold))
                        .frame(width: screenWidth / 2.8)
                        .lineLimit(1)
                    
                }
                .padding(.trailing, screenWidth / 25)
                .padding(.leading, screenWidth / 37.5)
                
            }
            
        }
        .padding(.bottom, screenHeight / 54)
        
    }
    
}

struct HomeViewMadeForYou_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewMadeForYou(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width)
    }
}
