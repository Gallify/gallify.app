//
//  SignInViewController.swift
//  Gallify
//
//  Created by Tejvir Mann on 8/18/21.
//
import SwiftUI
import Firebase

struct SignInView : View {
    
    @EnvironmentObject var viewModel: LoginAppViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        let width = viewModel.screenWidth
            
        NavigationView {
            
            VStack {
                        
                SignInViewHeader(width: width, presentationMode: _presentationMode)
                    .padding(.top, width / 75)
                    
                SignInViewBody()
                    .environmentObject(viewModel)
                    
                Spacer()
                        
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
    }
    
}

struct SignInViewController_Previews: PreviewProvider {
    static var previews: some View {
        SignInView().environmentObject(LoginAppViewModel())
    }
}

