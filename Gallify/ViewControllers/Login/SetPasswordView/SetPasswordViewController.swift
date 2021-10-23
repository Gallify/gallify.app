//
//  SetPasswordViewController.swift
//  Gallify
//
//  Created by Patron on 10/5/21.
//
import SwiftUI

struct SetPasswordViewController: View {
    
    var email: String
    
    @EnvironmentObject var viewModel: LoginAppViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        let width = viewModel.screenWidth
        
        NavigationView {
            
            VStack {
                
                SetPasswordViewHeader(presentationMode: _presentationMode)
                    .environmentObject(viewModel)
                    .padding(.top, width / 75)
                
                SetPasswordViewBody()
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
        SetPasswordViewController(email: "")
            .environmentObject(LoginAppViewModel())
    }
}
