//
//  ExpandedDescription.swift
//  Gallify
//
//  Created by Gianluca Profio on 10/3/21.
//
import SwiftUI

struct CollectionReelDescription: View {
    
    let artDetails: Art
    @EnvironmentObject var viewModel: TabBarViewModel
    @EnvironmentObject var firestoreQuery: FirestoreQuery

    @State var createdDate = Date()
    @State var latestDate = Date()
    @State var the_reel_desc_playlist = Playlist()
    
    @State var createdString = ""
    @State var latestString = ""

    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        HStack {
            
            VStack (alignment: .leading) {
                
                HStack {

                    Text("Owner")
                        .font(.system(size: screenWidth / 25))

                    NavigationLink (destination: OtherProfileView(otherUserId: artDetails.ownerId), label: {

                        Text(artDetails.owner)
                            .font(.system(size: screenWidth / 25))
                            .underline()
                            .foregroundColor(.black)

                    })
                    .navigationBarHidden(true)

                }
                
                HStack {

                    Text("Creator")
                        .font(.system(size: screenWidth / 25))

                    NavigationLink (destination: OtherProfileView(otherUserId: artDetails.creatorId), label: {

                        Text(artDetails.creator)
                            .font(.system(size: screenWidth / 25))
                            .underline()
                            .foregroundColor(.black)

                    })
                    .navigationBarHidden(true)

                }

                HStack {
                    
                    Text("Address")
                        .font(.system(size: screenWidth / 25))
                    
                  
                        Text(the_reel_desc_playlist.address)
                            .font(.system(size: screenWidth / 25))
                            .underline()
                            .foregroundColor(.black)
                        
                  
                    
                }
                
                HStack {
                    
                    Text("Created Date")
                        .font(.system(size: screenWidth / 25))
                    
                  
                        Text(createdString)
                            .font(.system(size: screenWidth / 25))
                            .underline()
                            .foregroundColor(.black)
                        
                  
                    
                }
                
                HStack {
                    
                    Text("Modifed Date")
                        .font(.system(size: screenWidth / 25))
                    
                  
                        Text(latestString)
                            .font(.system(size: screenWidth / 25))
                            .underline()
                            .foregroundColor(.black)
                        
                  
                    
                }
                
                HStack {
                    
                    Text("Polyscan")
                        .font(.system(size: screenWidth / 25))
                    
                  
                        Text(the_reel_desc_playlist.address)
                            .font(.system(size: screenWidth / 25))
                            .underline()
                            .foregroundColor(.black)
                }
                
                HStack {
                    
                    Text("Token #")
                        .font(.system(size: screenWidth / 25))
                    
                  
                        Text("\(artDetails.tokenId)")
                            .font(.system(size: screenWidth / 25))
                            .underline()
                            .foregroundColor(.black)
                }
                
                HStack {
                    
                    Text("Address")
                        .font(.system(size: screenWidth / 25))
                    
                  
                        Text(the_reel_desc_playlist.address)
                            .font(.system(size: screenWidth / 25))
                            .underline()
                            .foregroundColor(.black)
                        
                }
                
                
                if(the_reel_desc_playlist.address != "" && artDetails.tokenId != 0){
                    HStack {
                        
                        Button(action: {
                            
                            let polyString = "https://polygonscan.com/token/" + the_reel_desc_playlist.address + "?a" + "\(artDetails.tokenId)"

                            if let url = URL(string: polyString ) {
                               UIApplication.shared.open(url)
                            }
                            
                            
                        }) {
                            
                            Text("View on Polyscan")
                                .font(.system(size: screenWidth / 25))
                        }
                    }
                }
                
                
                if(artDetails.collection != "") {

                    
                    HStack {

                        Text("Collection")
                            .font(.system(size: screenWidth / 25))

                        NavigationLink (destination: CollectionGenericView(playlist: the_reel_desc_playlist), label: {

                            Text(the_reel_desc_playlist.name)
                                .font(.system(size: screenWidth / 25))
                                .underline()
                                .foregroundColor(.black)

                        })
                        .navigationBarHidden(true)

                    }
                    
                }
//
//            Text("\(artDetails.desc)")
//                .font(.system(size: screenWidth / 25))
                
            }
            
            Spacer()
            
            VStack {
                

                
                if(artDetails.forSale) {
                    
                    Button(action: {
                        
                        let impactHeavy = UIImpactFeedbackGenerator(style: .heavy) //haptic feedback!
                        impactHeavy.impactOccurred()
                        
                        if let url = URL(string: "https://metamask.app.link/dapp/https://open.gallify.app/market/" + artDetails.artId) {
                           UIApplication.shared.open(url)
                        }
                        
                    }, label: {
                        
                        Text("Buy")
                            .font(.system(size: screenWidth / 25, weight: .light))
                            .foregroundColor(Color.white)
                            .padding(.horizontal, screenWidth / 15)
                            .padding(.vertical, screenHeight / 80)
                            .background(Color("Gallify-Pink"))
                            .cornerRadius(screenWidth / 20)
                            .padding(.vertical, screenHeight / 160)
                        
                    })
                    
                }
                
            }
                
        }
        .background(Color("Whitish"))
//        .padding(.horizontal, screenWidth / 25)
//        .padding(.vertical, screenHeight / 54)
        .onAppear { async {await NetworkingCall()} }

    }
    
    func NetworkingCall() async {
         
        let epochModTime = TimeInterval(artDetails.modifiedDate) / 1000
        let dateMod = Date(timeIntervalSince1970: epochModTime)
        latestString = dateMod.formatted()
        
        let epochCreateTime = TimeInterval(artDetails.createdDate) / 1000
        let dateCreate = Date(timeIntervalSince1970: epochCreateTime)
        createdString = dateCreate.formatted()

         //get the collection the art is apart of
         if(artDetails.collection != ""){
             
             print(artDetails.collection)
             the_reel_desc_playlist = await firestoreQuery.getReelPlaylist(playlist_id: artDetails.collection)
             
         }
        
    }
    
}
