// Before merge
//  ForgotPasswordView.swift
//  Gallify
//
//  Created by Shruti Sharma on 8/26/21.
//
import SwiftUI
import Firebase

struct ForgotPasswordView: View {
    
    @EnvironmentObject var viewModel: LoginAppViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        NavigationView {
            
            VStack {
                
                ForgotPasswordViewHeader(screenHeight: screenHeight, screenWidth: screenWidth, presentationMode: _presentationMode)
                
                ForgotPasswordViewBody(presentationMode: _presentationMode)
                    .environmentObject(viewModel)
            
                Spacer()
                
            }
            .navigationBarHidden(true)
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
    }
    
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView().environmentObject(LoginAppViewModel())
    }
}
