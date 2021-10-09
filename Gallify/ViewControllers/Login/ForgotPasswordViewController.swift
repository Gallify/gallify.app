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
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack(alignment: .leading){
            
            Text("Forgot My Password")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                .padding()

            Text("Email")
                .font(.body)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .padding()
 
            TextField("you@gmail.com", text: $email)
                .padding(.all)
                .background(Color.white)
                .border(Color.black)
                .padding(.horizontal, 15)
            
           
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
                    .font(.title2)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 10.0)
                    .padding(.horizontal, 40)
                    .background(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
            }
            .padding()
            
            
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
    
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
