//
//  SignInViewController.swift
//  Gallify
//
//  Created by Tejvir Mann on 8/18/21.
//
import SwiftUI
import Firebase



struct SignInView : View {
    
    @EnvironmentObject var viewModel : LoginAppViewModel
    
    var body: some View {
        
        let width = viewModel.screenWidth
            
        NavigationView {
            
            VStack {
                        
                SignInViewHeader().environmentObject(viewModel)
                        .padding(.top, width / 75)
                    
                SignInViewBody().environmentObject(viewModel)
                    
                Spacer()
                        
            }
            
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        
    }
    
}

struct SignInViewController_Previews: PreviewProvider {
    static var previews: some View {
        SignInView().environmentObject(LoginAppViewModel())
    }
}

