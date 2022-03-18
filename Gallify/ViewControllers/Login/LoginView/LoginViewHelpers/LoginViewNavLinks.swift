//
//  LoginViewNavLinks.swift
//  Gallify
//
//  Created by Anshul on 10/1/21.
//
import SwiftUI

struct LoginViewNavLinks: View {
    
    @EnvironmentObject var viewModel: LoginAppViewModel
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        VStack {
            
            NavigationLink(destination: SignInView(),
                            label: {
                
            
                HStack {
                    
                    Text("Sign In")
                        
                        .font(.system(size: screenWidth / 18.5, weight: .bold))
                        .foregroundColor(Color.white)
                        .padding(.horizontal, screenWidth / 3)
                        .padding(.vertical, screenHeight / 75)
                        .background(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                        .cornerRadius(screenWidth / 10)
                        
                        .padding(.horizontal, screenWidth / 30)
                        .padding(.vertical, screenHeight / 65)

                    
                }
                
                    
                
            })
            .navigationBarHidden(true)
            
            
            NavigationLink(destination: CreateAccountView(),
                           label: {
                
                Text("Create Account")
                    .font(.system(size: screenWidth / 18.5, weight: .bold))
                    .foregroundColor(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                    .padding(.horizontal, screenWidth / 30)
                    .padding(.vertical, screenHeight / 65)
                
            })
            .navigationBarHidden(true)
            
        }
        .padding(.bottom, screenHeight / 65)
        
    }
    
}

struct LoginViewNavLinks_Previews: PreviewProvider {
    static var previews: some View {
        LoginViewNavLinks().environmentObject(LoginAppViewModel())
    }
}
