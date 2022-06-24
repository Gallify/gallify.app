//
//  SignInViewBody.swift
//  Gallify
//
//  Created by Anshul on 10/1/21.
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
                
//            if buttonPressed && !viewModel.signedIn {
//
//                ErrorText(errorText: "Whoops! Email or Password is incorrect.", screenHeight: screenHeight, screenWidth: screenWidth)
//
//            }

            HStack {
                
                Text("Email")
                    .font(.system(size: screenWidth / 22, weight: .semibold))
                
                Spacer()
                
            }
            .padding(.leading, screenWidth / 12)
            
            TextField("you@email.com", text: $email)
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
                    
                    Button(action: {
                        
                        if let url = URL(string: "https://www.gallify.app/policies") {
                           UIApplication.shared.open(url)
                        }
                        
                    }) {
                        
                        Text("Privacy Policy")
                            .font(.system(size: screenWidth / 22))
                            .foregroundColor(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                            .padding(.top , screenHeight / 100)
                            .padding(.leading, screenWidth / 15)
                            .padding(.bottom, screenHeight / 32.5)
                        
                        
                    }
                    
                    
//                    NavigationLink(destination: PrivacyPolicyView(password: ""),
//                                   label: {
//
//                        Text("Privacy Policy")
//                            .font(.system(size: screenWidth / 22))
//                            .foregroundColor(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
//                            .padding(.top , screenHeight / 100)
//                            .padding(.leading, screenWidth / 15)
//                            .padding(.bottom, screenHeight / 32.5)
//
//                    })
//                    .navigationBarHidden(true)
                    
                    
                    
                    
                    
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
                    //viewModel.isSignedIn(email: email, password: password)
                    
                    Task{
                        //try to sign in user.
//                        await viewModel.signIn(email: email, password: password)
                       
                        //reload current user
                        await viewModel.reloadUser()
                        
                        //checks if user is verified. Result stored in viewModel.userVerified
                        await viewModel.isVerified()
                        
                        print("user verified? sign in")
                        print(viewModel.userVerified)
                        if(viewModel.userVerified){
                            let created = try await viewModel.documentCreated()
                            if(created){
                                viewModel.signedIn = true
                            }
                        }
                    }
                    
                    buttonPressed = true
                    
                }) {
                        
                    VStack{
                        HStack {
                            
                            Text("Sign In")
                                .font(.system(size: screenWidth / 18.5, weight: .bold))
                                .foregroundColor(Color.white)
                                .padding(.horizontal, screenWidth / 8.5)
                                .padding(.vertical, screenHeight / 65)
                                .background(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                                .cornerRadius(screenWidth / 15)
                        }
                        HStack{
                            Text("(Triple Tap)")
                                .font(.system(size: screenWidth / 29))
                                .foregroundColor(.gray)
                        }
                        
                    }
                        
                        
                        
                    }
                
            }
            
        } //
       
        
    }


    
}

struct SignInViewBody_Previews: PreviewProvider {
    static var previews: some View {
        SignInViewBody().environmentObject(LoginAppViewModel())
    }
}
