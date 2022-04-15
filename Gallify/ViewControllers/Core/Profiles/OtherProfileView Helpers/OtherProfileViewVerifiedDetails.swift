//
//  OtherProfileViewVerifiedDetails.swift
//  Gallify
//
//  Created by Anshul on 1/17/22.
//
import UIKit
import SwiftUI
import FirebaseStorage
import FirebaseFirestore
import FirebaseAuth
import FirebaseUI
import SDWebImageSwiftUI

struct OtherProfileViewVerifiedDetails: View {
    
    @EnvironmentObject var viewModel: TabBarViewModel
    @EnvironmentObject var firestoreQuery: FirestoreQuery
    //@ObservedObject var urlImageModel : UrlImageModel = UrlImageModel(urlString: nil)
    
    let db = Firestore.firestore()
    
    @State var photoUrl: String = ""
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        VStack {
                
            HStack {
                
                if photoUrl == "" {
                    CircleImage(image: Image(systemName: "person.circle.fill"), length: screenWidth / 4, breadth: screenHeight / 8.65, overlayColor: Color.white, overlayRadius: screenWidth / 125, shadowRadius: screenWidth / 125)
                } else {
                WebImage(url: URL(string: firestoreQuery.otherUserData.profileImageUrl))
                       .onSuccess { image, data, cacheType in
                           
                       }
                       .resizable()
                       .placeholder(Image(systemName: "photo"))
                       .placeholder {
                           Circle().foregroundColor(.gray)
                       }
                       .indicator(.activity) // Activity Indicator
                       .transition(.fade(duration: 0.5)) // Fade Transition with duration
                       .scaledToFill()
                       .frame(width: screenWidth / 4, height: screenHeight / 8.65)
                       .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                       .overlay(Circle().stroke(.white, lineWidth: 4))
                }
                
                VStack {
                        
                    HStack {
                        
                        Spacer()
                            
                        VStack {
                                
                            Text("\(firestoreQuery.otherUserData.followers)")
                                .font(.system(size: screenWidth / 18))
                                
                            Text("Followers")
                                .font(.system(size: screenWidth / 23.5))
                                .foregroundColor(Color.gray)
                                
                        }
                        
                        Spacer()
                            
                        VStack {
                                
                            Text("\(firestoreQuery.otherUserData.connections)")
                                .font(.system(size: screenWidth / 18))
                                
                            Text("Connections")
                                .font(.system(size: screenWidth / 23.5))
                                .foregroundColor(Color.gray)
                                
                        }
                            
                        Spacer()

                    }
                    
                    HStack {
                        
                        Spacer()
                            
                        VStack {
                                
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.blue)
                                .frame(width: screenWidth / 22, height: screenHeight / 47.5)
                            
                            Text("Collector")
                                .font(.system(size: screenWidth / 23.5))
                                .foregroundColor(Color.gray)
                            
                            /*Text("\(firestoreQuery.data.job)")
                                .font(.system(size: screenWidth / 23.5))
                                .foregroundColor(Color.gray)*/
                                
                        }
                        .padding(.leading, screenWidth / 22)
                        
                        Spacer()
                            
                        VStack {
                            
                            if firestoreQuery.otherUserData.popularity < 1000 {
                                
                                Text("< 1000")
                                    .font(.system(size: screenWidth / 18))
                                
                            }
                            
                            else {
                                
                                Text("\(firestoreQuery.otherUserData.popularity)")
                                    .font(.system(size: screenWidth / 18))
                                
                            }
                                
                            Text("Monthly Viewers")
                                .font(.system(size: screenWidth / 23.5))
                                .foregroundColor(Color.gray)
                                
                        }
                            
                        Spacer()

                    }
                    .padding(.top, screenHeight / 80)
                    
                }
                .frame(width: screenWidth / 1.65)
                
            }
            
            HStack {
                
                Text("Jack Brown")
                    .font(.system(size: screenWidth / 23.5, weight: .semibold))
                
                /*Text("\(firestoreQuery.data.fullName)")
                    .font(.system(size: screenWidth / 23.5, weight: .semibold))*/
                // Add a field in the User class called fullName (firstName + lastName which will we be used to display user's bio
                
                Spacer()
                
            }
            .padding(.horizontal, screenWidth / 15)
            
            HStack {
                
                Text("Hello, I am using Gallify!")
                    .font(.system(size: screenWidth / 23.5, weight: .light))
                
                /*Text("\(firestoreQuery.data.userBio)")
                    .font(.system(size: screenWidth / 23.5, weight: .light))*/
                // Add a field in the User class called userBio which will be used to display user's bio
                
                Spacer()
                
            }
            .padding(.horizontal, screenWidth / 15)
            
            HStack {
                
                ConnectButton(buttonClicked: false, buttonWidth: screenWidth / 3, buttonHeight: screenHeight / 26)
                    .padding(.horizontal, screenWidth / 125)
                    
                FollowButton()
                    .padding(.horizontal, screenWidth / 125)
                    
            }
            .padding(.vertical, screenHeight / 160)
            
        }
        .padding(.top, screenHeight / 65)
  
    }
    
}

struct OtherProfileViewVerifiedDetails_Previews: PreviewProvider {
    static var previews: some View {
        OtherProfileViewVerifiedDetails()
            .environmentObject(TabBarViewModel())
            .environmentObject(FirestoreQuery())
    }
}
