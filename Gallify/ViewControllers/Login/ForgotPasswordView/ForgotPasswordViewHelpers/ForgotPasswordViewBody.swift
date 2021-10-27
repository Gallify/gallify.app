//
//  ForgotPasswordViewBody.swift
//  Gallify
//
//  Created by Patron on 10/24/21.
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
        
        let width = viewModel.screenWidth
        
        VStack {
            
            Text("We will send an email to you on your registered email with a link to reset your password and other instructions.")
                .multilineTextAlignment(.center)
                .padding([.leading, .bottom, .trailing], width / 25)
            
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
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding(width / 30)
                .padding(.horizontal, width / 9)
                .background(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                .cornerRadius(width / 15)
                
            }
            .padding(width / 25)
                            
                            
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
