//
//  HomeViewMadeForYou.swift
//  Gallify
//
//  Created by Patron on 9/5/21.
//

import SwiftUI

struct HomeViewMadeForYou: View {
    
    let screenWidth: CGFloat
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false)
        {
            
            HStack {
                
                VStack() {
                    
                    ZStack {
                        
                        Image(systemName: "squareshape.fill")
                            .resizable()
                            .foregroundColor(Color.black)
                            .frame(width: screenWidth / 2.8, height: screenWidth / 2.8)
                            .cornerRadius(screenWidth / 15)
                        
                        Image(systemName: "flame.fill")
                            .resizable()
                            .foregroundColor(Color.yellow)
                            .frame(width: screenWidth / 5.5, height: screenWidth / 5.5)
                        
                    }
                    
                    Text("Hottest Art")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(width: screenWidth / 2.8)
                        .lineLimit(1)
                    
                }
                .padding(.leading, screenWidth / 25)
                
                VStack() {
                    
                    Image("silversalmoncreek")
                        .resizable()
                        .frame(width: screenWidth / 2.8, height: screenWidth / 2.8)
                        .cornerRadius(screenWidth / 15)
                    
                    Text("Mountains")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(width: screenWidth / 2.8)
                        .lineLimit(1)
                    
                }
                .padding(.leading, screenWidth / 37.5)
                
                VStack() {
                    
                    Image("hiddenlake")
                        .resizable()
                        .frame(width: screenWidth / 2.8, height: screenWidth / 2.8)
                        .cornerRadius(screenWidth / 15)
                    
                    Text("Snowy Areas")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(width: screenWidth / 2.8)
                        .lineLimit(1)
                    
                }
                .padding(.trailing, screenWidth / 25)
                .padding(.leading, screenWidth / 37.5)
                
            }
            
        }
        .padding(.bottom, screenWidth / 25)
        
    }
    
}

struct HomeViewMadeForYou_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewMadeForYou(screenWidth: UIScreen.main.bounds.width)
    }
}
