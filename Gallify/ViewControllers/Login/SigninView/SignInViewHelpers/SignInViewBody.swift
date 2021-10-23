//
//  SignInViewBody.swift
//  Gallify
//
//  Created by Patron on 10/1/21.
//

import SwiftUI

struct SignInViewBody: View {
    
    @State var email = ""
    @State var password = ""
    @State var buttonPressed = false
    
    @EnvironmentObject var viewModel: LoginAppViewModel
    
    var body: some View {
        
        let width = viewModel.screenWidth
        
        VStack {
                
            if buttonPressed && !viewModel.isSignedIn {
                Text("Whoops! Email or Password is incorrect.")
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(width / 25)
                    .background(Color.red)
                    .cornerRadius(width / 15)
                    .padding(.bottom, width / 30)
            }

            HStack {
                
                Text("Email")
                    .font(.body)
                    .fontWeight(.semibold)
                
                Spacer()
                
            }
            .padding(.leading, width / 12)
            
            TextField("you@gmail.com", text: $email)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .textFieldStyle(OvalTextFieldStyle(screenWidth: width))
                .padding(.horizontal, width / 15)
            
            HStack{
                
                Text("Password")
                    .font(.body)
                    .fontWeight(.semibold)
                
                Spacer()
                
            }
            .padding(.leading, width / 12)
            
            SecureField("", text: $password)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .textFieldStyle(OvalTextFieldStyle(screenWidth: width))
                .padding(.horizontal, width / 15)
            
            VStack {
                
                HStack {
                    
                    NavigationLink(destination: PrivacyPolicyView().environmentObject(viewModel),
                                   label: {
                        
                        Text("Privacy Policy")
                            .foregroundColor(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                            .padding(.top , width / 50)
                            .padding([.leading, .bottom], width / 15)
                        
                    })
                    .navigationBarHidden(true)
                    
                    Spacer()
                    
                    NavigationLink(destination: ForgotPasswordView().environmentObject(viewModel),
                                   label: {
                        
                        Text("Forgot Password")
                            .foregroundColor(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                            .padding(.top, width / 50)
                            .padding([.trailing, .bottom], width / 15)
                        
                    })
                    .navigationBarHidden(true)
                    
                }
                
                Button(action:
                    {
                        viewModel.signIn(email: email, password: password)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
                        {
                            buttonPressed = true
                        }
                }) {
                        
                        HStack {
                            
                            Text("Sign In")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .padding(width / 30)
                                .padding(.horizontal, width / 12)
                                .background(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                                .cornerRadius(width / 15)
                            
                        }
                        
                    }
                
            }
            
        }
        
    }
    
}

struct SignInViewBody_Previews: PreviewProvider {
    static var previews: some View {
        SignInViewBody().environmentObject(LoginAppViewModel())
    }
}
