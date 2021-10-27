//
//  CreateAccountViewBody.swift
//  Gallify
//
//  Created by Patron on 10/5/21.
//

import SwiftUI

struct CreateAccountViewBody: View {
    
    @State var email = ""
    @State var firstName = ""
    @State var lastName = ""
    @State var phoneNumber = ""
    @State var location = ""
    @State var navLinkPressed = false
    
    @EnvironmentObject var viewModel: LoginAppViewModel
    
    var body: some View {
        
        var emailEmpty = email.isEmpty
        var firstNameEmpty = firstName.isEmpty
        var lastNameEmpty = lastName.isEmpty
        var phoneNumberEmpty = phoneNumber.isEmpty
        var locationEmpty = location.isEmpty
        let width = viewModel.screenWidth
        
        VStack {
            
            HStack {
                
                Text("First Name")
                    .font(.body)
                    .fontWeight(.semibold)
                
                Spacer()
                
            }
            .padding(.leading, width / 12)
 
            TextField("", text: $firstName)
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
            
            TextField("", text: $lastName)
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
            
            HStack {
                
                Text("Phone Number")
                    .font(.body)
                    .fontWeight(.semibold)
                
                Spacer()
                
            }
            .padding(.leading, width / 12)
 
            TextField("", text: $firstName)
                .disableAutocorrection(true)
                .textFieldStyle(OvalTextFieldStyle(screenWidth: width))
                .padding(.horizontal, width / 15)
            
            VStack {
                
                HStack {
                    
                    Text("Location")
                        .font(.body)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                }
                .padding(.leading, width / 12)
                
                
                           TextField("", text: $firstName)
                               .disableAutocorrection(true)
                               .textFieldStyle(OvalTextFieldStyle(screenWidth: width))
                               .padding(.horizontal, width / 15)
                
            }
            
            NavigationLink(destination: SetPasswordView(email: email).environmentObject(viewModel),
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

struct CreateAccountViewBody_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountViewBody().environmentObject(LoginAppViewModel())
    }
}
