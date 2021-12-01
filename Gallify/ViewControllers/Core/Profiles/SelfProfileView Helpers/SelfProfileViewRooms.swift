//
//  SelfProfileViewRooms.swift
//  Gallify
//
//  Created by Anshul on 9/16/21.
//
import SwiftUI

struct SelfProfileViewRooms: View {
    
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    
    var body: some View {
        
        HStack {
            
            ZStack {
                
                RoundedRectangle(cornerRadius: screenWidth / 15)
                    .fill(Color.white)
                    .frame(width: screenWidth / 2.5, height: screenHeight / 5.4)
                    .overlay(RoundedRectangle(cornerRadius: screenWidth / 15).stroke(Color.black, lineWidth: screenWidth / 200))
                    .padding(.horizontal, screenWidth / 37.5)
                    .padding(.vertical, screenHeight / 80)

                VStack {
                    
                    Image(systemName: "cube.fill")
                        .resizable()
                        .frame(width: screenWidth / 6, height: screenHeight / 13)
                    
                    Text("Featured")
                        .font(.system(size: screenWidth / 18.5, weight: .bold))
                    
                    Text("Room")
                        .font(.system(size: screenWidth / 18.5, weight: .bold))
                    
                }
                
            }
            
            ZStack {
                
                RoundedRectangle(cornerRadius: screenWidth / 15)
                    .fill(Color.black)
                    .frame(width: screenWidth / 2.5, height: screenHeight / 5.4)
                    .padding(.horizontal, screenWidth / 37.5)
                    .padding(.vertical, screenHeight / 80)

                VStack {
                    
                    HStack {
                        
                        Image(systemName: "tortoise.fill")
                                .resizable()
                                .frame(width: screenWidth / 6, height: screenHeight / 19.5)
                                .foregroundColor(.green)
                        
                        Image(systemName: "hare.fill")
                            .resizable()
                            .frame(width: screenWidth / 9, height: screenHeight / 19.5)
                            .foregroundColor(.white)
                        
                    }
                    .padding(.vertical, screenHeight / 80)
                    
                    Text("Jungle")
                        .font(.system(size: screenWidth / 18.5, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("Safari")
                        .font(.system(size: screenWidth / 18.5, weight: .bold))
                        .foregroundColor(.white)
                    
                }
                
            }
            
        }
        .padding(.vertical, screenHeight / 80)
        
    }
    
}

struct SelfProfileViewRooms_Previews: PreviewProvider {
    static var previews: some View {
        SelfProfileViewRooms(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width)
    }
}
