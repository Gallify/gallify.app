//
//  OtherProfileViewDetails.swift
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

struct OtherProfileViewDetails: View {
    
    @EnvironmentObject var viewModel: TabBarViewModel
    @EnvironmentObject var firestoreQuery: FirestoreQuery
    @EnvironmentObject var loginModel: LoginAppViewModel

    
    var body: some View {
        
        let screenHeight = UIScreen.main.bounds.height //viewModel.screenHeight
        let screenWidth = UIScreen.main.bounds.width //viewModel.screenWidth
        
        VStack {
                
            HStack {
                
                if firestoreQuery.otherUserData.profileImageUrl == "" {
                    /*
                    CircleImage(image: Image(systemName: "circle"), length: screenWidth / 4, breadth: screenHeight / 8.65, overlayColor: Color.white, overlayRadius: screenWidth / 125, shadowRadius: screenWidth / 125)
                    */
                    let defaultImage = "https://avatar.tobi.sh/" + "\(firestoreQuery.otherUserData.uid)" + ".png"
                    WebImage(url: URL(string: defaultImage))
                       // Supports options and context, like `.delayPlaceholder` to show placeholder only when error
                       .onSuccess { image, data, cacheType in
                           // Success
                           // Note: Data exist only when queried from disk cache or network. Use `.queryMemoryData` if you really need data
                       }
                       .resizable()
                       .placeholder(Image("logo")) // Placeholder Image
                       .indicator(.activity) // Activity Indicator
                       .transition(.fade(duration: 0.5)) // Fade Transition with duration
                       .scaledToFill()
                       .frame(width: screenWidth / 4, height: screenHeight / 8.65)
                       .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                       .overlay(Circle().stroke(.white, lineWidth: 4))
                    
                    
                    
                    
                    
                    
                } else {
                    WebImage(url: URL(string: firestoreQuery.otherUserData.profileImageUrl))
                           .onSuccess { image, data, cacheType in
                               
                           }
                           .resizable()
                           .placeholder(Image("logo"))
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
                                
                            Text("\(firestoreQuery.otherUserData.following)")
                                .font(.system(size: screenWidth / 18))
                                
                            Text("Following")
                                .font(.system(size: screenWidth / 23.5))
                                .foregroundColor(Color.gray)
                                
                        }
                            
                        Spacer()

                    }
                    
                }
                .frame(width: screenWidth / 1.65)
                
            }
            
            HStack {
                
                Text(firestoreQuery.otherUserData.displayName)
                    .font(.system(size: screenWidth / 23.5, weight: .semibold))
                
                /*Text("\(firestoreQuery.data.fullName)")
                    .font(.system(size: screenWidth / 23.5, weight: .semibold))*/
                // Add a field in the User class called fullName (firstName + lastName which will we be used to display user's bio
                
                Spacer()
                
            }
            .padding(.horizontal, screenWidth / 15)
            
            HStack {
                
                
                Text(firestoreQuery.otherUserData.description)
                    .font(.system(size: screenWidth / 23.5, weight: .light))
                
                /*Text("\(firestoreQuery.data.userBio)")
                    .font(.system(size: screenWidth / 23.5, weight: .light))*/
                // Add a field in the User class called userBio which will be used to display user's bio
                
                Spacer()
                
            }
            .padding(.horizontal, screenWidth / 15)
            
            
            if(!loginModel.isGuest){
                if(firestoreQuery.otherUserData.uid != firestoreQuery.data.uid ){
                    HStack {
                        
                       
                        FollowButton().environmentObject(firestoreQuery)
                        
                        Spacer()
                            
                    }
                    .padding(.horizontal, screenWidth / 15)
                    .padding(.vertical, screenHeight / 160)
                }
            }
            
            
        }
        .padding(.top, screenHeight / 120)
                
    }
    
}

struct OtherProfileViewDetails_Previews: PreviewProvider {
    static var previews: some View {
        OtherProfileViewDetails()
            .environmentObject(TabBarViewModel())
            .environmentObject(FirestoreQuery())
    }
}
