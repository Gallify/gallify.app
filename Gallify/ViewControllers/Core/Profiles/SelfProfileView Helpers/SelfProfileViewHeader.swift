//
//  SelfProfileViewHeader.swift
//  Gallify
//
//  Created by Patron on 9/13/21.
//

import SwiftUI

struct SelfProfileViewHeader: View {
    
    let screenWidth: CGFloat
    
    var body: some View {
        
        HStack {
            
            Spacer()
            
            Text("jack_brown2")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                .padding(.leading, screenWidth / 9.4)
            
            Spacer()
            
            NavigationLink(
                destination: SettingsView(),
                label: {
                    
                    Image(systemName: "gearshape.fill")
                        .resizable()
                        .foregroundColor(.gray)
                        .frame(width: screenWidth / 15, height: screenWidth / 15)
                        .padding(.trailing, screenWidth / 25)
                    
                })

        }
        
    }
}

struct SelfProfileViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        SelfProfileViewHeader(screenWidth: UIScreen.main.bounds.width)
    }
}
