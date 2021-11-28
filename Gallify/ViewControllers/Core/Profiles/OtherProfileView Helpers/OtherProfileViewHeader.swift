//
//  OtherProfileViewHeader.swift
//  Gallify
//
//  Created by Anshul on 9/13/21.
//
import SwiftUI

struct OtherProfileViewHeader: View {
    
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        HStack {
            
            CustomBackButton(buttonHeight: screenHeight / 39, buttonWidth: screenWidth / 18, image: Image(systemName: "lessthan"), presentationMode: _presentationMode)
            
            Spacer()
            
            Text("i_love_me")
                .font(.system(size: screenWidth / 17, weight: .bold))
                .foregroundColor(Color.black)
            
            Spacer()
                    
            Button(action: {
                
            }, label: {
                
                Image(systemName: "list.bullet")
                    .resizable()
                    .foregroundColor(Color.black)
                    .frame(width: screenWidth / 18, height: screenHeight / 39)
                
            })
            
        }
        .padding(.horizontal, screenWidth / 25)
        .padding(.top, screenHeight / 54)
        
    }
}

struct OtherProfileViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        OtherProfileViewHeader(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width)
    }
}
