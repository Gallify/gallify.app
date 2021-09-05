//
//  HomeViewStories.swift
//  Gallify
//
//  Created by Patron on 9/5/21.
//

import SwiftUI

struct HomeViewStories: View {
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack {
                
                VStack {
                    
                    CircleImage(image: Image("turtlerock"), length: 90, breadth: 90, color: .purple)
                        .padding(5.0)
                    
                    Text("LoggedUser")
                        .foregroundColor(Color.gray)
                        .offset(y: -5)
                }
                .padding(.leading)
                
                VStack {
                    
                    CircleImage(image: Image("twinlake"), length: 90, breadth: 90, color: .white)
                        .padding(5.0)
                    
                    Text("Artist1")
                        .foregroundColor(Color.gray)
                        .offset(y: -5)
                }
                
                VStack {
                    
                    CircleImage(image: Image("icybay"), length: 90, breadth: 90, color: .white)
                        .padding(5.0)
                    
                    Text("Artist2")
                        .foregroundColor(Color.gray)
                        .offset(y: -5)
                }
                
                VStack {
                    
                    CircleImage(image: Image("chincoteague"), length: 90, breadth: 90, color: .white)
                        .padding(5.0)
                    
                    Text("Artist3")
                        .foregroundColor(Color.gray)
                        .offset(y: -5)
                }
                
                VStack {
                    
                    CircleImage(image: Image("umbagog"), length: 90, breadth: 90, color: .white)
                        .padding(5.0)
                    
                    Text("Artist4")
                        .foregroundColor(Color.gray)
                        .offset(y: -5)
                }
                .padding(.trailing)
            }
            
        }
        
    }
    
}

struct HomeViewStories_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewStories()
    }
}
