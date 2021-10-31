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
        
        let width = viewModel.screenWidth
        
        VStack {
            
            HStack {
                
                Text("Verification Code")
                    .font(.body)
                    .fontWeight(.semibold)
                
                Spacer()
                
            }
            .padding(.leading, width / 12)
            
            TextField("", text: $verificationCode)
                .disableAutocorrection(true)
                .textFieldStyle(OvalTextFieldStyle(screenWidth: width))
                .padding(.horizontal, width / 15)
            
            VStack {
                
                HStack {
                    
                    Text("Type in the six digit code sent to your")
                        .padding(.leading, width / 12)
                    
                    Spacer()
                    
                }
                
                HStack {
                    
                    Text("email. Didn't get it? ")
                        .padding(.leading, width / 12)
                    
                    Button(action: {
                        
                    }) {
                        Text("Resend Code")
                            .foregroundColor(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                            .padding(.leading, -width / 50)
                    }
                    
                    Spacer()
                    
                }
                
            }
            
            NavigationLink(destination: PrivacyPolicyView(password: password)
                            .environmentObject(user)
                            .environmentObject(viewModel),
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
