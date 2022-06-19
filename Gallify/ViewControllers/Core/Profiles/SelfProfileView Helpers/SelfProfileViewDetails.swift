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
                
                if firestoreQuery.data.profileImageUrl == "" {
                    /*
                    CircleImage(image: Image(systemName: "circle"), length: screenWidth / 4, breadth: screenHeight / 8.65, overlayColor: Color.white, overlayRadius: screenWidth / 125, shadowRadius: screenWidth / 125)
                    */
                    
                    //SVG's don't work in swift atm. Need a library to use this.
                    let defaultImage = "https://avatar.tobi.sh/" + "\(firestoreQuery.data.uid)" + ".svg"
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
                    
                    
                }
                else {
                    WebImage(url: URL(string: firestoreQuery.data.profileImageUrl))
                       // Supports options and context, like `.delayPlaceholder` to show placeholder only when error
                       .onSuccess { image, data, cacheType in
                           // Success
                           // Note: Data exist only when queried from disk cache or network. Use `.queryMemoryData` if you really need data
                       }
                       .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                       .placeholder(Image("logo")) // Placeholder Image
                       // Supports ViewBuilder as well
//                       .placeholder {
//                           Circle().foregroundColor(.gray)
//                       }
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
                                
                            Text("\(firestoreQuery.data.followers)")
                                .font(.system(size: screenWidth / 18))
                                
                            Text("Followers")
                                .font(.system(size: screenWidth / 23.5))
                                .foregroundColor(Color.gray)
                                
                        }
                        
                        Spacer()
                            
                        VStack {
                                
                            Text("\(firestoreQuery.data.following)")
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
                
                Text(firestoreQuery.data.displayName)
                    .font(.system(size: screenWidth / 23.5, weight: .semibold))
                
                /*Text("\(firestoreQuery.data.fullName)")
                    .font(.system(size: screenWidth / 23.5, weight: .semibold))*/
                // Add a field in the User class called fullName (firstName + lastName which will we be used to display user's bio
                
                Spacer()
                
            }
            .padding(.horizontal, screenWidth / 15)
            
            HStack {
                
                Text(firestoreQuery.data.description)
                    .font(.system(size: screenWidth / 23.5, weight: .light))
                
                /*Text("\(firestoreQuery.data.userBio)")
                    .font(.system(size: screenWidth / 23.5, weight: .light))*/
                // Add a field in the User class called userBio which will be used to display user's bio
                
                
                Spacer()
                
            }
            .padding(.horizontal, screenWidth / 15)
            
//            Link("\(firestoreQuery.data.shareUrl)", destination: URL(string: firestoreQuery.data.shareUrl)!)
//                .environment(\.openURL, OpenURLAction { url in
//                    print("Open \(url)")
//                    return .handled
//                })
            
        }
        .padding(.top, screenHeight / 120)
        .padding(.bottom, 10)
        
        Spacer()
                
    }
                
}
        
struct SelfProfileViewDetails_Previews: PreviewProvider {
    static var previews: some View {
        SelfProfileViewDetails()
            .environmentObject(TabBarViewModel())
            .environmentObject(FirestoreQuery())

    }
}
            

