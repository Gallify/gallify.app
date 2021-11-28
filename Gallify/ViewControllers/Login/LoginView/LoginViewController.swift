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
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
    var isSignedIn: Bool {
        if(auth.currentUser != nil){
            return true
        }
        else{
            return false
        }
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
    
    func sendVerificationMail() {
        let actionCodeSettings = ActionCodeSettings()
        actionCodeSettings.url = URL(string: "https://www.example.com")
        // The sign-in operation has to always be completed in the app.
        actionCodeSettings.handleCodeInApp = true
        actionCodeSettings.setIOSBundleID(Bundle.main.bundleIdentifier!)
        actionCodeSettings.setAndroidPackageName("com.example.android",
                                                 installIfNotAvailable: false, minimumVersion: "12")
        
//        if self.auth.currentUser != nil && !self.auth.currentUser!.isEmailVerified {
//            self.auth.currentUser!.sendEmailVerification(completion: { (error) in
//                // Notify the user that the mail has sent or couldn't because of an error.
//
//                guard error == nil else {
//                    return
//                }
//
//            })
//        }
//        else {
//            // Either the user is not available, or the user is already verified.
//            Text("An error occured")
//        }
    }
    
//    func createAccount(password: String, user: User) {
//        auth.createUser(withEmail: user.email, password: password) {[weak self] result, error in
//            guard result != nil, error == nil else {
//                return
//            }
//
//            let db = Firestore.firestore()
//                do {
//                    try db.collection("users").document(UUID().uuidString).setData(user.asDictionary())
//                } catch {
//                    //print(error)
//                }
//            }
//
//            DispatchQueue.main.async {
//                self.newUserCreated = true
//            }
//        }
    
    
    func createAccount(password: String, user: User) {
        
        auth.createUser(withEmail: user.email, password: password) {[weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
        
            var db = Firestore.firestore()
                do {
                    try db.collection("users").document(user.email).setData(from: user)
                    //self!.sendVerificationMail()
                } catch let error {
                    print("Error writing user to Firestore: \(error)")
                }
            }
            
            DispatchQueue.main.async {
                self.newUserCreated = true
            }
    }
    
    
    
    func signOut() {
        try? auth.signOut()
        self.signedIn = false
        self.newUserCreated = false
    }
    
}
struct LoginView: View {
    
    @StateObject var viewModel = LoginAppViewModel()
    
    var body: some View {
        
        NavigationView {
            
            if viewModel.isSignedIn || viewModel.newUserCreated {
                TabBarView()
            }
            
            else {
                
                let screenHeight = viewModel.screenHeight
                let screenWidth = viewModel.screenWidth
                
                VStack {
                
                    LoginViewLogoAndSubtext(screenHeight: screenHeight, screenWidth: screenWidth)
                    
                    Spacer()
                        
                    LoginViewNavLinks()
                    
                }
                
            }
            
         }
        .navigationBarHidden(true)
        .environmentObject(viewModel)
       
    }
    
}

struct Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
