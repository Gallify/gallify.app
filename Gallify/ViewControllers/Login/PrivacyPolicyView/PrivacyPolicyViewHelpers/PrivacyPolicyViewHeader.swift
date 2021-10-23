//
//  PrivacyPolicyViewHeader.swift
//  Gallify
//
//  Created by Patron on 10/8/21.
//

import SwiftUI

struct PrivacyPolicyViewHeader: View {
    
    @EnvironmentObject var viewModel: LoginAppViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        let width = viewModel.screenWidth
            
        VStack {
            
            HStack {
                
                CustomBackButton(width: width, presentationMode: _presentationMode)
                    .padding(.horizontal, width / 25)
                    .padding(.vertical, width / 50)
                
                Spacer()
                
            }
            
            HStack {
                    
                Text("Privacy Policy")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    
                Spacer()
                    
            }
            .padding(.leading, width / 12)
            .padding(.bottom, width / 25)
            
        }
            
    }
    
}

struct PrivacyPolicyViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyViewHeader().environmentObject(LoginAppViewModel())
    }
}
