//
//  SigninViewController.swift
//  Gallify
//
//  Created by Tejvir Mann on 8/18/21.
//
import SwiftUI
import Firebase
import UIKit

@MainActor
class LoginAppViewModel: ObservableObject {
    
    @Published var walletConnect: WalletConnect!
    @Published var semaphore_WalletConnect = false
    
    
    
    let auth = Auth.auth()
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    @Published var createDoc = false
    @Published var signedIn = false
//    @Published var needToCreateDoc = false
    @State var userAuthenticated = false
    @Published var userVerified = false
    @Published var userDocumentNotCreated = false
    @Published var documentCreated = false
    @Published var newUserCreated = false
    @Published var isGuest = false
    @Published var userData: SignIn = SignIn()
    @Published var loginLoading = true
    
    @EnvironmentObject var user: User //to hold user email, pass, and username
    
    @State var newUserAuthenticated = false
    @State var newUserVerified = false
    @State var newUserDocumentCreated = false
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
    
    func issignedin() -> Bool{
        
        //this runs a background task to see if doc created, self.documentCreated should update.
        if(!self.documentCreated){
            checkIfDocCreated()
        }
        
            
  //      try? auth.signOut()
        if (auth.currentUser != nil) {
            
            if(self.newUserCreated == true){
                
                return true
            }
            else{
                
                if(self.documentCreated){
                    
                    return true
                }
                else{
                    checkIfDocCreated()
                    
                    return false
                }
            }
        }
        else {
            // No user is signed in
            return false
        }
            
        
    }
    
    func checkIfDocCreated(){
        Task{
            do{
                try await documentCreated()
            }
            catch{
                print("Error: documentCreated() bug")
            }
        }
    }
    
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
        
    
//    func signIn(email: String, password: String) {
//        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
//            guard result != nil, error == nil else {
//                return
//            }
//
//            DispatchQueue.main.async {
//                self?.userAuthenticated = true
//               // self?.newUserAuthenticated = true
//            }
//        }
//    }
    
    
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
    
    func createUserDocument(user: User) async {
        let db = Firestore.firestore()
        let userBatch = db.batch()
        
        
        do{
//            print("username")
//            print(user.username)
            
            // Set user data.
//            user.email = self.auth.currentUser!.email!
//            user.uid = self.auth.currentUser!.uid
            
//            user.email = userData.userData.email
            user.uid = walletConnect.session.walletInfo?.accounts[0] ?? ""
            print(user.uid)
            
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
    
    func createUserData(user: User) async{
    
       // var userSubCollectionsCreated = false
//        var userPlaylistsCreated = false
//        var batchAdded = false
        
        let db = Firestore.firestore()
        let batch = db.batch()
        
        
        
        user.uid = walletConnect.session.walletInfo?.accounts[0] ?? ""
        
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
                    
                    if(playlist.name == "Liked"){
                        playlist.playlist_type = "Playlist"
                    }
                    else{
                        playlist.playlist_type = "Collection"
                    }
                    
                    //these will be public. 
                    if(playlist.name == "Created" || playlist.name == "Owned" || playlist.name == "Featured"){
                        playlist.privacy = 1
                    }
                   
                    
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
        
            if (auth.currentUser != nil) {
            
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
                       //print("Document does not exist")
                       exists = false
                       self.documentCreated = false
                       DispatchQueue.main.async {
                           self.documentCreated = false
                       }
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
        self.userData = SignIn() //clears data
        self.loginLoading = true
        
        //disconnects from wallet
        for session in self.walletConnect.client.openSessions() {
            try? self.walletConnect.client.disconnect(from: session)
        }
    }
    
    /*
     Start: Wallet methods to sign in, create account.
     */
    

    /*
     This method gets a json via the Gallify API, then, it converts it to proper objects.
     */
    func getCustomToken(walletAddress: String){

        if(self.userData.token == ""){
            let apiAddress = "https://api.gallify.app/v0/token/" + walletAddress
            print(apiAddress)

            let url = URL(string: apiAddress)!
            var request = URLRequest(url: url)
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "GET"
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data,
                    let response = response as? HTTPURLResponse,
                    error == nil else {                                              // check for fundamental networking error
                    print("error", error ?? "Unknown error")
                    return
                }

                guard (200 ... 299) ~= response.statusCode else {                    // check for http errors
                    print("statusCode should be 2xx, but is \(response.statusCode)")
                    print("response = \(response)")
                    return
                }

                let responseString = String(data: data, encoding: .utf8)
                print("responseString = \(responseString)")
                DispatchQueue.main.async {
                    
                    
                    let data = Data(responseString!.utf8)

                    do {
                        // make sure this JSON is in the format we expect
                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                            // try to read out a string array
                            if let token = json["token"] as? String {
                                print(token)
                                self.userData.token = token
                            }
                            if let user = json["userData"] as? AnyObject {
                                print(user)
                                if user is NSNull{
                                    print("nil")
//                                    self.userData.userData.uid = "newuser"
//                                    self.needToCreateDoc = true
                                    DispatchQueue.main.async {
                                        self.userData.userData.uid = "newuser"
                                        self.createDoc = true
                                        
                                    }
                                }
                                else{
                                    self.userData.userData.uid = "userHasAccount!"
                                    
                                    DispatchQueue.main.async {
                                        self.newUserCreated = true
                                    }
                                }
                                
                                //sign in with custom token. No matter a new account or already existing. It creates a new authentication account if new account.
                                self.auth.signIn(withCustomToken: self.userData.token) { user, error in
                                  
                                    guard user != nil, error == nil else {
                                        return
                                    }
                                    
                                    DispatchQueue.main.async {
                                        self.signedIn = true
                                        self.isGuest = false // no longer a guest.
                                    }
                                }
                                
                                
                            }
                            
                        }
                    } catch let error as NSError {
                        print("Failed to load: \(error.localizedDescription)")
                    }
                }
                
            }

            task.resume()
        }
        
    }
    
    /*
     End: Wallet methods to sign in, create account.
     */
    
    
    /*
     This method is anonyomous sign in for guest users.
     
     This method is not done. It should set "isGuest" to true if signed in anon. but it doesn't. Yet. 
     */
    func enterAsGuest() {
        
        if auth.currentUser == nil {
            auth.signInAnonymously()
            DispatchQueue.main.async {
                self.isGuest = true
            }
          }
        
//         auth.signInAnonymously { authResult, error in
//
//            guard let user = authResult?.user else { return }
//
//            DispatchQueue.main.async {
//                self.isGuest = user.isAnonymous  // true, user is anon and a guest.
//                print(self.isGuest)
//            }
//
//        }
    
    }
    
    
    

}

struct LoginView: View, WalletConnectDelegate {
    func failedToConnect() {
        print("failed to connect")

        //        print(viewModel.walletConnect.session.walletInfo?.approved)
        
    }
    
    func didConnect() {
        
        //if signed in is false.
        if(viewModel.semaphore_WalletConnect){
            //get custom token, convert to swift objects
            let wallet = viewModel.walletConnect.session.walletInfo?.accounts[0] ?? ""
            viewModel.getCustomToken(walletAddress: wallet)
            DispatchQueue.main.async {
                viewModel.semaphore_WalletConnect = false
            }
            
        }

    }
    
    func didDisconnect() {
        print("did disconnect")
        print(viewModel.walletConnect.session.walletInfo?.accounts[0])
        print(viewModel.walletConnect.session.walletInfo?.approved)
    }
    
    
    
    @StateObject var viewModel = LoginAppViewModel()
    let auth = Auth.auth()
    
    @State private var loadView = true //forces loading screen before picking sign in view or tabbar view.
    
    var body: some View {
        
        
        //VStack{
        if viewModel.issignedin() || viewModel.isGuest {
                    TabBarView()
                        .environmentObject(viewModel)
        }

        else {
            
            if(self.loadView){
                VStack {
                    LoadingView(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width)
                        .offset(y:-24)
                    
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.loadView.toggle()
                    }
                }
                
            }
            else{
                
                NavigationView {
                        
                    let screenHeight = viewModel.screenHeight
                    let screenWidth = viewModel.screenWidth
                        
                    VStack {
                        
                        LoginViewLogoAndSubtext(screenHeight: screenHeight, screenWidth: screenWidth)
                            
                        Spacer()
                                
                        LoginViewNavLinks()
                            
                    }
                    
                 }
                .onAppear{
    //                Task{
    //                    await NetworkingCall()
    //                }
                    
                    viewModel.walletConnect = WalletConnect(delegate: self)
                    viewModel.walletConnect.reconnectIfNeeded()
                    
                    // Forcing the rotation to portrait
                    // code locks view in portrait.
                    UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
                    AppDelegate.orientationLock = .portrait
                    
                }
                .navigationBarHidden(true)
                .environmentObject(viewModel)
                
            }

        }
        
        
    }
    
    
    func NetworkingCall() async {
        
    }
}
    


    


struct Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
