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
    @State var userAuthenticated = false
    @Published var userVerified = false
    @Published var userDocumentNotCreated = false
    @Published var documentCreated = false
    @Published var newUserCreated = false
    
    @EnvironmentObject var user: User //to hold user email, pass, and username
    
    @State var newUserAuthenticated = false
    @State var newUserVerified = false
    @State var newUserDocumentCreated = false
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
    
    
    func isSignedIn() -> Bool{
      
        Task{
            do{
                if(self.signedIn || self.newUserCreated){
                    
                }
                else{
                    if(auth.currentUser?.isEmailVerified != nil){
                        if(!self.userDocumentNotCreated){
                            let created = try await documentCreated()
                            if(created){
                                DispatchQueue.main.async {
                                    self.signedIn = true
                                }
                            }
                            else{
                               // self.userDocumentNotCreated = false
                                DispatchQueue.main.async {
                                    self.userDocumentNotCreated = false //was true
                                }
                            }
                        }
                        
                    }
                    
                }
            }catch{
                print("Error: isSignedIn issue")
            }
        }
        
        return self.signedIn
    }
        
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.userAuthenticated = true
               // self?.newUserAuthenticated = true
            }
        }
    }
    
    
    /*
     This method sends a verification email to the current user. 
     */
    func sendVerificationEmail() {
        //doesn't work because of bad email
        print("EMAIL EMAIL")
        print(self.auth.currentUser?.email)
        self.auth.currentUser?.sendEmailVerification { (error) in
        }
        
    }
    
    func createAccount(password: String, user: User) {
        //var userEmailAdded = false
        
//        print("CREDS")
//        print(user.email)
//        print(user.username)
        
        auth.createUser(withEmail: user.email, password: password) { authResult, error in
            guard authResult != nil, error == nil else {
                return
            }
           
//            print("EMAIL EMAIL")
//            print(self.auth.currentUser?.email)
            self.auth.currentUser?.sendEmailVerification { error in
                print(self.auth.currentUser?.email)
                self.newUserAuthenticated = true // dispatche
            }
        }
        
    }
    
    func createUserDocument(password: String, user: User) async {
        let db = Firestore.firestore()
        let userBatch = db.batch()
        
        
        do{
//            print("username")
//            print(user.username)
            // Set user data.
            user.email = self.auth.currentUser!.email!
            user.uid = self.auth.currentUser!.uid
            
            let userRef = db.collection("users").document(user.uid) //used to be .email
            try await userBatch.setData(from: user, forDocument: userRef)
            
            // Commit the userBatch
            await userBatch.commit() { err in
                if let err = err {
                    print("Error writing batch \(err)")
                } else {
                    print("Batch write succeeded. New document created")
                }
            }
        }
        catch{
            print("Error creating account")
        }
        
    }
    
    func createUserData(password: String, user: User) async{
    
       // var userSubCollectionsCreated = false
//        var userPlaylistsCreated = false
//        var batchAdded = false
        
        let db = Firestore.firestore()
        let batch = db.batch()
        let userRef = db.collection("users").document(user.uid) //used to be .email
        
        do{
            
            
            /*
             Add SubCollections and Playlists
             
             Now create subcollections, and sud-documents for user.
             Home, Discover, Profile : Subcollections
             connections, followers, following, pending connections, recent search, home: Documents
            */
            
                
                let userMuseumRef = db.collection("users").document(user.uid).collection("home").document("home")
                try await batch.setData(from: MuseumList(), forDocument: userMuseumRef)
                
                let discoverRef = db.collection("users").document(user.uid).collection("discover").document("recentsearch")
                try await batch.setData(from: RecentSearch(), forDocument: discoverRef)
                
                let followersRef = db.collection("users").document(user.uid).collection("profile").document("followers")
                try await batch.setData(from: Followers(), forDocument: followersRef)
                
                let followingRef = db.collection("users").document(user.uid).collection("profile").document("following")
                try await batch.setData(from: Following(), forDocument: followingRef)
                
                let connectionsRef = db.collection("users").document(user.uid).collection("profile").document("connections")
                try await batch.setData(from: Connections(), forDocument: connectionsRef)
                
                let likedRef = db.collection("users").document(user.uid).collection("profile").document("liked_art")
                try await batch.setData(from: Liked(), forDocument: likedRef)
            
                batch.updateData(["museums": ["p0lkJFdi7cstCJrAcYMr","oEcIslgNBCQ8RO3PibQT", "1EkOA6d8DXrcHQSGuiNG"]], forDocument: userMuseumRef)
                
               // userSubCollectionsCreated = true
        
                
                
//                //adds the default playlists for the new user
//            if(userSubCollectionsCreated){
//
                let libraryPlaylistNames = ["Liked", "Featured", "Owned", "Created", "Review"]
                
                
               // let userDocRef = try await db.collection("users").document(user.uid)
                
                for i in 0...4 {
                    
                    
                    let playlist = Playlist()
                    playlist.name = libraryPlaylistNames[i]
                    
                    //add to playlist
                    let playlistRef = db.collection("playlists").document()
                    playlist.playlist_id = playlistRef.documentID
                    playlist.creator_url = user.uid /*Auth.auth().currentUser?.uid ?? ""*/
                    playlist.creator = user.firstName + " " + user.lastName
                    playlist.playlist_type = "Playlist"
                    try await batch.setData(from: playlist, forDocument: playlistRef)
                    
                    //add to user library
                    try await batch.updateData(["Library": FieldValue.arrayUnion([playlistRef.documentID])], forDocument: userRef)
                    
                    if(playlist.name == "Featured"){  //this line below should work since the the field should exist.
                        try await batch.updateData(["featured": playlistRef.documentID], forDocument: userRef)
                    }
                    
                    if(playlist.name == "Review"){  //this line below should work since the the field should exist.
                        try await batch.updateData(["review": playlistRef.documentID], forDocument: userRef)
                    }
                    
                    if(playlist.name == "Created"){  //this line below should work since the the field should exist.
                        try await batch.updateData(["created": playlistRef.documentID], forDocument: userRef)
                    }
                    if(playlist.name == "Owned"){  //this line below should work since the the field should exist.
                        try await batch.updateData(["owned": playlistRef.documentID], forDocument: userRef)
                    }
                    
                    if(playlist.name == "Liked"){  //this line below should work since the the field should exist.
                        try await batch.updateData(["liked": playlistRef.documentID], forDocument: userRef)
                    }
                }
//                userPlaylistsCreated = true
//            }
            
            // Commit the batch
            try await batch.commit() { err in
                if let err = err {
                    print("Error writing batch \(err)")
                } else {
                    //at this point everything should be set up, and ready to go!
                    print("Batch write succeeded. Document Data Added.")
                    //batchAdded = true
                    self.newUserCreated = true
                    DispatchQueue.main.async {
                        self.newUserCreated = true
                    }
                }
            }
        }
        catch{
            print("Error creating account")
        }
        
    }
    
    
    //reload customer
    func reloadUser() async {
        do{
            try await Auth.auth().currentUser?.reload()
        }catch{
            print("Error: could not reload current user")
        }
    }
    
    //verifys email
    func isVerified() async -> Bool {
    
        do{
            
            if(auth.currentUser?.isEmailVerified != nil) {
                switch await auth.currentUser?.isEmailVerified{
                case true:
                    self.userVerified = true
                    DispatchQueue.main.async {
                        self.userVerified = true
                    }
                case false:
                    self.userVerified = false
                    DispatchQueue.main.async {
                        self.userVerified = false
                        
                    }
                default:
                    self.userVerified = false
                    DispatchQueue.main.async {
                        self.userVerified = false
                       
                    }
                }
            }
        }catch{
            print("Error: could not verify current user's email")
        }

        return self.userVerified
    }
        
    
    //this method checks if a document even exists in the first place.
    func documentCreated() async throws -> Bool {
        var exists = false
        
        do {
          //  var exists = false
            let userDoc = Auth.auth().currentUser?.uid //used to be email
            let db = Firestore.firestore()
            let docRef = try await db.collection("users").document(userDoc ?? "info@gallify.app")
            
            try await docRef.getDocument { (document, error) in
               if let document = document, document.exists {
                   exists = true
                   self.documentCreated = true
                   DispatchQueue.main.async {
                       self.documentCreated = true
                   }
               } else {
                   print("Document does not exist")
                   exists = false
                   self.documentCreated = false
                   DispatchQueue.main.async {
                       self.documentCreated = false
                   }
               }
           }
            
          
        } catch {
            // .. handle error
            print("Error: Issue checking if document for user exists.")
        }
        
//        print("EXISTS")
//        print(exists)
        return self.documentCreated
       
    }
   
    
    func signOut() {
        try? auth.signOut()
        self.signedIn = false
        self.newUserCreated = false
        self.userVerified = false //to check if a users email is verified
        self.userDocumentNotCreated = false
        self.documentCreated = false
    }
    
}

struct LoginView: View {
    
    @StateObject var viewModel = LoginAppViewModel()
    
    var body: some View {
        
        
        if viewModel.isSignedIn() || viewModel.newUserCreated || viewModel.signedIn {
            
            TabBarView()
                .environmentObject(viewModel)
        }
            
        else {
            
            NavigationView {
                    
                let screenHeight = viewModel.screenHeight
                let screenWidth = viewModel.screenWidth
                    
                VStack {
                    
                    LoginViewLogoAndSubtext(screenHeight: screenHeight, screenWidth: screenWidth)
                        
                    Spacer()
                            
                    LoginViewNavLinks()
                        
                }//.onAppear{Task{ await NetworkingCall() }}
                
             }
            .onAppear{Task{ await NetworkingCall() }}
            .navigationBarHidden(true)
            .environmentObject(viewModel)
            
        }
        
    }
    
    func NetworkingCall() async {
        
        viewModel.isSignedIn()
        
//        //try to sign in user.
//        await viewModel.signIn(email: email, password: password)
//
//        //reload current user
//        await viewModel.reloadUser()
//
//        //checks if user is verified. Result stored in viewModel.userVerified
//        await viewModel.isVerified()
//
//        print("user verified? sign in")
//        print(viewModel.userVerified)
//        if(viewModel.userVerified){
//            let created = try await viewModel.documentCreated()
//            if(created){
//                viewModel.signedIn = true
//            }
//        }
    }
}
    


    


struct Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
