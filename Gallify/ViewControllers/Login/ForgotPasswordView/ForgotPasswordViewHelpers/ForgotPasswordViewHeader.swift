//
//  ForgotPasswordViewHeader.swift
//  Gallify
//
//  Created by Patron on 10/16/21.
//

import SwiftUI

struct ForgotPasswordViewHeader: View {
    
    var width: CGFloat
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
                    
        VStack {
            
            HStack {
                
                CustomBackButton(width: width, presentationMode: _presentationMode)
                    .padding(.horizontal, width / 25)
                    .padding(.vertical, width / 50)
                
                Spacer()
                
            }
            
            HStack {
                    
                Text("Forgot My Password")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    
                Spacer()
                    
            }
            .padding(.leading, width / 12)
            .padding(.bottom, width / 15)
            
        }
            
    }
    
}

struct ForgotPasswordViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordViewHeader(width: UIScreen.main.bounds.width)
    }
}
