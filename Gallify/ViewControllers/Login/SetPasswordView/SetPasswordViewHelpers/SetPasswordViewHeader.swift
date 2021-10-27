//
//  SetPasswordViewHeader.swift
//  Gallify
//
//  Created by Patron on 10/5/21.
//

import SwiftUI

struct SetPasswordViewHeader: View {
    
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
                
                Text("Set Password")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    
                Spacer()
                    
            }
            .padding(.leading, width / 12)
            .padding(.bottom, width / 15)
            
        }
        
    }
    
}

struct SetPasswordViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        SetPasswordViewHeader(width: UIScreen.main.bounds.width)
    }
}
