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
        
        let width = viewModel.screenWidth
        
        NavigationView {
            
            VStack {
                
                ForgotPasswordViewHeader(width: width, presentationMode: _presentationMode)
                    .padding(.top, width / 75)
                
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
