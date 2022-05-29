//
//  UserSearchResult.swift
//  Gallify
//
//  Created by Anshul on 4/8/22.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth
import SDWebImageSwiftUI

@MainActor
struct UserSearchResult: View {
        
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    let user: User
    @State var showingSheet = false
    
    @EnvironmentObject var firestoreQuery: FirestoreQuery
        
    var body: some View {
        
        
        
        NavigationLink(destination: OtherProfileView(otherUserId: user.uid), // thePlaylist or playlistOwner.uid
                    label: {
                                            
            HStack {
                    
                WebImage(url: URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: screenWidth / 7.5, height: screenHeight / 16.25)
                    //.clipped()
                    .clipShape(Circle())
                    
                VStack(alignment: .leading) {
                    
                    Text(user.username)
                        .font(.system(size: screenWidth / 20, weight: .semibold))
                    
                    Text(user.firstName + user.lastName)
                        .font(.system(size: screenWidth / 25))
                        
                }
                
                Spacer()

            }
            .contentShape(Rectangle())
            .padding(.horizontal, screenWidth / 25)
            .padding(.bottom, screenHeight / 80)
            .background(Color.white)
                                        
        })
        .padding(.trailing, -screenWidth / 5)
        

        
        
        
        
        
        
        /*
        HStack {
            
            // When integrated with firebase, make CircleImage to accomodate WebImage instead of Image
            CircleImage(image: Image("charleyrivers"), length: screenWidth / 7.5, breadth: screenHeight / 16.25, overlayColor: .white, overlayRadius: 2, shadowRadius: 1)
                
            VStack(alignment: .leading) {
                
                Text("bisht.007")
                    .font(.system(size: screenWidth / 20, weight: .semibold))
                
                Text("Anshul Bisht")
                    .font(.system(size: screenWidth / 25))
                    
            }
            .padding(.horizontal, screenWidth / 50)
            
            Spacer()

        }
        .padding(.horizontal, screenWidth / 25)
        .padding(.top, screenHeight / 80)
        .background(Color.white)
        */
        
    }
    
}

