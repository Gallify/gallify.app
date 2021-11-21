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
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        VStack {
                
            if buttonPressed && !viewModel.isSignedIn {
                
                ErrorText(errorText: "Whoops! Email or Password is incorrect.", screenHeight: screenHeight, screenWidth: screenWidth)
                    
            }

            HStack {
                
                Text("Email")
                    .font(.system(size: screenWidth / 22, weight: .semibold))
                
                Spacer()
                
            }
            .padding(.leading, screenWidth / 12)
            
            TextField("you@gmail.com", text: $email)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .textFieldStyle(OvalTextFieldStyle(screenHeight: screenHeight, screenWidth: screenWidth))
                .padding(.horizontal, screenWidth / 15)
            
            HStack{
                
                Text("Password")
                    .font(.system(size: screenWidth / 22, weight: .semibold))
                
                Spacer()
                
            }
            .padding(.leading, screenWidth / 12)
            
            SecureField("", text: $password)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .textFieldStyle(OvalTextFieldStyle(screenHeight: screenHeight, screenWidth: screenWidth))
                .padding(.horizontal, screenWidth / 15)
            
            VStack {
                
                HStack {
                    
                    NavigationLink(destination: PrivacyPolicyView(password: ""),
                                   label: {
                        
                        Text("Privacy Policy")
                            .font(.system(size: screenWidth / 22))
                            .foregroundColor(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                            .padding(.top , screenHeight / 100)
                            .padding(.leading, screenWidth / 15)
                            .padding(.bottom, screenHeight / 32.5)
                        
                    })
                    .navigationBarHidden(true)
                    
                    Spacer()
                    
                    NavigationLink(destination: ForgotPasswordView(),
                                   label: {
                        
                        Text("Forgot Password")
                            .font(.system(size: screenWidth / 22))
                            .foregroundColor(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                            .padding(.top, screenHeight / 100)
                            .padding(.trailing, screenWidth / 15)
                            .padding(.bottom, screenHeight / 32.5)
                        
                    })
                    .navigationBarHidden(true)
                    
                }
                
                Button(action: {
                    
                    viewModel.signIn(email: email, password: password)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
                    {
                        buttonPressed = true
                    }
                     
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.5)
                    {
                        buttonPressed = false
                    }
                    
                }) {
                        
                        HStack {
                            
                            Text("Sign In")
                                .font(.system(size: screenWidth / 18.5, weight: .bold))
                                .foregroundColor(Color.white)
                                .padding(.horizontal, screenWidth / 8.5)
                                .padding(.vertical, screenHeight / 65)
                                .background(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                                .cornerRadius(screenWidth / 15)
                            
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
