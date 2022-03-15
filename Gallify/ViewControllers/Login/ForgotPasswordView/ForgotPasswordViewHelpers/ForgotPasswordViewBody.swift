//
//  ForgotPasswordViewBody.swift
//  Gallify
//
//  Created by Anshul on 10/24/21.
//

import SwiftUI
import Firebase

struct ForgotPasswordViewBody: View {
    
    @State private var email = ""
    @State private var showAlert = false
    @State private var errString: String?
        
    @EnvironmentObject var viewModel: LoginAppViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        VStack {
            
            Text("We will send an email to you on your registered email with a link to reset your password and other instructions.")
                .font(.system(size: screenWidth / 21))
                .multilineTextAlignment(.center)
                .padding(.horizontal, screenWidth / 25)
                .padding(.bottom, screenHeight / 54)
            
            HStack {
                
                Text("Email")
                    .font(.system(size: screenWidth / 22, weight: .semibold))
                
                Spacer()
                
            }
            .padding(.leading, screenWidth / 12)
                            
            TextField("you@email.com", text: $email)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .textFieldStyle(OvalTextFieldStyle(screenHeight: screenHeight, screenWidth: screenWidth))
                .padding(.horizontal, screenWidth / 15)
                           
            Button(action: {
                Auth.auth().sendPasswordReset(withEmail: email) { error in
                    if let error = error {
                        self.errString = error.localizedDescription
                    } else {
                        self.showAlert = true
                    }
                }
            }) {
            
                Text("Send")
                    .font(.system(size: screenWidth / 18.5, weight: .bold))
                    .foregroundColor(Color.white)
                    .padding(.horizontal, screenWidth / 8.5)
                    .padding(.vertical, screenHeight / 65)
                    .background(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                    .cornerRadius(screenWidth / 15)
                
            }
            .padding(.horizontal, screenWidth / 25)
            .padding(.vertical, screenHeight / 54)
                            
                            
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Password Reset"), message: Text(self.errString ?? "Success. Reset email sent successfully. Check your email."), dismissButton: .default(Text("OK"))
                      {
                          self.presentationMode.wrappedValue.dismiss()
            })
                
        }
        
    }
        
}

struct ForgotPasswordViewBody_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordViewBody().environmentObject(LoginAppViewModel())
    }
}
