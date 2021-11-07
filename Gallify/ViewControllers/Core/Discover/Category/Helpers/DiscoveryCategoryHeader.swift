//
//  SignInViewHeader.swift
//  Gallify
//
//  Created by Patron on 10/1/21.
//

import SwiftUI

struct DiscoveryCategoryHeader: View {
    
    let screenWidth: CGFloat
    
    var body: some View {
            
        VStack {
            
            HStack {
                
                NavigationLink(
                    destination: TabBarView(),
                    label: {
                        
                        Image(systemName: "lessthan")
                            .resizable()
                            .foregroundColor(Color.black)
                            .frame(width: screenWidth / 15, height: screenWidth / 15)
                            .padding(.leading, screenWidth / 25)
                        
                    })
                    .buttonStyle(ThemeAnimationStyle())
                    .navigationBarBackButtonHidden(true)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                
                Spacer()
                
            }
            
            HStack {
                        
                Text("Sample Category")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.top)
                        
                Spacer()
                        
            }
            .padding(.leading, screenWidth / 12)
            .padding(.bottom, screenWidth / 15)
            
        }
            
    }
    
}

struct DiscoveryCategoryHeader_Previews: PreviewProvider {
    static var previews: some View {
        DiscoveryCategoryHeader(screenWidth: UIScreen.main.bounds.width)
    }
}
