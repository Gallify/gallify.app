//
//  HomeViewRecent.swift
//  Gallify
//
//  Created by Patron on 9/5/21.
//
import SwiftUI

struct HomeViewRecent: View {
    
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack {
                
                VStack() {
                                        
                                    NavigationLink (
                                        destination: CollectionLikedView(screenWidth: screenWidth, screenHeight: screenHeight),
                                        label: {
                                            ZStack {
                                                        
                                                Image(systemName: "squareshape.fill")
                                                    .resizable()
                                                    .frame(width: screenWidth / 2.8, height: screenWidth / 2.8)
                                                    .foregroundColor(.pink)
                                                    .cornerRadius(screenWidth / 15)
                                                        
                                                Image(systemName: "suit.heart.fill")
                                                    .resizable()
                                                    .foregroundColor(Color.white)
                                                    .frame(width: screenWidth / 5.5, height: screenWidth / 5.5)
                                                        
                                            }
                                        }
                                    )
                                    .buttonStyle(ThemeAnimationStyle())
                                    .navigationBarBackButtonHidden(true)
                                    .navigationBarTitle("")
                                    .navigationBarHidden(true)
                                    
                                            
                                    Text("Liked")
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                        .frame(width: screenWidth / 2.8)
                                        .lineLimit(1)
                                        .allowsTightening(true)
                                }
                                .padding(.leading, screenWidth / 25)
                
                VStack {
                    
                    ZStack {
                        
                        Image(systemName: "squareshape.fill")
                            .resizable()
                            .foregroundColor(Color.yellow)
                            .frame(width: screenWidth / 2.8, height: screenHeight / 6)
                            .cornerRadius(screenWidth / 15)
                        
                        VStack {
                            
                            Text("Friends")
                                .font(.system(size: screenWidth / 17, weight: .bold))
                            
                            Text("Feed")
                                .font(.system(size: screenWidth / 17, weight: .bold))
                        }
                            
                    }
                    
                    Text("Friends Feed")
                        .font(.system(size: screenWidth / 18.5, weight: .semibold))
                        .frame(width: screenWidth / 2.8)
                        .lineLimit(1)
                    
                }
                .padding(.leading, screenWidth / 37.5)
                
                VStack() {
                                    
                    NavigationLink (
                        destination: CollectionRecentActivityView(screenWidth: screenWidth, screenHeight: screenHeight),
                        label: {
                            ZStack {
                                        
                                Image(systemName: "squareshape.fill")
                                    .resizable()
                                    .foregroundColor(Color.blue)
                                    .frame(width: screenWidth / 2.8, height: screenWidth / 2.8)
                                    .cornerRadius(screenWidth / 15)
                                VStack {
                                    Image(systemName: "stopwatch.fill")
                                        .resizable()
                                        .frame(width: screenWidth / 5.5, height: screenWidth / 5.5)
                                }
                                .foregroundColor(.white)
                            }
                        }
                    )
                    
                    Text("Recent Activity")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(width: screenWidth / 2.8)
                        .lineLimit(1)
                        .allowsTightening(true)
                }
                .padding(.leading, screenWidth / 37.5)
                
                VStack {
                    
                    Image("lakemcdonald")
                        .resizable()
                        .frame(width: screenWidth / 2.8, height: screenHeight / 6)
                        .cornerRadius(screenWidth / 15)
                    
                    Text("Lakes")
                        .font(.system(size: screenWidth / 18.5, weight: .semibold))
                        .frame(width: screenWidth / 2.8)
                        .lineLimit(1)
                    
                }
                .padding(.leading, screenWidth / 37.5)
                
                VStack {
                    
                    Image("charleyrivers")
                        .resizable()
                        .frame(width: screenWidth / 2.8, height: screenHeight / 6)
                        .cornerRadius(screenWidth / 15)
                    
                    Text("Surreal")
                        .font(.system(size: screenWidth / 18.5, weight: .semibold))
                        .frame(width: screenWidth / 2.8)
                        .lineLimit(1)
                    
                }
                .padding(.leading, screenWidth / 37.5)
                
                VStack {
                    
                    ZStack {
                        
                        Image(systemName: "squareshape.fill")
                            .resizable()
                            .foregroundColor(Color.black)
                            .frame(width: screenWidth / 2.8, height: screenHeight / 6)
                            .cornerRadius(screenWidth / 15)
                        
                        VStack {
                            
                            Text("New Local")
                                .font(.system(size: screenWidth / 17, weight: .bold))
                                .foregroundColor(Color.white)
                            
                            Text("Artists")
                                .font(.system(size: screenWidth / 17, weight: .bold))
                                .foregroundColor(Color.white)
                        }
                            
                    }
                    
                    Text("Local Artists")
                        .font(.system(size: screenWidth / 18.5, weight: .semibold))
                        .frame(width: screenWidth / 2.8)
                        .lineLimit(1)
                    
                }
                .padding(.trailing, screenWidth / 25)
                .padding(.leading, screenWidth / 37.5)
                
            }
            
        }
        
    }
    
}

struct HomeViewRecent_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewRecent(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width)
    }
}
