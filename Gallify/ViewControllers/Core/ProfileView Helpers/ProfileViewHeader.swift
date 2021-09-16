//
//  ProfileViewHeader.swift
//  Gallify
//
//  Created by Patron on 9/13/21.
//

import SwiftUI

struct ProfileViewHeader: View {
    
    let screenWidth: CGFloat
    
    var body: some View {
        
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
            
            
            
            Spacer()
            
            Text("jack_brown2")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
            
            Spacer()
            
            NavigationLink(
                destination: SettingsView(),
                label: {
                    
                    Image(systemName: "gearshape.fill")
                        .resizable()
                        .frame(width: screenWidth / 12, height: screenWidth / 12)
                        .padding(.trailing, screenWidth / 25)
                    
                })

        }
        
    }
}

struct ProfileViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProfileViewHeader(screenWidth: UIScreen.main.bounds.width)
    }
}
