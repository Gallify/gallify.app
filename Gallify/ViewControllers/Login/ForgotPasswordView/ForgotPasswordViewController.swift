// Before merge
//  ForgotPasswordView.swift
//  Gallify
//
//  Created by Shruti Sharma on 8/26/21.
//
import SwiftUI
import Firebase

struct ForgotPasswordView: View {
    
    @State private var email = ""
    @State private var showAlert = false
    @State private var errString: String?
    
    @EnvironmentObject var viewModel: LoginAppViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        let width = viewModel.screenWidth
        
        NavigationView {
            
            VStack {
                
                ForgotPasswordViewHeader(presentationMode: _presentationMode)
                    .environmentObject(viewModel)
                    .padding(.top, width / 75)

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
                Alert(title: Text("Password Reset"),
                      message: Text(self.errString ?? "Success. Reset email sent successfully. Check your email."),
                      dismissButton: .default(Text("OK")) {
                        self.presentationMode.wrappedValue.dismiss()
                      })
            }
            .padding(.bottom, 400.0)
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
    }
    
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView().environmentObject(LoginAppViewModel())
    }
}
