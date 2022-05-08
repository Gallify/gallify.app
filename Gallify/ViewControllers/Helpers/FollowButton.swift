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
    @State var is_following = false
    

    var body: some View {
        
        Button(action: {
            if firestoreQuery.isFollowing == false { //firestoreQuery.isFollowing
                Task {
                    is_following = true
                    DispatchQueue.main.async {
                        firestoreQuery.isFollowing = true
                    }
                    //await firestoreUpload.follow(uid: firestoreQuery.otherUserData.uid)
                    await firestoreQuery.follow(otherUserId: firestoreQuery.otherUserData.uid)
                    
                }
                
            } else {
                Task {
                    is_following = false
                    DispatchQueue.main.async {
                        firestoreQuery.isFollowing = false
                    }
                   // await firestoreUpload.unfollow(uid: firestoreQuery.otherUserData.uid)
                    await firestoreQuery.unfollow(otherUserId: firestoreQuery.otherUserData.uid)
                    
                }
                
            }
            //firestoreQuery.isFollowing.toggle()
        }) {
            ZStack {
                
                RoundedRectangle(cornerRadius: 3)
                    .foregroundColor(firestoreQuery.isFollowing ? .white : Color("Gallify-Pink"))
                    .frame(width: (buttonWidth), height: buttonHeight)
                    .overlay(firestoreQuery.isFollowing ? RoundedRectangle(cornerRadius: 3) //buttonWidth / 8
                    .stroke(Color.gray, lineWidth: buttonWidth / 125) : RoundedRectangle(cornerRadius: 3)
                    .stroke(Color("Gallify-Pink"), lineWidth: buttonWidth / 70)) //, lineWidth: buttonWidth / 50)
                
                Text(firestoreQuery.isFollowing ? "Following" : "Follow")
                    .font(.system(size: buttonWidth / 10, weight: .bold))
                    .foregroundColor(firestoreQuery.isFollowing ? .black : .white)
                
            }.onAppear { async {await NetworkingCall()}}
        }
        
    }
    
    func NetworkingCall() async{
        
        //checks if the current user is a follow of the OtherUser.
        await firestoreQuery.checkIfFollowing(otherUserId: firestoreQuery.otherUserData.uid)
        
        
        
        print("is following? nwk")
        print(firestoreQuery.isFollowing)
        is_following = firestoreQuery.isFollowing
        
//        await firestoreQuery.fetchFollowers(uid: "yTUlw63RJVVsLik5MzqG3ecUMCs1")
//        print("Followers array in networking call = ", firestoreQuery.followers.followers)
//        DispatchQueue.main.async {
//            if firestoreQuery.followers.followers.contains(((Auth.auth().currentUser?.uid)! as String?)!) {
//                DispatchQueue.main.async {
//                    firestoreQuery.isFollowing = true
//                }
//
//            } else {
//                DispatchQueue.main.async {
//                    firestoreQuery.isFollowing = false
//                }
//
//
//            }
//            print("value of isFollowing = ", firestoreQuery.isFollowing)
//        }
        
    }
        
}



//struct FollowButton_Previews: PreviewProvider {
//    static var previews: some View {
//        FollowButton(isFollowing: true, buttonWidth: UIScreen.main.bounds.width / 3, buttonHeight: UIScreen.main.bounds.width / 12)
//    }
//}
