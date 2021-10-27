//
//  OtherProfileViewHeader.swift
//  Gallify
//
//  Created by Patron on 9/13/21.
//

import SwiftUI

struct OtherProfileViewHeader: View {
    
    let screenWidth: CGFloat
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        HStack {
            
            CustomBackButton(width: screenWidth, presentationMode: _presentationMode)
                .padding(.leading, screenWidth / 25)
            
            Spacer()
            
            Text("jack_brown2")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
            
            Spacer()
                    
            Button(action: {
                
            }, label: {
                
                Image(systemName: "list.bullet")
                    .resizable()
                    .foregroundColor(Color.black)
                    .frame(width: screenWidth / 18, height: screenWidth / 18)
                    .padding(.trailing, screenWidth / 25)
                
            })
            
        }
        
    }
}

struct OtherProfileViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        OtherProfileViewHeader(screenWidth: UIScreen.main.bounds.width)
    }
}
