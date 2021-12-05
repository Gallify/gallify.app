//
//  SelfProfileViewDetails.swift
//  Gallify
//
//  Created by Anshul on 9/13/21.
//
import SwiftUI

struct SelfProfileViewDetails: View {
    
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    
    var body: some View {
                
        VStack {
                
            HStack {
                    
                CircleImage(image: Image("cat"), length: screenWidth / 4, breadth: screenHeight / 8.65, overlayColor: Color.white, overlayRadius: screenWidth / 125, shadowRadius: screenWidth / 125)
                    
                VStack {
                        
                    HStack {
                            
                        VStack {
                                
                            Text("420K")
                                .font(.system(size: screenWidth / 17))
                                
                            Text("Followers")
                                .font(.system(size: screenWidth / 23.5))
                                .foregroundColor(Color.gray)
                                
                        }
                            
                        VStack {
                                
                            Text("956")
                                .font(.system(size: screenWidth / 17))
                                
                            Text("Following")
                                .font(.system(size: screenWidth / 23.5))
                                .foregroundColor(Color.gray)
                                
                        }
                            
                        VStack {
                                
                            Text("30B")
                                .font(.system(size: screenWidth / 17))
                                
                            Text("Likes")
                                .font(.system(size: screenWidth / 23.5))
                                .foregroundColor(Color.gray)
                                
                        }

                    }
                        
                    HStack {
                            
                        VStack {
                                                            
                            Text("7")
                                .font(.system(size: screenWidth / 17))
                                
                            Text("Rarity")
                                .font(.system(size: screenWidth / 23.5))
                                .foregroundColor(Color.gray)
                                
                        }
                            
                        VStack {
                                
                            Text("1.3B")
                                .font(.system(size: screenWidth / 17))
                                
                            Text("Views")
                                .font(.system(size: screenWidth / 23.5))
                                .foregroundColor(Color.gray)
                                
                        }

                    }
                    .padding(.top, screenHeight / 80)
                        
                }
                .frame(width: screenWidth / 1.75)
                    
            }
            .padding(.top, screenHeight / 54)
                
            HStack {
                    
                Text("Meow!")
                    .font(.system(size: screenWidth / 22, weight: .medium))
                    
                Spacer()
                    
            }
            .padding(.leading, screenWidth / 15)
                
            HStack {
                    
                Text("Making the world a better place with my existence.")
                    .font(.system(size: screenWidth / 23.5, weight: .light))
                
                Spacer()
                
            }
            .padding(.horizontal, screenWidth / 15)
                
        }
                
    }
    
}

struct SelfProfileViewDetails_Previews: PreviewProvider {
    static var previews: some View {
        SelfProfileViewDetails(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width)
    }
}
