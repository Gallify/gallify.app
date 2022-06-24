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
                    
                    Text("Owned by:")
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
                    
                    Text("Created by:")
                        .font(.system(size: screenWidth / 25))
                    
                    NavigationLink (destination: OtherProfileView(otherUserId: artDetails.creatorId), label: {
                        
                        Text(artDetails.creator)
                            .font(.system(size: screenWidth / 25))
                            .underline()
                            .foregroundColor(.black)
                        
                    })
                    .navigationBarHidden(true)
                    
                }
                
                if(artDetails.collection != "") {
                    
                    HStack {
                        
                        Text("Collection:")
                            .font(.system(size: screenWidth / 25))
                        
                        NavigationLink (destination: CollectionGenericView(playlist: the_reel_desc_playlist), label: {
                                
                            Text(the_reel_desc_playlist.name)
                                .font(.system(size: screenWidth / 25))
                                .underline()
                                .foregroundColor(.black)
                                .onTapGesture {
                                    firestoreQuery.playlist = the_reel_desc_playlist
                                }
                            
                        })
                        .navigationBarHidden(true)
                        
                    }
                    
                }
                
                Text("Description:  " + artDetails.desc)
                    .font(.system(size: screenWidth / 25))
                
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
        .padding(.horizontal, screenWidth / 25)
        .padding(.vertical, screenHeight / 54)
        .onAppear { async {await NetworkingCall()} }

    }
    
    func NetworkingCall() async {
         
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
