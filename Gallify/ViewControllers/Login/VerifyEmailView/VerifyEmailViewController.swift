//
//  VerifyEmailViewController.swift
//  Gallify
//
//  Created by Patron on 10/26/21.
//

import SwiftUI

struct VerifyEmailView: View {
    
    let email: String
    let password: String
    
    @EnvironmentObject var viewModel: LoginAppViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        let width = viewModel.screenWidth
        
        NavigationView {
            
            VStack {
                
                VerifyEmailHeader(width: width, presentationMode: _presentationMode)
                    .padding(.top, width / 75)
                
                VerifyEmailBody(email: email, password: password)
                    .environmentObject(viewModel)
                
                Spacer()
                
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            
        }
        .navigationBarHidden(true)
        
    }
    
}

struct VerifyEmailViewController_Previews: PreviewProvider {
    static var previews: some View {
        VerifyEmailView(email: "", password: "").environmentObject(LoginAppViewModel())
    }
}
