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
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    @Published var signedIn = false
    @Published var newUserCreated = false
    
    var isSignedIn: Bool {
        return signedIn
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
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

struct LoginView: View {
    
    @EnvironmentObject var viewModel: LoginAppViewModel
    
    var body: some View {
        
        NavigationView {
            
            if viewModel.signedIn || viewModel.newUserCreated {
                TabBarView()
            }
            
            else {
                
                let width = viewModel.screenWidth
                
                VStack {
                
                    LoginViewLogoAndSubtext(width: width)
                    
                    Spacer()
                        
                    LoginViewNavLinks().environmentObject(viewModel)
                    
                }
                
            }
            
         }
        .navigationBarHidden(true)
       
    }
    
}

struct Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(LoginAppViewModel())
    }
}
