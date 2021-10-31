//
//  VerifyEmailViewController.swift
//  Gallify
//
//  Created by Patron on 10/26/21.
//

import SwiftUI

struct VerifyEmailView: View {
    
    let password: String
    
    @EnvironmentObject var user: User
    @EnvironmentObject var viewModel: LoginAppViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        let width = viewModel.screenWidth
        
        NavigationView {
            
            VStack {
                
                VerifyEmailHeader(width: width, presentationMode: _presentationMode)
                    .padding(.top, width / 75)
                
                VerifyEmailBody(password: password)
                    .environmentObject(user)
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
        VerifyEmailView(password: "")
            .environmentObject(User())
            .environmentObject(LoginAppViewModel())
    }
}
