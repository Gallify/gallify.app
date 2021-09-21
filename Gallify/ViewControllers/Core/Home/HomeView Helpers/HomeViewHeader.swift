//
//  HomeViewHeader.swift
//  Gallify
//
//  Created by Patron on 9/5/21.
//

import SwiftUI

struct HomeViewHeader: View {
    
    let screenWidth: CGFloat
    
    var body: some View {
        
        HStack {
            
            Image("logo")
                .resizable()
                .frame(width: screenWidth / 5.5, height: screenWidth / 5.5)
                .padding(.leading, screenWidth / 37.5)
                .padding(.trailing, -screenWidth / 25)
            
            Text("Gallify")
                .font(.largeTitle)
                .foregroundColor(Color.black)
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Image(systemName: "plus.square")
                    .resizable()
                    .foregroundColor(Color.black)
                    .padding(.all, screenWidth / 55)
                    .frame(width: screenWidth / 7.5, height: screenWidth / 7.5)
                })
            
            Button(action: {
                
            }, label: {
                Image(systemName: "waveform.path.ecg")
                    .resizable()
                    .foregroundColor(Color.black)
                    .padding(.all, screenWidth / 55)
                    .frame(width: screenWidth / 7.5, height: screenWidth / 7.5)
                    .padding(.trailing, screenWidth / 37.5)
            })
        }
        .padding(.bottom, -screenWidth / 125)
        
        
        Divider()
    }
}

struct HomeViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewHeader(screenWidth: UIScreen.main.bounds.width)
    }
}
