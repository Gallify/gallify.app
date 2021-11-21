//
//  VerifyEmailBody.swift
//  Gallify
//
//  Created by Patron on 10/26/21.
//
import SwiftUI

struct VerifyEmailBody: View {
    
    let password: String
    @State var verificationCode = ""
    
    @EnvironmentObject var user: User
    @EnvironmentObject var viewModel: LoginAppViewModel
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        VStack {
            
            HStack {
                
                Text("Verification Code")
                    .font(.system(size: screenWidth / 22, weight: .semibold))
                
                Spacer()
                
            }
            .padding(.leading, screenWidth / 12)
            
            TextField("", text: $verificationCode)
                .disableAutocorrection(true)
                .textFieldStyle(OvalTextFieldStyle(screenHeight: screenHeight, screenWidth: screenWidth))
                .padding(.horizontal, screenWidth / 15)
            
            VStack {
                
                HStack {
                    
                    Text("Type in the six digit code sent to your")
                        .font(.system(size: screenWidth / 22))
                        .padding(.leading, screenWidth / 12)
                    
                    Spacer()
                    
                }
                
                HStack {
                    
                    Text("email. Didn't get it? ")
                        .font(.system(size: screenWidth / 22))
                        .padding(.leading, screenWidth / 12)
                    
                    Button(action: {
                        
                    }) {
                        Text("Resend Code")
                            .font(.system(size: screenWidth / 22))
                            .foregroundColor(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                            .padding(.leading, -screenWidth / 50)
                    }
                    
                    Spacer()
                    
                }
                
            }
            
            NavigationLink(destination: PrivacyPolicyView(password: password),
                           label: {
                
                Text("Next")
                    .font(.system(size: screenWidth / 18.5, weight: .bold))
                    .foregroundColor(Color.white)
                    .padding(.horizontal, screenWidth / 8.5)
                    .padding(.vertical, screenHeight / 65)
                    .background(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                    .cornerRadius(screenWidth / 15)
                
            })
            .padding(.vertical, screenHeight / 54)
            
        }
        
    }
    
}

struct VerifyEmailBody_Previews: PreviewProvider {
    static var previews: some View {
        VerifyEmailBody(password: "")
            .environmentObject(User())
            .environmentObject(LoginAppViewModel())
    }
}
