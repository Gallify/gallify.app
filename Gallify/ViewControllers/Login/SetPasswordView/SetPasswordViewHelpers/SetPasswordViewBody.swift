//
//  SetPasswordViewBody.swift
//  Gallify
//
//  Created by Patron on 10/8/21.
//

import SwiftUI

struct SetPasswordViewBody: View {
    
    let email: String
    @State var password = ""
    @State var rePassword = ""
    
    @EnvironmentObject var viewModel: LoginAppViewModel
    
    var body: some View {
        
        let width = viewModel.screenWidth
        
        VStack {
            
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
            
            NavigationLink(destination: VerifyEmailView(email: email, password: password).environmentObject(viewModel),
                           label: {
                
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
            .navigationBarHidden(true)
            
        }
        
    }
    
}

struct SetPasswordViewBody_Previews: PreviewProvider {
    static var previews: some View {
        SetPasswordViewBody(email: "").environmentObject(LoginAppViewModel())
    }
}
