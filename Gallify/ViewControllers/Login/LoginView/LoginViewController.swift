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
//            var db = Firestore.firestore()
//                do {
//                    user.uid = self!.auth.currentUser!.uid
//                    try db.collection("users").document(self!.auth.currentUser!.uid).setData(from: user)
//                    //self!.sendVerificationMail()
//                } catch let error {
//                    print("Error writing user to Firestore: \(error)")
//                }
//            }
//
//            DispatchQueue.main.async {
//                self.newUserCreated = true
//            }
//    }
    
    func createAccount(password: String, user: User) {
            
            auth.createUser(withEmail: user.email, password: password) {[weak self] result, error in
                guard result != nil, error == nil else {
                    return
                }
            
                var db = Firestore.firestore()
                do {
                        
                        //create user field
                        user.uid = self!.auth.currentUser!.uid
                        let userDocRef = try db.collection("users").document(user.uid)
                        try userDocRef.setData(from: user)
                        //self!.sendVerificationMail()
                        
                        /*
                         Now create subcollections, and sud-documents for user.
                         Home, Discover, Profile : Subcollections
                         connections, followers, following, pending connections, recent search, home: Documents
                        */
                        let userMuseumRef = try db.collection("users").document(user.uid).collection("home").document("home")
                            try userMuseumRef.setData(from: MuseumList())
                        try db.collection("users").document(user.uid).collection("discover").document("recentsearch").setData(from: RecentSearch())
                        try db.collection("users").document(user.uid).collection("profile").document("followers").setData(from: Followers())
                        try db.collection("users").document(user.uid).collection("profile").document("following").setData(from: Following())
                        try db.collection("users").document(user.uid).collection("profile").document("connections").setData(from: Connections())
                        try db.collection("users").document(user.uid).collection("profile").document("pending").setData(from: Pending())
                        
                       
                        //generate your 5 playlists. document ids should be random, rn they aren'
                        //generate your "myplaylist" museum. This museum is 5 playlists.
                        
                        //add this museum
                        
                        let museum_names = ["Recents", "Discover", "Trending-Artists", "International Art", "Indie-designers"]
                        for i in museum_names {
                            let museum = Museum()
                            museum.name = i
                            for index in 1...5 {
                                let playlist = try db.collection("playlists").document()
                                try playlist.setData(from: Playlist())
                                museum.playlist.append(playlist.documentID)
                            }
                            let docRef = try db.collection("museums").document()
                            try docRef.setData(from: museum)
                            userMuseumRef.updateData(["museums" : FieldValue.arrayUnion([docRef.documentID])])
                        }
                        
                    //update Library in users doc with 5 playlists (Liked, featured, owned, created, reviewed)
                        let libraryPlaylistNames = ["Liked", "Featured", "Owned", "Created", "Reviewed"]
                        for i in 0...4 {
                          let playlist = Playlist()
                          playlist.name = libraryPlaylistNames[i]
                          let playlistRef = try db.collection("playlists").document()
                          try playlistRef.setData(from: playlist)
                          userDocRef.updateData(["Library": FieldValue.arrayUnion([playlistRef.documentID])])
                        }
        
                        
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
   // @EnvironmentObject var firestoreQuery : FirestoreQuery
    
    var body: some View {
        
        NavigationView {
            
            if viewModel.isSignedIn || viewModel.newUserCreated {
                
                TabBarView()
                    .environmentObject(viewModel)
                
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
