//
//  LoginViewNavLinks.swift
//  Gallify
//
//  Created by Patron on 10/1/21.
//

import SwiftUI

struct LoginViewNavLinks: View {
    
    @EnvironmentObject var viewModel: LoginAppViewModel
    
    var body: some View {
        
        let width = viewModel.screenWidth
        
        VStack {
            
            NavigationLink(destination: SignInView().environmentObject(viewModel).navigationBarBackButtonHidden(true),
                           label: {
                HStack{
                    Text("Sign In")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.vertical, width / 35)
                        .padding(.horizontal, width / 3)
                        .background(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                        .cornerRadius(width / 10)
                }
                .padding(width / 30)
            })
            .navigationBarTitle("")
            .navigationBarHidden(true)
            
            NavigationLink(destination: CreateAccountView().environmentObject(viewModel).navigationBarBackButtonHidden(true),
                           label: {
                
                Text("Create Account")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                    .padding(width / 30)
                
            })
            .navigationBarTitle("")
            .navigationBarHidden(true)
            
        }
        .padding(.bottom, width / 30)
        
    }
    
}

struct LoginViewNavLinks_Previews: PreviewProvider {
    static var previews: some View {
        LoginViewNavLinks().environmentObject(LoginAppViewModel())
    }
}
