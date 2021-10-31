//
//  SetPasswordViewBody.swift
//  Gallify
//
//  Created by Patron on 10/8/21.
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
        
        let width = viewModel.screenWidth
        
        VStack {
            
            if buttonPressed {
                
                if password.isEmpty {
                    
                    ErrorText(text: "Password cannot be empty.", width: width)
                    
                }
                
                else if rePassword.isEmpty {
                    
                    ErrorText(text: "Re enter your password in the given field.", width: width)
                    
                }
                
                else if password.count < 6 {
                    
                    ErrorText(text: "Password should be atleast 6 characters long", width: width)
                    
                }
                
                else if password != rePassword {
                    
                    ErrorText(text: "The password don't match, try again.", width: width)
                    
                }
                
            }
            
            HStack {
                
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
            
            HStack {
                
                Text("Re-enter Password")
                    .font(.body)
                    .fontWeight(.semibold)
                
                Spacer()
                
            }
            .padding(.leading, width / 12)
            
            SecureField("", text: $rePassword)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .textFieldStyle(OvalTextFieldStyle(screenWidth: width))
                .padding(.horizontal, width / 15)
            
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
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(width / 30)
                    .padding(.horizontal, width / 9)
                    .background(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                    .cornerRadius(width / 15)
                
            })
            .padding(.vertical, width / 25)
            
            NavigationLink(destination: VerifyEmailView(password: password)
                            .environmentObject(user)
                            .environmentObject(viewModel),
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
