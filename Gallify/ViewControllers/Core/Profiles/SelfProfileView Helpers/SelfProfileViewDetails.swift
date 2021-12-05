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
    
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    
    @State var photoUrl : String = ""
        let downloadRef =  Storage.storage().reference(forURL: "gs://gallify-64bbb.appspot.com/profileImages/" + (Auth.auth().currentUser?.email!)!)
    
    func getProfileImage() {
        downloadRef.downloadURL { (url, error) in
            if let error = error {
                // Handle any errors
            } else {
                // Get the download URL for 'images/stars.jpg'
                self.photoUrl = url!.absoluteString
            }
        }
            
    }
    
    var body: some View {
        
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
                       Rectangle().foregroundColor(.gray)
                   }
                   .indicator(.activity) // Activity Indicator
                   .transition(.fade(duration: 0.5)) // Fade Transition with duration
                   .scaledToFit()
                   .frame(width: 300, height: 300, alignment: .center)
        
        
                
        VStack {
                
            HStack {
                    
                CircleImage(image: Image("cat"), length: screenWidth / 4, breadth: screenHeight / 8.65, overlayColor: Color.white, overlayRadius: screenWidth / 125, shadowRadius: screenWidth / 125)
                    
                VStack {
                        
                    HStack {
                            
                        VStack {
                                
                            Text("420K")
                                .font(.system(size: screenWidth / 17))
                                
                            Text("Followers")
                                .font(.system(size: screenWidth / 23.5))
                                .foregroundColor(Color.gray)
                                
                        }
                            
                        VStack {
                                
                            Text("956")
                                .font(.system(size: screenWidth / 17))
                                
                            Text("Following")
                                .font(.system(size: screenWidth / 23.5))
                                .foregroundColor(Color.gray)
                                
                        }
                            
                        VStack {
                                
                            Text("30B")
                                .font(.system(size: screenWidth / 17))
                                
                            Text("Likes")
                                .font(.system(size: screenWidth / 23.5))
                                .foregroundColor(Color.gray)
                                
                        }

                    }
                        
                    HStack {
                            
                        VStack {
                                                            
                            Text("7")
                                .font(.system(size: screenWidth / 17))
                                
                            Text("Rarity")
                                .font(.system(size: screenWidth / 23.5))
                                .foregroundColor(Color.gray)
                                
                        }
                            
                        VStack {
                                
                            Text("1.3B")
                                .font(.system(size: screenWidth / 17))
                                
                            Text("Views")
                                .font(.system(size: screenWidth / 23.5))
                                .foregroundColor(Color.gray)
                                
                        }

                    }
                    .padding(.top, screenHeight / 80)
                        
                }
                .frame(width: screenWidth / 1.75)
                    
            }
            .padding(.top, screenHeight / 54)
                
            HStack {
                    
                Text("Meow!")
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
            self.getProfileImage()
        }
                
    }
    
}

struct SelfProfileViewDetails_Previews: PreviewProvider {
    static var previews: some View {
        SelfProfileViewDetails(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width)
    }
}
