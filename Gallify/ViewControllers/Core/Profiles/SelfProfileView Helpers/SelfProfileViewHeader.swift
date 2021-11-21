//
//  SelfProfileViewHeader.swift
//  Gallify
//
//  Created by Patron on 9/13/21.
//
import SwiftUI

struct SelfProfileViewHeader: View {
    
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    
    var body: some View {
        
        HStack {
            
            Spacer()
            
            Text("jack_brown")
                .font(.system(size: screenWidth / 17, weight: .bold))
                .padding(.leading, screenWidth / 9.4)
            
            Spacer()
            
            NavigationLink(
                destination: SettingsView(),
                label: {
                        
                    Image(systemName: "gearshape.fill")
                        .resizable()
                        .foregroundColor(.gray)
                        .frame(width: screenWidth / 15, height: screenHeight / 32.5)
                        .padding(.trailing, screenWidth / 25)
                        
            })
            
        }
        .padding(.top, screenHeight / 54)
        
    }
    
}

struct SelfProfileViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        SelfProfileViewHeader(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width)
    }
}
