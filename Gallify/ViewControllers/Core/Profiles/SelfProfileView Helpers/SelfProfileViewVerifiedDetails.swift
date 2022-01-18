//
//  SelfProfileViewVerifiedDetails.swift
//  Gallify
//
//  Created by Anshul on 1/16/22.
//

import UIKit
import SwiftUI
import FirebaseStorage
import FirebaseFirestore
import FirebaseAuth
import FirebaseUI
import SDWebImageSwiftUI

struct SelfProfileViewVerifiedDetails: View {
    
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
                WebImage(url: URL(string: firestoreQuery.data.profileImageUrl))
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
                       .frame(width: screenWidth / 4, height: screenHeight / 8.65)
                       .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                       .overlay(Circle().stroke(.white, lineWidth: 4))
                }
                
                VStack {
                        
                    HStack {
                        
                        Spacer()
                            
                        VStack {
                                
                            Text("\(firestoreQuery.data.followers)")
                                .font(.system(size: screenWidth / 18))
                                
                            Text("Followers")
                                .font(.system(size: screenWidth / 23.5))
                                .foregroundColor(Color.gray)
                                
                        }
                        
                        Spacer()
                            
                        VStack {
                                
                            Text("\(firestoreQuery.data.connections)")
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
                            
                            if firestoreQuery.data.popularity < 1000 {
                                
                                Text("< 1000")
                                    .font(.system(size: screenWidth / 18))
                                
                            }
                            
                            else {
                                
                                Text("\(firestoreQuery.data.popularity)")
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
            
        }
        .padding(.top, screenHeight / 65)
        
    }
    
}

struct SelfProfileViewVerifiedDetails_Previews: PreviewProvider {
    static var previews: some View {
        SelfProfileViewVerifiedDetails()
            .environmentObject(TabBarViewModel())
            .environmentObject(FirestoreQuery())
    }
}

