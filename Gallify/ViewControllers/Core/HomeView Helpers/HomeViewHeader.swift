//
//  HomeViewHeader.swift
//  Gallify
//
//  Created by Patron on 9/5/21.
//

import SwiftUI

struct HomeViewHeader: View {
    var body: some View {
        
        HStack {
            
            Image("logo")
                .resizable()
                .frame(width: 70, height: 70)
                .padding(.leading)
            
            Text("Gallify")
                .font(.largeTitle)
                .foregroundColor(Color.black)
                .offset(x: -15)
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Image(systemName: "plus.square")
                    .resizable()
                    .foregroundColor(Color.black)
                    .padding(/*@START_MENU_TOKEN@*/.all, 7.0/*@END_MENU_TOKEN@*/)
                    .frame(width: 50.0, height: 50.0)
                })
            
            Button(action: {
                
            }, label: {
                Image(systemName: "waveform.path.ecg")
                    .resizable()
                    .foregroundColor(Color.black)
                    .padding(.all, 7.0)
                    .frame(width: 50, height: 50)
                    .padding(.trailing)
            })
        }
        .padding(.bottom, -3)
        
        Divider()
    }
}

struct HomeViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewHeader()
    }
}
