//
//  FirestoreQuerysService.swift
//  Gallify
//
//  Created by Shruti Sharma on 11/7/21.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class FirestoreQuery : ObservableObject {
    
    let db = Firestore.firestore()
    
    @Published var data : User = User()
    
    var email : String = ""
    
    func fetchUser()  {
//        let email1 = data.email
//        print(email1)
        let docRef = db.collection("users").document("tejvirmann12@gmail.com")
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
                     self.email = user.email
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
    
    // MARK: Base Methods
    
    //private let db = Firestore.firestore()
    //private var data = [String:Any]()
    
    init() {}
    
    func decode<T : Decodable>(fromDictionary: [String : Any]) throws -> T {
        let data = try JSONSerialization.data(withJSONObject: fromDictionary)
        return try JSONDecoder().decode(T.self, from: data)
    }
    
//    func query(email: String) -> [String:Any] {
//        db.collection("users").whereField("email", isEqualTo:email)
//            .getDocuments() { [self] (querySnapshot, err) in
//                if let err = err {
//                    print("Error getting documents: \(err)")
//                } else {
//                    for document in querySnapshot!.documents {
//                        //self.data = document.data().map(String.init(describing:)) ?? "nil"
//                        self.data = document.data()
//                    }
//                }
//        }
//        return data
//    }
    
    //get data for page. Home. Discover. Profile.
    func pagequery(page: String){
        let capitalCities = db.collection("cities").whereField("capital", isEqualTo: true)
        let capitalCikties = db.collection("cities").whereField("capital", isEqualTo: true)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                    }
                }
        }
        let capitalCiktiesjj = db.collection("cities").document("SF")
            .addSnapshotListener { documentSnapshot, error in
              guard let document = documentSnapshot else {
                print("Error fetching document: \(error!)")
                return
              }
              guard let data = document.data() else {
                print("Document data was empty.")
                return
              }
              print("Current data: \(data)")
            }
        
        let capitalCiktiesjjk = db.collection("cities").whereField("state", isEqualTo: "CA")
            .addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("Error fetching documents: \(error!)")
                    return
                }
                let cities = documents.map { $0["name"]! }
                print("Current cities in CA: \(cities)")
            }

        
//        let city = City(name: "Los Angeles",
//                        state: "CA",
//                        country: "USA",
//                        isCapital: false,
//                        population: 5000000)
//
//        do {
//            try db.collection("cities").document("LA").setData(from: city)
//        } catch let error {
//            print("Error writing city to Firestore: \(error)")
//        }
        
        let docData: [String: Any] = [
            "stringExample": "Hello world!",
            "booleanExample": true,
            "numberExample": 3.14159265,
            "dateExample": Timestamp(date: Date()),
            "arrayExample": [5, true, "hello"],
            "nullExample": NSNull(),
            "objectExample": [
                "a": 5,
                "b": [
                    "nested": "foo"
                ]
            ]
        ]
        db.collection("data").document("one").setData(docData) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
//    func getJStoreUserFromDB() {
//        let db = Firestore.firestore()
//        let user = Auth.auth().currentUser
//        db.collection("users").document((user?.email)!).getDocument() {
//            (document, error) in
//            let result = Result {
//                try document.flatMap {
//                    try $0.data(as: JStoreUser.self)
//                }
//            }
//        }
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
