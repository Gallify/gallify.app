//
//  PrivacyPolicyViewHeader.swift
//  Gallify
//
//  Created by Patron on 10/8/21.
//

import SwiftUI

struct PrivacyPolicyViewHeader: View {
    
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
                    
                Text("User Agreement")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    
                Spacer()
                    
            }
            .padding(.leading, width / 12)
            .padding(.bottom, width / 25)
            
            HStack {
                
                Text("Last updated: May 23rd 2021")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                Spacer()
                
            }
            .padding(.leading, width / 12)
            
        }
            
    }
    
}

struct PrivacyPolicyViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyViewHeader(width: UIScreen.main.bounds.width)
    }
}
