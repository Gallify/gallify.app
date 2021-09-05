//
//  HomeViewMadeForYou.swift
//  Gallify
//
//  Created by Patron on 9/5/21.
//

import SwiftUI

struct HomeViewMadeForYou: View {
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false)
        {
            
            HStack {
                
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
                        
                        Image(systemName: "flame.fill")
                            .resizable()
                            .foregroundColor(Color.yellow)
                            .frame(width: 70, height: 70)
                            .padding()
                            .padding(.leading)
                        
                    }
                    
                    Text("Hottest Art")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.leading)
                    
                }
                
                VStack() {
                    
                    Image("silversalmoncreek")
                        .resizable()
                        .frame(width: 132, height: 132)
                        .cornerRadius(20)
                    
                    Text("Mountains")
                        .font(.title3)
                        .fontWeight(.semibold)
                        
                }
                .padding(.leading)
                
                VStack() {
                    
                    Image("hiddenlake")
                        .resizable()
                        .frame(width: 132, height: 132)
                        .cornerRadius(20)
                    
                    Text("Snowy Areas")
                        .font(.title3)
                        .fontWeight(.semibold)
                        
                }
                .padding(.horizontal)
                
                
            }
            
        }
        
    }
    
}

struct HomeViewMadeForYou_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewMadeForYou()
    }
}
