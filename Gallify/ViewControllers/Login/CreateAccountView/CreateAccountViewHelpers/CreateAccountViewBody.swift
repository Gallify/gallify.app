//
//  CreateAccountViewBody.swift
//  Gallify
//
//  Created by Anshul on 10/5/21.
//
import SwiftUI

struct CreateAccountViewBody: View {
    
    @EnvironmentObject var user: User
    @EnvironmentObject var viewModel: LoginAppViewModel
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
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        VStack {
                
            if buttonPressed {
                        
                if user.displayName.isEmpty {
                        
                    ErrorText(errorText: "Display Name cannot be empty.", screenHeight: screenHeight, screenWidth: screenWidth)
                        
                }
                        
//                else if user.lastName.isEmpty {
//
//                    ErrorText(errorText: "Last Name cannot be empty.", screenHeight: screenHeight, screenWidth: screenWidth)
//
//                }
                        
                else if user.email.isEmpty {
                            
                    ErrorText(errorText: "Email address cannot be empty.", screenHeight: screenHeight, screenWidth: screenWidth)
                            
                }
                    
                /*
                else if user.phoneNumber.isEmpty {
                        
                    ErrorText(errorText: "Phone number cannot be empty.", screenHeight: screenHeight, screenWidth: screenWidth)
                        
                }
                    
                else if user.location.isEmpty {
                        
                    ErrorText(errorText: "Location cannot be empty.", screenHeight: screenHeight, screenWidth: screenWidth)
                        
                }
                    
                else if hasDigit(user.firstName) {
                        
                    ErrorText(errorText: "First Name cannot contain numbers.", screenHeight: screenHeight, screenWidth: screenWidth)
                        
                }
                    
                else if hasDigit(user.lastName) {
                        
                    ErrorText(errorText: "Last Name cannot contain numbers.", screenHeight: screenHeight, screenWidth: screenWidth)
                        
                }
                
                 else if !hasAllDigits(user.phoneNumber) {
                         
                     ErrorText(errorText: "Enter a valid phone number.", screenHeight: screenHeight, screenWidth: screenWidth)
                         
                 }
                */
                                
                else if !isValidEmail(email: user.email) {
                     
                    ErrorText(errorText: "Enter a valid email address.", screenHeight: screenHeight, screenWidth: screenWidth)
                     
                }


            }
                
            HStack {
                    
                Text("Display Name")
                    .font(.system(size: screenWidth / 22, weight: .semibold))
                    
                Spacer()
                    
            }
            .padding(.leading, screenWidth / 12)
     
            TextField("", text: $user.displayName)
                .disableAutocorrection(true)
                .textFieldStyle(OvalTextFieldStyle(screenHeight: screenHeight, screenWidth: screenWidth))
                .padding(.horizontal, screenWidth / 15)

//            HStack {
//
//                Text("Last Name")
//                    .font(.system(size: screenWidth / 22, weight: .semibold))
//
//                Spacer()
//
//            }
//            .padding(.leading, screenWidth / 12)
//
//            TextField("", text: $user.lastName)
//                .disableAutocorrection(true)
//                .textFieldStyle(OvalTextFieldStyle(screenHeight: screenHeight, screenWidth: screenWidth))
//                .padding(.horizontal, screenWidth / 15)
//
            HStack {
                    
                Text("Email")
                    .font(.system(size: screenWidth / 22, weight: .semibold))
                    
                Spacer()
                    
            }
            .padding(.leading, screenWidth / 12)
                
            TextField("your@email.com", text: self.$user.email)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .textFieldStyle(OvalTextFieldStyle(screenHeight: screenHeight, screenWidth: screenWidth))
                .padding(.horizontal, screenWidth / 15)
                
           HStack {

                Text("Username")
                    .font(.system(size: screenWidth / 22, weight: .semibold))

                Spacer()

            }
            .padding(.leading, screenWidth / 12)

            TextField("enter username", text: $user.username)
                .disableAutocorrection(true)
                .textFieldStyle(OvalTextFieldStyle(screenHeight: screenHeight, screenWidth: screenWidth))
                .padding(.horizontal, screenWidth / 15)
                
            VStack {
                    
  /*              HStack {
                        
                    Text("Location")
                        .font(.system(size: screenWidth / 22, weight: .semibold))
                        
                    Spacer()
                        
                }
                .padding(.leading, screenWidth / 12)
                    
                    
                TextField("", text: $user.location)
                    .disableAutocorrection(true)
                    .textFieldStyle(OvalTextFieldStyle(screenHeight: screenHeight, screenWidth: screenWidth))
                    .padding(.horizontal, screenWidth / 15)
*/
                
                
                
                
                Button(action: {
                        
                    if !(user.displayName.isEmpty || user.email.isEmpty) { // || user.phoneNumber.isEmpty || user.location.isEmpty
                        if !(hasDigit(user.displayName) || !isValidEmail(email: user.email)) { //|| !hasAllDigits(user.phoneNumber)
                            //check if username isn't taken here.
                                goForward = true
                        }
                    }
                        
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        buttonPressed = true
                    }
                        
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                        buttonPressed = false
                    }
                    
                    Task{
                        
//                        await viewModel.auth.signIn(withCustomToken: viewModel.userData.token) { user, error in
//
//                            guard user != nil, error == nil else {
//                                return
//                            }
//                        }
                    
                        if (viewModel.auth.currentUser != nil) {
                            await viewModel.createUserDocument(user: user) //creates user document
                            await viewModel.createUserData(user: user) //adds data to user document
                        }
                        
//                            if(viewModel.newUserCreated){
//
////                                DispatchQueue.main.async {
////                                    viewModel.needToCreateDoc = true
////                                }
////
//                                //sign in with custom token. No matter a new account or already existing. It creates a new authentication account if new account.
////                                viewModel.auth.signIn(withCustomToken: viewModel.userData.token) { user, error in
////
////                                    guard user != nil, error == nil else {
////                                        return
////                                    }
////
////                                    DispatchQueue.main.async {
////                                        viewModel.signedIn = true
////                                    }
////                                }
//                            }
                        
                        
                    }
                
                        
                }, label: {
                        
                    Text("Create Account")
                        .font(.system(size: screenWidth / 18.5, weight: .bold))
                        .foregroundColor(Color.white)
                        .padding(.horizontal, screenWidth / 8.5)
                        .padding(.vertical, screenHeight / 65)
                        .background(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                        .cornerRadius(screenWidth / 15)
                    
                })
                .padding(.vertical, screenHeight / 54)
                    
//                NavigationLink(destination: SetPasswordView(),
//                    tag: true, selection: $goForward) { EmptyView() }
//                    .navigationBarHidden(true)
                    
            }
                
        }
        .environmentObject(user)
        
    }
    
}

struct CreateAccountViewBody_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountViewBody()
            .environmentObject(LoginAppViewModel())
            .environmentObject(User())
    }
}
