//
//  SetPasswordViewBody.swift
//  Gallify
//
//  Created by Anshul on 10/8/21.
//
import SwiftUI

struct SetPasswordViewBody: View {
    
    @State var password = ""
    @State var rePassword = ""
    @State var buttonPressed = false
    @State var goForward: Bool? = false
    
    @EnvironmentObject var user: User
    @EnvironmentObject var viewModel: LoginAppViewModel
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        VStack {
            
            if buttonPressed {
                
                if password.isEmpty {
                    
                    ErrorText(errorText: "Password cannot be empty.", screenHeight: screenHeight, screenWidth: screenWidth)
                    
                }
                
                else if rePassword.isEmpty {
                    
                    ErrorText(errorText: "Re enter your password in the given field.", screenHeight: screenHeight, screenWidth: screenWidth)
                    
                }
                
                else if password.count < 6 {
                    
                    ErrorText(errorText: "Password should be atleast 6 characters long", screenHeight: screenHeight, screenWidth: screenWidth)
                    
                }
                
                else if password != rePassword {
                    
                    ErrorText(errorText: "The password don't match, try again.", screenHeight: screenHeight, screenWidth: screenWidth)
                    
                }
                
            }
            
            HStack {
                
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
            
            HStack {
                
                Text("Re-enter Password")
                    .font(.system(size: screenWidth / 22, weight: .semibold))
                
                Spacer()
                
            }
            .padding(.leading, screenWidth / 12)
            
            SecureField("", text: $rePassword)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .textFieldStyle(OvalTextFieldStyle(screenHeight: screenHeight, screenWidth: screenWidth))
                .padding(.horizontal, screenWidth / 15)
            
            Button(action: {
                
                if !(password.isEmpty || rePassword.isEmpty) {
                    if (password.count >= 6 && password == rePassword) {
                        goForward = true
                    }
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
                {
                    buttonPressed = true
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.5)
                {
                    buttonPressed = false
                }
                
            }, label: {
                
                Text("Next")
                    .font(.system(size: screenWidth / 18.5, weight: .bold))
                    .foregroundColor(Color.white)
                    .padding(.horizontal, screenWidth / 8.5)
                    .padding(.vertical, screenHeight / 65)
                    .background(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                    .cornerRadius(screenWidth / 15)
                
            })
            .padding(.vertical, screenHeight / 54)
            
            NavigationLink(destination: VerifyEmailView(password: password),
                        tag: true, selection: $goForward) { EmptyView() }
                .navigationBarHidden(true)
            
        }
        
    }
    
}

struct SetPasswordViewBody_Previews: PreviewProvider {
    static var previews: some View {
        SetPasswordViewBody()
            .environmentObject(User())
            .environmentObject(LoginAppViewModel())
    }
}
