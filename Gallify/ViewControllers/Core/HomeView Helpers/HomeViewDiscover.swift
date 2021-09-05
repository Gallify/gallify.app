//
//  HomeViewDiscover.swift
//  Gallify
//
//  Created by Patron on 9/5/21.
//

import SwiftUI

struct HomeViewDiscover: View {
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack {
                
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
                
                VStack() {
                    
                    ZStack {
                        
                        Image(systemName: "squareshape.fill")
                            .resizable()
                            .foregroundColor(Color.black)
                            .frame(width:100, height:100)
                            .padding(.all)
                            .background(Color.black)
                            .cornerRadius(20)
                            .padding(.leading)
                        
                        Image(systemName: "arrow.up.circle.fill")
                            .resizable()
                            .foregroundColor(Color.blue)
                            .frame(width: 70, height: 70)
                            .padding()
                            .padding(.leading)
                        
                    }
                    
                    Text("Top Collectors")
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
                            .padding(.all)
                            .background(Color.black)
                            .cornerRadius(20)
                            .padding(.leading)
                        
                        Image(systemName: "star.fill")
                            .resizable()
                            .foregroundColor(Color.orange)
                            .frame(width: 70, height: 70)
                            .padding()
                            .padding(.leading)
                        
                    }
                    
                    Text("Popular Artists")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.leading)
                    
                }
                .padding(.trailing)
                
            }
            
        }
        
    }
    
}

struct HomeViewDiscover_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewDiscover()
    }
}
