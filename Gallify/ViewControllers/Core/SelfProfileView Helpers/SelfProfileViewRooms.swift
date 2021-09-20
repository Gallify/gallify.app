//
//  SelfProfileViewRooms.swift
//  Gallify
//
//  Created by Patron on 9/16/21.
//

import SwiftUI

struct SelfProfileViewRooms: View {
    
    let screenWidth: CGFloat
    
    var body: some View {
        
        HStack {
            
            ZStack {
                
                RoundedRectangle(cornerRadius: screenWidth / 15)
                    .fill(Color.white)
                    .frame(width: screenWidth / 2.5, height: screenWidth / 2.5)
                    .overlay(RoundedRectangle(cornerRadius: screenWidth / 15).stroke(Color.black, lineWidth: screenWidth / 200))
                    .padding(screenWidth / 37.5)

                VStack {
                    
                    Image(systemName: "cube.fill")
                        .resizable()
                        .frame(width: screenWidth / 6, height: screenWidth / 6)
                    
                    Text("Featured")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Text("Room")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                }
                
            }
            
            ZStack {
                
                RoundedRectangle(cornerRadius: screenWidth / 15)
                    .fill(Color.black)
                    .frame(width: screenWidth / 2.5, height: screenWidth / 2.5)
                    .padding(screenWidth / 37.5)

                VStack {
                    
                    HStack {
                        
                        Image(systemName: "tortoise.fill")
                                .resizable()
                            .frame(width: screenWidth / 6, height: screenWidth / 9)
                                .foregroundColor(.green)
                        
                        Image(systemName: "hare.fill")
                            .resizable()
                            .frame(width: screenWidth / 9, height: screenWidth / 9)
                            .foregroundColor(.white)
                        
                    }.padding(.vertical, screenWidth / 36)
                    
                    Text("Jungle")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Safari")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                }
                
            }
            
        }
        
    }
}

struct SelfProfileViewRooms_Previews: PreviewProvider {
    static var previews: some View {
        SelfProfileViewRooms(screenWidth: UIScreen.main.bounds.width)
    }
}
