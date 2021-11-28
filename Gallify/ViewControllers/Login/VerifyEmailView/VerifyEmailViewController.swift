//
//  VerifyEmailViewController.swift
//  Gallify
//
//  Created by Anshul on 10/26/21.
//
import SwiftUI

struct VerifyEmailView: View {
    
    let password: String
    
    @EnvironmentObject var user: User
    @EnvironmentObject var viewModel: LoginAppViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        NavigationView {
            
            VStack {
                
                VerifyEmailHeader(screenHeight: screenHeight, screenWidth: screenWidth, presentationMode: _presentationMode)
                
                VerifyEmailBody(password: password)
                
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
