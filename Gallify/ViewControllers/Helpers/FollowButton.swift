//
//  FollowButton.swift
//  Gallify
//
//  Created by Anshul on 9/14/21.
//
import SwiftUI
import FirebaseAuth
import FirebaseFirestore


struct FollowButton: View {
    
    //@State private var isFollowing: Bool = false
   
    var buttonWidth: CGFloat = UIScreen.main.bounds.width / 3
    var buttonHeight: CGFloat = UIScreen.main.bounds.width / 12
    
    var firestoreUpload : FirestoreUploadService = FirestoreUploadService()

    @EnvironmentObject var firestoreQuery : FirestoreQuery
    
    init() {
        
//        let doc = Firestore.firestore().collection("users").document("yTUlw63RJVVsLik5MzqG3ecUMCs1").collection("profile").whereField("followers", arrayContains: (Auth.auth().currentUser?.uid)! as String)
//
//        if doc != nil {
//            firestoreQuery.isFollowing = true
//        } else {
//            firestoreQuery.isFollowing = false
//        }
        
    }

    var body: some View {
        
        Button(action: {
            if firestoreQuery.isFollowing == false {
                Task {
                    await firestoreUpload.follow(uid: "yTUlw63RJVVsLik5MzqG3ecUMCs1")
                }
                
            } else {
                Task {
                    await firestoreUpload.unfollow(uid: "yTUlw63RJVVsLik5MzqG3ecUMCs1")
                }
                
            }
            firestoreQuery.isFollowing.toggle()
        }) {
            ZStack {
                
                RoundedRectangle(cornerRadius: buttonWidth / 8)
                    .foregroundColor(firestoreQuery.isFollowing ? .white : .pink)
                    .frame(width: buttonWidth, height: buttonHeight)
                    .overlay(firestoreQuery.isFollowing ? RoundedRectangle(cornerRadius: buttonWidth / 8).stroke(Color.gray, lineWidth: buttonWidth / 125) : RoundedRectangle(cornerRadius: buttonWidth / 8).stroke(Color.pink, lineWidth: buttonWidth / 50))
                
                Text(firestoreQuery.isFollowing ? "Following" : "Follow")
                    .font(.system(size: buttonWidth / 10, weight: .bold))
                    .foregroundColor(firestoreQuery.isFollowing ? .black : .white)
                
            }.onAppear { async {await NetworkingCall()}}
        }
        
    }
    
    func NetworkingCall() async{
        
        await firestoreQuery.fetchFollowers(uid: "yTUlw63RJVVsLik5MzqG3ecUMCs1")
        print("Followers array in networking call = ", firestoreQuery.followers.followers)
        DispatchQueue.main.async {
            if firestoreQuery.followers.followers.contains(((Auth.auth().currentUser?.uid)! as String?)!) {
                DispatchQueue.main.async {
                    firestoreQuery.isFollowing = true
                }
                    
            } else {
                DispatchQueue.main.async {
                    firestoreQuery.isFollowing = false
                }
                    
                
            }
            print("value of isFollowing = ", firestoreQuery.isFollowing)
        }
        
    }
        
}



//struct FollowButton_Previews: PreviewProvider {
//    static var previews: some View {
//        FollowButton(isFollowing: true, buttonWidth: UIScreen.main.bounds.width / 3, buttonHeight: UIScreen.main.bounds.width / 12)
//    }
//}
