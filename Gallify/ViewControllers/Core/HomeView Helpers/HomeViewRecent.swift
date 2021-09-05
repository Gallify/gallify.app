//
//  HomeViewRecent.swift
//  Gallify
//
//  Created by Patron on 9/5/21.
//

import SwiftUI

struct HomeViewRecent: View {
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack{
                
                VStack() {
                        
                    ZStack {
                                
                        Image(systemName: "squareshape.fill")
                            .resizable()
                            .foregroundColor(Color.pink)
                            .frame(width:100, height:100)
                            .padding()
                            .background(Color.pink)
                            .cornerRadius(20)
                                
                        Image(systemName: "suit.heart.fill")
                            .resizable()
                            .foregroundColor(Color.white)
                            .frame(width: 70, height: 70)
                                
                    }
                    .padding(.leading)
                            
                    Text("Liked")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.leading)
                        
                }
                
                VStack() {
                    
                    ZStack {
                        
                        Image(systemName: "squareshape.fill")
                            .resizable()
                            .foregroundColor(Color.yellow)
                            .frame(width:100, height:100)
                            .padding()
                            .background(Color.yellow)
                            .cornerRadius(20)
                            .padding(.leading)
                        
                        VStack {
                            
                            Text("Friends")
                                .font(.title2)
                                .fontWeight(.bold)
                            Text("Feed")
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                        .padding(.leading)
                            
                    }
                    
                    Text("Friends Feed")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.leading)
                    
                }
                
                VStack() {
                    
                    Image("lakemcdonald")
                        .resizable()
                        .frame(width: 132, height: 132)
                        .cornerRadius(20)
                    
                    Text("Lakes")
                        .font(.title3)
                        .fontWeight(.semibold)
                        
                }
                .padding(.leading)
                
                VStack() {
                    
                    Image("charleyrivers")
                        .resizable()
                        .frame(width: 132, height: 132)
                        .cornerRadius(20)
                        .padding(.leading)
                    
                    Text("Surreal")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.leading)
                }
                
                VStack() {
                    
                    ZStack {
                        
                        Image(systemName: "squareshape.fill")
                            .resizable()
                            .foregroundColor(Color.black)
                            .frame(width:100, height:100)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(20)
                            .padding(.leading)
                        
                        VStack {
                            
                            Text("New Local")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            Text("Artists")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                        }
                        .padding(.leading)
                            
                    }
                    
                    Text("Local Artists")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.leading)
                    
                }
                .padding(.trailing)
                
            }
            
        }
        
    }
    
}

struct HomeViewRecent_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewRecent()
    }
}
