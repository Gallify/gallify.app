//
//  ExpandedDescription.swift
//  Gallify
//
//  Created by Gianluca Profio on 10/3/21.
//

import SwiftUI

struct CollectionReelDescription: View {
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    let artDetails: Art
    @EnvironmentObject var viewModel: TabBarViewModel
    @EnvironmentObject var firestoreQuery: FirestoreQuery

    @State var createdDate = Date()
    @State var latestDate = Date()
    @State var the_reel_desc_playlist = Playlist()
    
    @State var createdString = ""
    @State var latestString = ""
   
//    let twoDays: TimeInterval = 2 * 24 * 60 * 60
//    let date = latestDate.advanced(by: twoDays)
//

    var body: some View {
        VStack {
            
//            HStack {
//                VStack (alignment: .leading) {
//
//
//                }
//                .padding(.leading)
//                .frame(width: screenWidth / 1.5, height: screenWidth / 1.5)
                
                VStack (alignment: .center) {
                    
                    HStack{
                        //Text(artDetails.desc)
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum")
                    }
                    .padding(.bottom, 10)
                    
                    HStack {
                        Text("Owned by •")
                            .font(.system(size: 16))
                        
                        NavigationLink (
                            destination: OtherProfileView(otherUserId: artDetails.ownerId),
                            label: {
                                Text(artDetails.owner)
                                    .font(.system(size: 16))
                                    .foregroundColor(Color("Gallify-Pink"))
                                    .fontWeight(.bold)
                            })
                            .buttonStyle(ThemeAnimationStyle())
                            .navigationBarBackButtonHidden(true)
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                    }
                    
                    HStack {
                        Text("Created by •")
                            .font(.system(size: 16))
                        
                        NavigationLink (
                            destination: OtherProfileView(otherUserId: artDetails.creatorId),
                            label: {
                                Text(artDetails.creator)
                                    .font(.system(size: 16))
                                    .foregroundColor(Color(.blue))
                                    .fontWeight(.bold)
                            })
                            .buttonStyle(ThemeAnimationStyle())
                            .navigationBarBackButtonHidden(true)
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                    }
                    
                    if(artDetails.collection != ""){
                        HStack {
                            Text("Collection •")
                                .font(.system(size: 16))
                            NavigationLink (
                               destination: CollectionGenericView(playlist: the_reel_desc_playlist),
                                label: {
                                    Text(the_reel_desc_playlist.name)
                                        .font(.system(size: 16))
                                        .underline()
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                        .onTapGesture {
                                            firestoreQuery.playlist = the_reel_desc_playlist
                                        }
                                })
                        }
                    }
                    
                    
//                    HStack {
//                        Text("Recent •")
//                            .font(.system(size: 16))
//                        Text(latestString)
//                            .font(.system(size: 16))
//                    }
//
//
//                    HStack {
//                        Text("Created •")
//                            .font(.system(size: 16))
//                        Text(createdString)
//                            .font(.system(size: 16))
//                    }
//
                    
                    
                    
                    
                    
                   // if(artDetails.forSale){
                        Button(action: {
                            
                            let impactHeavy = UIImpactFeedbackGenerator(style: .heavy) //haptic feedback!
                            impactHeavy.impactOccurred()
                            
                            if let url = URL(string: "https://metamask.app.link/dapp/https://open.gallify.app/market/" + artDetails.artId) {
                               UIApplication.shared.open(url)
                            }

                        }) {
                            ZStack {
                                Text("Buy")
//                                    .font(.system(size: 18, weight: .bold))
//                                    .foregroundColor(Color.white)
//                                    .padding()
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 20)
//                                            .stroke(Color.blue)
//                                            .frame(width: screenWidth / 5, height: screenWidth / 10)
//                                            .background(Color.blue)
//                                    )
//
                                    .font(.system(size: screenWidth / 30, weight: .bold))
                                    .foregroundColor(Color.white)
                                    .padding(.horizontal, screenWidth / 17)
                                    .padding(.vertical, screenHeight / 120)
                                    .background(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                                    .cornerRadius(screenWidth / 15)
                                
                            }
                            .padding(.trailing, screenWidth / 37.5)
                        }
                   // }
                    
                    if(artDetails.tokenId != 0){
                        Button(action: {
                            if let url = URL(string: "https://polygonscan.com/token/" + String(artDetails.tokenId)) {
                               UIApplication.shared.open(url)
                            }
                        }) {
                            HStack {
                                Text("\(artDetails.tokenId)")
                                    .font(.system(size: 10))
                            }
                        }
                    }
                    
                    Spacer()
                    
                }
                
       //     }
        }
        
        .onAppear { async {await NetworkingCall()}}

    }
     func NetworkingCall() async{
         
        //convert recent date
       //  latestDate = artDetails.latestHistoryDate.dateValue()
        // latestString = latestDate.formatted()
         
         //convert created date
       //  createdDate = artDetails.createdDate.dateValue()
        // createdString = createdDate.formatted()
         
         //get the collection the art is apart of
         if(artDetails.collection != ""){
             the_reel_desc_playlist = await firestoreQuery.getReelPlaylist(playlist_id: artDetails.collection)
         }
      
        
    }
    
    
}

//struct CollectionReelDescription_Previews: PreviewProvider {
//    static var previews: some View {
//        CollectionReelDescription(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
//    }
//}
