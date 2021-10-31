//
//  CreateAccountViewBody.swift
//  Gallify
//
//  Created by Patron on 10/5/21.
//

import SwiftUI

struct CreateAccountViewBody: View {
    
    @StateObject var user = User()
    @State var buttonPressed = false
    @State var goForward: Bool? = false
    
    func isValidEmail(email: String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = email as NSString
            let results = regex.matches(in: email, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                return false
            }
            
        } catch _ as NSError {
            return false
        }
        
        return true
        
    }
    
    func hasDigit(_ string:String) -> Bool {
        
        for character in string{
            if character.isNumber{
                return true
            }
        }
        return false
        
    }
    
    func hasAllDigits(_ string:String) -> Bool {
        
        for character in string{
            if !character.isNumber{
                return false
            }
        }
        return true
        
    }
    
    @EnvironmentObject var viewModel: LoginAppViewModel
    
    var body: some View {
        
        let width = viewModel.screenWidth
        
        VStack {
            
            if buttonPressed {
                    
                if user.firstName.isEmpty {
                    
                    ErrorText(text: "First Name cannot be empty.", width: width)
                    
                }
                    
                else if user.lastName.isEmpty {
                        
                    ErrorText(text: "Last Name cannot be empty.", width: width)
                        
                }
                    
                else if user.email.isEmpty {
                        
                    ErrorText(text: "Email address cannot be empty.", width: width)
                        
                }
                
                else if user.phoneNumber.isEmpty {
                    
                    ErrorText(text: "Phone number cannot be empty.", width: width)
                    
                }
                
                else if user.location.isEmpty {
                    
                    ErrorText(text: "Location cannot be empty.", width: width)
                    
                }
                
                else if hasDigit(user.firstName) {
                    
                    ErrorText(text: "First Name cannot contain numbers.", width: width)
                    
                }
                
                else if hasDigit(user.lastName) {
                    
                    ErrorText(text: "Last Name cannot contain numbers.", width: width)
                    
                }
                            
                else if !isValidEmail(email: user.email) {
                 
                    ErrorText(text: "Enter a valid email address.", width: width)
                 
                }
                
                else if !hasAllDigits(user.phoneNumber) {
                    
                    ErrorText(text: "Enter a valid phone number.", width: width)
                    
                }

            }
            
            HStack {
                
                Text("First Name")
                    .font(.body)
                    .fontWeight(.semibold)
                
                Spacer()
                
            }
            .padding(.leading, width / 12)
 
            TextField("", text: $user.firstName)
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
            
            TextField("", text: $user.lastName)
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
            
            TextField("you@gmail.com", text: $user.email)
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
 
            TextField("", text: $user.phoneNumber)
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
                
                
                TextField("", text: $user.location)
                    .disableAutocorrection(true)
                    .textFieldStyle(OvalTextFieldStyle(screenWidth: width))
                    .padding(.horizontal, width / 15)
                
                Button(action: {
                    
                    if !(user.firstName.isEmpty || user.lastName.isEmpty || user.email.isEmpty || user.phoneNumber.isEmpty || user.location.isEmpty) {
                        if !(hasDigit(user.firstName) || hasDigit(user.lastName) || !isValidEmail(email: user.email) || !hasAllDigits(user.phoneNumber)) {
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
                
                NavigationLink(destination: SetPasswordView()
                                .environmentObject(user)
                                .environmentObject(viewModel),
                            tag: true, selection: $goForward) { EmptyView() }
                .navigationBarHidden(true)
                
            }
            
        }
        
    }
    
}

struct CreateAccountViewBody_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountViewBody().environmentObject(LoginAppViewModel())
    }
}
