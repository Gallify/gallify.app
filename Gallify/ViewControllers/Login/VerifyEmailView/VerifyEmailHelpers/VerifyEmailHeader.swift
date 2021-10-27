//
//  VerifyEmailHeader.swift
//  Gallify
//
//  Created by Patron on 10/26/21.
//

import SwiftUI

struct VerifyEmailHeader: View {
    
    let width: CGFloat
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
                
                Text("Verify Email")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    
                Spacer()
                    
            }
            .padding(.leading, width / 12)
            .padding(.bottom, width / 15)
            
        }
        
    }
    
}

struct VerifyEmailHeader_Previews: PreviewProvider {
    static var previews: some View {
        VerifyEmailHeader(width: UIScreen.main.bounds.width)
    }
}
