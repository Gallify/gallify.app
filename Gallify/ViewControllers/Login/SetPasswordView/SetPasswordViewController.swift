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
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        NavigationView {
            
            VStack {
                
                SetPasswordViewHeader(screenHeight: screenHeight, screenWidth: screenWidth, presentationMode: _presentationMode)
                
                SetPasswordViewBody()
                
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
