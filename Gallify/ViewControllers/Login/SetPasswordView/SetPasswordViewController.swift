//
//  SetPasswordViewController.swift
//  Gallify
//
//  Created by Patron on 10/5/21.
//
import SwiftUI

struct SetPasswordView: View {
    
    @EnvironmentObject var user: User
    @EnvironmentObject var viewModel: LoginAppViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        let width = viewModel.screenWidth
        
        NavigationView {
            
            VStack {
                
                SetPasswordViewHeader(width: width, presentationMode: _presentationMode)
                    .padding(.top, width / 75)
                
                SetPasswordViewBody()
                    .environmentObject(user)
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
        SetPasswordView()
            .environmentObject(LoginAppViewModel())
            .environmentObject(User())
    }
}
