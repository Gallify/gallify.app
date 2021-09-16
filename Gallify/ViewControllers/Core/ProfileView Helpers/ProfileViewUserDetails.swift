//
//  ProfileViewUserDetails.swift
//  Gallify
//
//  Created by Patron on 9/13/21.
//

import SwiftUI

struct ProfileViewUserDetails: View {
    
    let screenWidth: CGFloat
    
    var body: some View {
        
        ZStack() {
            
            RoundedRectangle(cornerRadius: screenWidth / 7.5)
                .fill(Color.white)
                .frame(width: screenWidth / 1.1, height: screenWidth / 1.5)
                .overlay(RoundedRectangle(cornerRadius: screenWidth / 7.5).stroke(Color.black, lineWidth: screenWidth / 200))
                .shadow(radius: screenWidth / 125)
                
            VStack() {
                
                HStack() {
                    
                    CircleImage(image: Image("chincoteague"), length: screenWidth / 4, breadth: screenWidth / 4, overlayColor: Color.white, overlayRadius: screenWidth / 125, shadowRadius: screenWidth / 125)
                    
                    VStack {
                        
                        HStack {
                            
                            VStack {
                                
                                Text("420K")
                                    .font(.title2)
                                
                                Text("Followers")
                                    .font(.callout)
                                    .foregroundColor(Color.gray)
                                
                            }
                            
                            VStack {
                                
                                Text("956")
                                    .font(.title2)
                                
                                Text("Following")
                                    .font(.callout)
                                    .foregroundColor(Color.gray)
                                
                            }
                            
                            VStack {
                                
                                Text("30B")
                                    .font(.title2)
                                
                                Text("Likes")
                                    .font(.callout)
                                    .foregroundColor(Color.gray)
                                
                            }

                        }
                        
                        HStack {
                            
                            VStack {
                                                            
                                Text("7")
                                    .font(.title2)
                                
                                Text("Rarity")
                                    .font(.callout)
                                    .foregroundColor(Color.gray)
                                
                            }
                            
                            VStack {
                                
                                Text("1.3B")
                                    .font(.title2)
                                
                                Text("Views")
                                    .font(.callout)
                                    .foregroundColor(Color.gray)
                                
                            }

                        }
                        .padding(.top, screenWidth / 37.5)
                        
                    }
                    .frame(width: screenWidth / 1.75)
                    
                }
                
                HStack {
                    
                    Text("Jack F. Brown")
                    
                    Spacer()
                    
                }
                
                HStack {
                    
                    Text("Hi, I am Jack Brown and I commission art.")
                        .font(.callout)
                        .foregroundColor(Color.gray)
                    
                    Spacer()
                
                    
                }
                
                
                
            }
            .frame(width: screenWidth / 1.16)
                
        }
    }
}

struct ProfileViewUserDetails_Previews: PreviewProvider {
    static var previews: some View {
        ProfileViewUserDetails(screenWidth: UIScreen.main.bounds.width)
    }
}
