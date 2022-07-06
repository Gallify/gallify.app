//
//  FirestoreQuerysService.swift
//  Gallify
//
//  Created by Shruti Sharma on 11/7/21.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
import Firebase

@MainActor
class FirestoreQuery : ObservableObject {
    
    /*
     The FirestoreQuery Class is responsible for all get, post, update, and delete functions for Gallify.
     
    This file is the main FirestoreQuery file. All other files are extensions of this file.
    Below is a dictionary to help us keep track of where all methods are.
     
       Format: <File, Method, Param, Return>
        get, getFeaturedArt_await, playlist_id, art_array
     
     
     PRIVACY: 0 = private, 1= public
     CONTENTTYPE: 0=image/gif, 1=usdz, 2=video, 3=attack-helicopter.
        
     */
    
    
    //for drop down reeels
    @Published var maximized = false
    @Published var minimized = false
    @Published var isClosed = false
    @Published var sheetMode: SheetMode = .none
    
    //AR Player Camera/Reels
    @Published var models: [Model] = []
    @Published var showCameraScreen = false
    @Published var cameraPlaying = false
    @Published var showNewScreen = false
    @Published var bothScreensMinimized = true //both = camera/ar player and the reels screen
    
    @Published var artPlaying = false
    @Published var artisClicked = "artisClicked"
    @Published var artThatsPlaying: Art = Art()
    @Published var playlistThatsPlaying: Playlist = Playlist()
    @Published var artworkThatsPlaying: [Art] = [Art]()
    @Published var scrollTo = -1 //once art is clicked, this variable determines where to scroll to in the 'reels' view.
    
    
    //action menus. (search, reel, playlist, art)
    @Published var showPlaylistOptions = false
    @Published var showArtOptions = false
    @Published var showReelArtOptions = false //art options for reel
    @Published var showGenericArtOptions = false //art options for generic playlist
    @Published var showSearchArtOptions = false //art options for search
    @Published var showFeaturedOptions = false
    
    
    @Published var isPresented = false //for drop down reels. To know when to present. Not firestore related at all.
    
    //tabbar
    @Published var data : User = User() //for the current user.
    
    //self profile
    @Published var userLibrary: [Playlist] = [Playlist]()
    @Published var featuredPlaylist: Playlist = Playlist()
    @Published var featuredArt: [Art] = [Art]()
    @Published var likedArt: [Art] = [Art]()
    @Published var followers = Followers()
    @Published var following = Following()
    @Published var isFollowing : Bool = false
    @Published var isLiked :Bool = false
    
    
    //other profile
    @Published var otherUserData : User = User()
    @Published var otherLibrary: [Playlist] = [Playlist]()
    @Published var otherFeaturedPlaylist: Playlist = Playlist()
    @Published var otherFeaturedArt: [Art] = [Art]()
    
    //home
    @Published var homeMuseumList: MuseumList = MuseumList()
    @Published var homeMuseums: [Museum] = [Museum]()
    @Published var homePlaylists: [[Playlist]] = [[Playlist]]()
    
    //discover-search
    @Published var searchText = ""
    @Published var foundContacts: [Art] = [Art]() //todo: change 'foundContacts' with 'searchResults' search results stored here.
    @Published var foundContacts_users: [User] = [User]() //todo: change 'foundContacts' with 'searchResults' search results stored here.
    @Published var recentSearches: [Art] = [Art]() //recent searches here
   
    //discover-content
    @Published var discoveryPageArt: [Art] = [Art]() //discover page content here.
    var getNextBatch = false
    var lastDocument: QueryDocumentSnapshot!
    var lastDocuments = [QueryDocumentSnapshot]()
    var discoverQuery: Query!
    
    //settings
    
    
    //list
    @Published var playlist: Playlist = Playlist()
    @Published var playlistArt: [Art] = [Art]()
    @Published var art: Art = Art()
    
    //Admin art Approval
    @Published var artInReview = [Art]()
    var inReviewQuery: Query!
    var getNext : Bool = false
    var lastDoc : QueryDocumentSnapshot!
    
    
    //basic
    static let db = Firestore.firestore()
    static let userId = Auth.auth().currentUser?.uid
    
    enum DatabaseError: String, Error{
        case failed = "failed"
    }

    
    
    
    
    
    
    /*
     Get User information
     */
    func getUser() {
        let userId = Auth.auth().currentUser?.uid
        print("EMAIL")
        print(userId)
        
        FirestoreQuery.db.collection("users").document(userId ?? "info@gallify.app") //If user can't get email, we need alternate fix.
            .addSnapshotListener { queryDocumentSnapshot, error in
                if error == nil { //if no errors
                    if let document = queryDocumentSnapshot{
                        //update list in main thread.
                        DispatchQueue.main.async{
                            //set retrieved document to @published data object
                            self.data = try! document.data(as: User.self)! //this is forceful, and assumes this will always work...
                        }
                        
                    }
                    else{
                        print("Error: There aren't any documents, getUser()")
                        return
                    }
                }
                else{
                    print("Error: Can't get document, getUser()")
                    return
                }
      }
        print("Email: \(data.email)")
    }
    
    
    func fetchUser() {
        let docRef = FirestoreQuery.db.collection("users").document(Auth.auth().currentUser!.uid)
         docRef.getDocument { (document, error) in
           let result = Result {
            try document?.data(as: User.self)
           }
           switch result {
           case .success(let user):
             if let user = user {
               // A `User` value was successfully initialized from the DocumentSnapshot
               //set data to user in the main thread since call is completed in background
               DispatchQueue.main.async {
                 self.data = user
               }
             } else {
               // A nil value was successfully initialized from the DocumentSnapshot,
               // or the DocumentSnapshot was nil.
               print("Document does not exist")
             }
           case .failure(let error):
             // A `User` value could not be initialized from the DocumentSnapshot.
             print("Error decoding user: \(error)")
           }
         }
      }
    
    func fetchFollowers(uid: String) async {
//        let docRef = await Firestore.firestore().collection("users").document(uid).collection("profile").document("followers")
//        docRef.getDocument { (document, error) in
//          let result = Result {
//           try document?.data(as: Followers.self)
//          }
//          switch result {
//          case .success(let followerList):
//            if let followerList = followerList {
//              // A `User` value was successfully initialized from the DocumentSnapshot
//              //set data to user in the main thread since call is completed in background
//
//                DispatchQueue.main.async {
//                    self.followers.followers = followerList.followers
//                }
//
//            } else {
//              // A nil value was successfully initialized from the DocumentSnapshot,
//              // or the DocumentSnapshot was nil.
//              print("Document does not exist")
//            }
//          case .failure(let error):
//            // A `User` value could not be initialized from the DocumentSnapshot.[
//            print("Error decoding Followers: \(error)")
//          }
//        }
        
         await FirestoreQuery.db.collection("users").document(uid).collection("profile").document("followers")
             .addSnapshotListener { queryDocumentSnapshot, error in
                 if error == nil { //if no errors
                     if let document = queryDocumentSnapshot{
                         //update list in main thread.
                         DispatchQueue.main.async{
                             //set retrieved document to @published data object
                             self.followers.followers = try! document.data(as: Followers.self)?.followers as! [String] //this is forceful, and assumes this will always work...
                             print("followers array in firestore query = ", self.followers.followers)
                         }
                         print("followers array in firestore query = ", self.followers.followers)
                     }
                     else{
                         print("Error: There aren't any documents, getPlaylist()")
                         return
                     }
                 }
                 else{
                     print("Error: Can't get document, getPlaylist()")
                     return
                 }
    }
    }

    
//    func fetchFollowers(uid: String) async {
//        let uid = (Auth.auth().currentUser?.uid)!
//
//        if uid != nil {
//            do {
//
//                let doc = try! await FirestoreQuery.db.collection("users")
//                    .document(uid).collection("profile").document("followers")
//                    .getDocument().data(as: Followers.self)
//
//                guard let followerList = doc else {
//                     throw DatabaseError.failed
//                }
//                DispatchQueue.main.async {
//
//                self.followers.followers = followerList.followers
//                    print("FOLLOWERS ARRAY = ", followerList.followers)
//                }
//            }
//            catch{
//                print("Error")
//            }
//        }
//
//    }
    
    func get_art(a: String)  {
//        let email1 = data.email
//        print(email1)
        let docRef = FirestoreQuery.db.collection("art").document(a)
         docRef.getDocument { (document, error) in
             let result = Result {
                try document?.data(as: Art.self)
             }
             switch result {
             case .success(let art):
                 if let art = art {
                     // A `User` value was successfully initialized from the DocumentSnapshot
                     //set data to user in the main thread since call is completed in background
                     DispatchQueue.main.async {
                         self.art = art
                         print(self.art.name)
                     }
                     print(self.art)
                 } else {
                     // A nil value was successfully initialized from the DocumentSnapshot,
                     // or the DocumentSnapshot was nil.
                     print("Document does not exist")
                 }
             case .failure(let error):
                 // A `User` value could not be initialized from the DocumentSnapshot.
                 print("Error decoding user: \(error)")
             }
         }
    }
    
    /*
     Input art id.
     Then changes published Art variable labeled 'art'
     */
    func getArtSnapshot(a: String) {
       
        FirestoreQuery.db.collection("art").document(a) //If user can't get email, we need alternate fix.
            .addSnapshotListener { queryDocumentSnapshot, error in
                if error == nil { //if no errors
                    if let document = queryDocumentSnapshot{
                        //update list in main thread.
                        DispatchQueue.main.async{
                            //set retrieved document to @published data object
                            self.art = try! document.data(as: Art.self)! //this is forceful, and assumes this will always work...
                        }
                        
                    }
                    else{
                        print("Error: There aren't any documents, getArt()")
                        return
                    }
                }
                else{
                    print("Error: Can't get document, getArt()")
                    return
                }
      }
        print("Art Name: \(art.name)")
    }
    

    /*
     Input playlist id.
     Updates "playlist" published variable.
     */
    func getPlaylist(a: String) {
       
        FirestoreQuery.db.collection("playlists").document(a) //If user can't get email, we need alternate fix.
            .addSnapshotListener { queryDocumentSnapshot, error in
                if error == nil { //if no errors
                    if let document = queryDocumentSnapshot{
                        //update list in main thread.
                        DispatchQueue.main.async{
                            //set retrieved document to @published data object
                            self.playlist = try! document.data(as: Playlist.self)! //this is forceful, and assumes this will always work...
                        }
                        
                    }
                    else{
                        print("Error: There aren't any documents, getPlaylist()")
                        return
                    }
                }
                else{
                    print("Error: Can't get document, getPlaylist()")
                    return
                }
      }
        print("Art Name: \(playlist.name)")
    }
    
    /*
     Input playlist id.
     Updates "playlist" published variable.
     */
    func getFeaturedPlaylist(a: String) {
       
        FirestoreQuery.db.collection("playlists").document(a) //If user can't get email, we need alternate fix.
            .addSnapshotListener { queryDocumentSnapshot, error in
                if error == nil { //if no errors
                    if let document = queryDocumentSnapshot{
                        //update list in main thread.
                        DispatchQueue.main.async{
                            //set retrieved document to @published data object
                            self.featuredPlaylist = try! document.data(as: Playlist.self)! //this is forceful, and assumes this will always work...
            
                        }
                        
                    }
                    else{
                        print("Error: There aren't any documents, getPlaylist()")
                        return
                    }
                }
                else{
                    print("Error: Can't get document, getPlaylist()")
                    return
                }
      }
        print("Art Name: \(featuredPlaylist.name)")
    }
    
    /*
     Input: Library Array.
     
     Output: Published Library variable now contains array of playlist elements.
     
     This method needs to be checked.
     */
    func getLibrary(library_ids: [String]) {
        self.userLibrary.removeAll()
        print("libaryids")
        print(library_ids)
        for library_id in library_ids {
            FirestoreQuery.db.collection("playlists").document(library_id) //If user can't get email, we need alternate fix.
                .addSnapshotListener { queryDocumentSnapshot, error in
                    if error == nil { //if no errors
                        if let document = queryDocumentSnapshot{
                            //update list in main thread.
                            DispatchQueue.main.async{
                                //set retrieved document to @published data object
                                print("document")
                                print(document)
                                print(library_id)
                                self.userLibrary.append(try! document.data(as: Playlist.self)!) //this is forceful, and assumes this will always work...
                            }
                            
                        }
                        else{
                            print("Error: There aren't any documents, getPlaylists()")
                            return
                        }
                    }
                    else{
                        print("Error: Can't get document, getPlaylists()")
                        return
                    }
          }
            
            
        }
    }
    
    
    
    /*
     Input: Library Array.
     
     Output: Published Library variable now contains array of playlist elements.
     
     This method needs to be checked.
     */
    func getFeaturedPlaylistArt2(art_ids: [String]) {
        self.featuredArt.removeAll()
        
        for art_id in art_ids {
            FirestoreQuery.db.collection("art").document(art_id) //If user can't get email, we need alternate fix.
                .addSnapshotListener { queryDocumentSnapshot, error in
                    if error == nil { //if no errors
                        if let document = queryDocumentSnapshot{
                            //update list in main thread.
                            DispatchQueue.main.async{
                                 //set retrieved document to @published data object
                                
                                self.featuredArt.append(try! document.data(as: Art.self)!) //this is forceful, and assumes this will always work...
                            }
                            
                        }
                        else{
                            print("Error: There aren't any documents, getPlaylists()")
                            return
                        }
                    }
                    else{
                        print("Error: Can't get document, getPlaylists()")
                        return
                    }
          }
            
            
        }
    }
    
    /*
     Input: Library Array.
     
     Output: Published Library variable now contains array of playlist elements.
     
     This method needs to be checked.
     */
    func getFeaturedPlaylistArt() {
        self.featuredArt.removeAll()
        print("INSIDE FEATURED PLAYLIST ART")
        //get art ids.
        getFeaturedPlaylist(a: data.featured)
        
        for art_id in featuredPlaylist.art {
            FirestoreQuery.db.collection("art").document(art_id) //If user can't get email, we need alternate fix.
                .addSnapshotListener { queryDocumentSnapshot, error in
                    if error == nil { //if no errors
                        if let document = queryDocumentSnapshot{
                            //update list in main thread.
                            DispatchQueue.main.async{
                                 //set retrieved document to @published data object
                                print("GOTTEN 5 ARTS")
                                self.featuredArt.append(try! document.data(as: Art.self)!) //this is forceful, and assumes this will always work...
                            }
                            
                        }
                        else{
                            print("Error: There aren't any documents, getPlaylists()")
                            return
                        }
                    }
                    else{
                        print("Error: Can't get document, getPlaylists()")
                        return
                    }
          }
        }
        
        
    }
    
    
    
    
    
    
    //    init(){
    //        self.getUser()
    //        print("init user data. \(data.email)")
    //       // getMuseumList(coll_name: "users", sub_coll_name: "home", user: "t30@gmail.com", sub_doc: "home")
    //      //  getMuseumList2(coll_name: "users", sub_coll_name: "home", user: "t30@gmail.com", sub_doc: "home")
    //    }
//    func getMuseumList2(coll_name: String, sub_coll_name: String, user: String, sub_doc: String) {
//
//        let docRef = FirestoreQuery.db.collection("users").document(FirestoreQuery.userEmail ?? "help").collection("home").document("home")
//         docRef.getDocument { (document, error) in
//           let result = Result {
//            try document?.data(as: MuseumList.self)
//           }
//           switch result {
//           case .success(let user):
//             if let user = user {
//               // A `User` value was successfully initialized from the DocumentSnapshot
//               //set data to user in the main thread since call is completed in background
//               DispatchQueue.main.async {
//                 self.museumlist = user
//               }
//             } else {
//               // A nil value was successfully initialized from the DocumentSnapshot,
//               // or the DocumentSnapshot was nil.
//               print("Document does not exist")
//             }
//           case .failure(let error):
//             // A `User` value could not be initialized from the DocumentSnapshot.
//             print("Error decoding user: \(error)")
//           }
//         }
//      }




    /*
     Get Museum Ids List
         @params.
         coll_name = collection name. ex user
         sub_coll_name = sub collection name. ex. home
         user = email or username of user, used as doc id.
         sub_doc = document inside of subcollection. ex. home or feed.
     */
//    func getMuseumList(coll_name: String, sub_coll_name: String, user: String, sub_doc: String) {
//        //print("Email:\((Auth.auth().currentUser?.email)!) ")
//
//        FirestoreQuery.db.collection("users").document(FirestoreQuery.userEmail ?? "info@gallify.app").collection("home").document("home")
//                    .addSnapshotListener { queryDocumentSnapshot, error in
//                        if error == nil { //if no errors
//                            if let document = queryDocumentSnapshot{
//                                //update list in main thread.
//                                DispatchQueue.main.async{
//                                    //set retrieved document to @published data object
//                                    self.museumlist = try! document.data(as: MuseumList.self)! //this is forceful, and assumes this will always work...
//                                    print("List of Museums: \(self.museumlist.museums)")
//                                }
//                            }
//                            else{
//                                print("Error: There aren't any documents, getMuseumList()")
//                                return
//                            }
//                        }
//                        else{
//                            print("Error: Can't get document, getMuseumList()")
//                            return
//                        }
//              }
//    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // MARK: Get Methods
    //CRUD (Create, Read/Get, Update, Delete)
    
    //Get content
    /*
     This method fetches an image file given its url. urls will be from firebase or ipfs.
     */
    func getimage(url: Data){}
    
    /*
     This method fetches a usdz file given its url. urls will be from firebase or ipfs.
     */
    func getusdz(){}
   
    /*
     This method fetches a video file given its url. urls will be from firebase or ipfs.
     */
    func getvideo(){}
    

    //Read methods for a screen.
    
    /*
     Get data to fill out profile. For user.
     */
    func get_user_profile(){}
    
    /*
     Get data to fill out profile. For non-user.
     */
    func get_profile(){}
    
    /*
     Get data to fill out home for a user.
     */
    func get_home(){}
    
    /*
     Get reel data.
     */
    func get_reel(){}
    
    /*
     Get list data. ex. Liked, Recent Activity.
     */
    func get_list(){}
    
    /*
     Get's art.
     */
    func get_art(){}
    
    
    
    
    
}
