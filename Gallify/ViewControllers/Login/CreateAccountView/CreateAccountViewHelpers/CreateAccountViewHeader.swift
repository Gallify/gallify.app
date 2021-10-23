//
//  CreateAccountViewHeader.swift
//  Gallify
//
//  Created by Patron on 10/5/21.
//

import SwiftUI

struct CreateAccountViewHeader: View {
    
    @EnvironmentObject var viewModel : LoginAppViewModel
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
                    
                Text("Create Account")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    
                Spacer()
                    
            }
            .padding(.leading, width / 12)
            .padding(.bottom, width / 15)
            
        }
        
    }
    
}

struct CreateAccountViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountViewHeader().environmentObject(LoginAppViewModel())
    }
}
