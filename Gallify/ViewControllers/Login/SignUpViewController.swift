//
//  SignUpViewController.swift
//  Gallify
//
//  Created by Tejvir Mann on 8/18/21.
//

import SwiftUI
import Firebase



struct SignInView : View {
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel : LoginAppViewModel
    var body: some View {
        
        VStack(alignment: .center){
            
            Logo()
                .padding(.bottom, 45.0)
            
            Text("Gallify")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                .lineLimit(7)
                .padding(.top, -50.0)
            
            HStack{
                Text("Changing the Art World Forever.")
                    .font(.body)
                    .fontWeight(.ultraLight)
                    .foregroundColor(Color.black)
            }
            
            HStack{
                Text("Email")
                    .font(.body)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
            }
           .padding(.top, 20.0)
           .padding(.trailing, 300.0)
            
            TextField("you@gmail.com", text: $email)
                .padding(.all)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 1.0, saturation: 0.001, brightness: 0.901)/*@END_MENU_TOKEN@*/)
                .padding(.horizontal, 40)
            
            HStack{
                Text("Password")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                    .padding(.leading, -175.0)
            }
            
            SecureField("", text: $password)
                .padding(.all)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 1.0, saturation: 0.001, brightness: 0.901)/*@END_MENU_TOKEN@*/)
                .padding(.horizontal, 40)


            
            HStack{
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Privacy Policy")
                        .foregroundColor(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                }
                
                .padding(.leading, -110.0)
                .padding(.horizontal, 105.0)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Forgot Password")
                        .foregroundColor(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                }
            }
            
            Button(action: {
                guard !email.isEmpty, !password.isEmpty else {
                    return
                }
                viewModel.signIn(email: email, password: password)
            }) {
                HStack{
                    Text("Sign In")
                        .font(.title2)
                        .foregroundColor(Color.white)
                        .padding(.vertical, 10.0)
                        .padding(.horizontal, 50)
                        .background(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                }
            }
            
            .padding(.vertical, 15)
        
            NavigationLink("Sign Up", destination: CreateAccountView())
                .foregroundColor(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                .padding()
        }
    }
    
}
