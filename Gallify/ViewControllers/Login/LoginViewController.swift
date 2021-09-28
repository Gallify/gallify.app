//
//  SigninViewController.swift
//  Gallify
//
//  Created by Tejvir Mann on 8/18/21.
//

import SwiftUI
import Firebase
import UIKit

class LoginAppViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    @Published var newUserCreated = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            //Success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func createAccount(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) {[weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.newUserCreated = true
            }
        }
    }
    
    func signOut() {
        try? auth.signOut()
        self.signedIn = false
        self.newUserCreated = false
    }
    
}

//func handleSignIn(){
//    let mainAppTabBarVC = TabBarViewController()
//    mainAppTabBarVC.modalPresentationStyle = .fullScreen
//    present(mainAppTabBarVC, animated: true)
//}

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel : LoginAppViewModel
    
    var body: some View {
        NavigationView {
            if viewModel.signedIn {
              TabBarView()

            } else if viewModel.newUserCreated {
//                VStack {
//                    Text("Your account has been created!")
//                    //tab bar view
//                    NavigationLink("Sign In", destination: SignInView())
//                        .foregroundColor(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
//                        .padding()
//
//                }
                TabBarView()
            }
            else {
                SignInView()
            }
         }
        .onAppear {
            viewModel.signedIn = viewModel.isSignedIn
        }
       
    }
    
}

struct Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView().environmentObject(LoginAppViewModel())
            CreateAccountView().environmentObject(LoginAppViewModel())
            SignInView().environmentObject(LoginAppViewModel())
        }
    }
}
