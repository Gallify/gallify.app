//
//  SetPasswordViewController.swift
//  Gallify
//
//  Created by Patron on 10/5/21.
//
import SwiftUI

struct SetPasswordView: View {
    
    let email: String
    
    @EnvironmentObject var viewModel: LoginAppViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        let width = viewModel.screenWidth
        
        NavigationView {
            
            VStack {
                
                SetPasswordViewHeader(width: width, presentationMode: _presentationMode)
                    .padding(.top, width / 75)
                
                SetPasswordViewBody(email: email)
                    .environmentObject(viewModel)
                
                Spacer()
                
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
    }
    
}

struct SetPasswordViewController_Previews: PreviewProvider {
    static var previews: some View {
        SetPasswordView(email: "")
            .environmentObject(LoginAppViewModel())
    }
}
