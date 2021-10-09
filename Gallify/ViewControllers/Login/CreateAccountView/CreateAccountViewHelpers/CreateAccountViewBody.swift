//
//  CreateAccountViewBody.swift
//  Gallify
//
//  Created by Patron on 10/5/21.
//

import SwiftUI

struct CreateAccountViewBody: View {
    
    @State var email = ""
    
    @EnvironmentObject var viewModel: LoginAppViewModel
    
    var body: some View {
        
        let width = viewModel.screenWidth
        
        VStack {
            
            HStack {
                
                Text("First Name")
                    .font(.body)
                    .fontWeight(.semibold)
                
                Spacer()
                
            }
            .padding(.leading, width / 12)
 
            TextField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .disableAutocorrection(true)
                .textFieldStyle(OvalTextFieldStyle(screenWidth: width))
                .padding(.horizontal, width / 15)

            HStack {
                
                Text("Last Name")
                    .font(.body)
                    .fontWeight(.semibold)
                
                Spacer()
                
            }
            .padding(.leading, width / 12)
            
            TextField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .disableAutocorrection(true)
                .textFieldStyle(OvalTextFieldStyle(screenWidth: width))
                .padding(.horizontal, width / 15)
    
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
            
            NavigationLink(destination: SetPasswordViewController(email: email).environmentObject(viewModel).navigationBarBackButtonHidden(true), label: {
                
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
            .navigationBarTitle("")
            .navigationBarHidden(true)
            
        }
        
    }
    
}

struct CreateAccountViewBody_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountViewBody().environmentObject(LoginAppViewModel())
    }
}
