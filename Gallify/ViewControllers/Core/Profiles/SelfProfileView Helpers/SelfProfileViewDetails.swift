//
//  SelfProfileViewDetails.swift
//  Gallify
//
//  Created by Anshul on 9/13/21.
//
import UIKit
import SwiftUI
import FirebaseStorage
import FirebaseFirestore
import FirebaseAuth
import FirebaseUI
import SDWebImageSwiftUI

struct SelfProfileViewDetails: View {
    
    @EnvironmentObject var profileViewModel : SelfProfileViewModel
    @ObservedObject var firestoreQuery = FirestoreQuery()
    
    let screenHeight: CGFloat = UIScreen.main.bounds.height
    let screenWidth: CGFloat = UIScreen.main.bounds.width
    let db = Firestore.firestore()
    
    @State var photoUrl : String = ""
    
    func downloadUrl() {
        do {
            let downloadRef = try Storage.storage().reference(forURL: "gs://gallify-64bbb.appspot.com/profileImages/" + (Auth.auth().currentUser?.email ?? ""))
            getProfileImage(downloadRef: downloadRef)
        } catch {
            self.photoUrl = ""
        }
    }
    
    func getProfileImage(downloadRef: StorageReference) {
        downloadRef.downloadURL { (url, error) in
            if let error = error {
                // Handle any errors
            } else {
                // Get the download URL for 'images/stars.jpg'
                self.photoUrl = url!.absoluteString
                print(self.photoUrl)
            }
        }
       
    }
    
    init() {
        firestoreQuery.fetchUser()
    }

    var body: some View {
        
        VStack {
                
            HStack {
                if photoUrl == "" {
                    CircleImage(image: Image(systemName: "person.circle.fill"), length: screenWidth / 4, breadth: screenHeight / 8.65, overlayColor: Color.white, overlayRadius: screenWidth / 125, shadowRadius: screenWidth / 125)
                } else {
                    WebImage(url: URL(string: photoUrl))
                       // Supports options and context, like `.delayPlaceholder` to show placeholder only when error
                       .onSuccess { image, data, cacheType in
                           // Success
                           // Note: Data exist only when queried from disk cache or network. Use `.queryMemoryData` if you really need data
                       }
                       .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                       .placeholder(Image(systemName: "photo")) // Placeholder Image
                       // Supports ViewBuilder as well
                       .placeholder {
                           Circle().foregroundColor(.gray)
                       }
                       .indicator(.activity) // Activity Indicator
                       .transition(.fade(duration: 0.5)) // Fade Transition with duration
                       .scaledToFit()
                       .frame(width: 100, height: 100, alignment: .center)
                       .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                       .overlay(Circle().stroke(/*.white,*/ lineWidth: 4))
                       .shadow(radius: 3)
                            
                }
            
                    
                VStack {
                        
                    HStack {
                            
                        VStack {
                                
                            Text("\(firestoreQuery.data.followers)")
                                .font(.system(size: screenWidth / 17))
                                
                            Text("Followers")
                                .font(.system(size: screenWidth / 23.5))
                                .foregroundColor(Color.gray)
                                
                        }
                            
                        VStack {
                                
                            Text("\(firestoreQuery.data.following)")
                                .font(.system(size: screenWidth / 17))
                                
                            Text("Following")
                                .font(.system(size: screenWidth / 23.5))
                                .foregroundColor(Color.gray)
                                
                        }
                            
//                        VStack {
//
//                            Text(firesto)
//                                .font(.system(size: screenWidth / 17))
//
//                            Text("Likes")
//                                .font(.system(size: screenWidth / 23.5))
//                                .foregroundColor(Color.gray)
//
//                        }

                    }
                        
                    HStack {
                            
                        VStack {
                                                            
                            Text("\(firestoreQuery.data.rarity)")
                                .font(.system(size: screenWidth / 17))
                                
                            Text("Rarity")
                                .font(.system(size: screenWidth / 23.5))
                                .foregroundColor(Color.gray)
                                
                        }
                            
//                        VStack {
//                                
//                            Text("Hardcoded value")
//                                .font(.system(size: screenWidth / 17))
//                                
//                            Text("Views")
//                                .font(.system(size: screenWidth / 23.5))
//                                .foregroundColor(Color.gray)
//                                
//                        }

                    }
                    .padding(.top, screenHeight / 80)
                        
                }
                .frame(width: screenWidth / 1.75)
                    
            }
            .padding(.top, screenHeight / 54)
                
            HStack {
                    
                Text(firestoreQuery.data.username)
                    .font(.system(size: screenWidth / 22, weight: .medium))
                    
                Spacer()
                    
            }
            .padding(.leading, screenWidth / 15)
                
            HStack {
                    
                Text("Making the world a better place with my existence.")
                    .font(.system(size: screenWidth / 23.5, weight: .light))
                
                Spacer()
                
            }
            .padding(.horizontal, screenWidth / 15)
                
        }.onAppear{
            self.downloadUrl()
            
        }
                
    }
    
}

struct SelfProfileViewDetails_Previews: PreviewProvider {
    static var previews: some View {
        SelfProfileViewDetails()
    }
}
