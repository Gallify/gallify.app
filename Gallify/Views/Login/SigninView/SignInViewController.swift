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
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
            
        NavigationView {
            
            VStack {
                        
                SignInViewHeader(screenHeight: screenHeight, screenWidth: screenWidth, presentationMode: _presentationMode)

                    
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

