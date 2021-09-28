//
//  CreateAccountViewController.swift
//  Gallify
//
//  Created by Tejvir Mann on 8/18/21.
//

import SwiftUI
import Firebase

struct CreateAccountView : View {
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel : LoginAppViewModel
    var body: some View {
        VStack(alignment: .leading){
            
            Text("Create Account")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                .padding()

            Text("First Name")
                .font(.body)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .padding()
 
            TextField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .padding(.all)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 1.0, saturation: 0.001, brightness: 0.901)/*@END_MENU_TOKEN@*/)
                .padding(.horizontal, 17)

            Text("Last Name")
                .font(.body)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .padding()
            
            TextField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .padding(.all)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 1.0, saturation: 0.001, brightness: 0.901)/*@END_MENU_TOKEN@*/)
                .padding(.horizontal, 17)
    
            Text("Email")
                .font(.body)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .padding()
            
            TextField("you@gmail.com", text: $email)
                .padding(.all)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 1.0, saturation: 0.001, brightness: 0.901)/*@END_MENU_TOKEN@*/)
                .padding(.horizontal)
            
            Text("Password")
                .font(.body)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .padding()
            
            SecureField("", text: $password)
                .padding(.all)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 1.0, saturation: 0.001, brightness: 0.901)/*@END_MENU_TOKEN@*/)
                .padding(.horizontal, 17)
            
            
            Button(action: {
                guard !email.isEmpty, !password.isEmpty else {
                    return
                }
                viewModel.createAccount(email: email, password: password)
            }) {
                Text("Create account")
                    .font(.title2)
                    .frame(width: 80, height: 70, alignment: .center)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 10.0)
                    .padding(.horizontal, 50)
                    .background(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
            }
            .padding(.vertical)
            .padding(.horizontal, 115)
            
        }
        
    }
    
}

struct CreateAccountViewController: PreviewProvider {
    static var previews: some View {
        CreateAccountView().environmentObject(LoginAppViewModel())
    }
}

