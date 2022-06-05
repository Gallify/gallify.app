//
//  AdminApprovalArtDescription.swift
//  Gallify
//
//  Created by Anshul on 4/8/22.
//

import SwiftUI

struct AdminApprovalArtDescription: View {
    
    let artDetails: Art
    @EnvironmentObject var viewModel: TabBarViewModel
    @EnvironmentObject var firestoreQuery: FirestoreQuery

    @State var createdDate = Date()
    @State var latestDate = Date()
    @State var the_reel_desc_playlist = Playlist()
    
    @State var createdString = ""
    @State var latestString = ""

    var body: some View {
        
        let screenWidth = viewModel.screenWidth
        let screenHeight = viewModel.screenHeight
        
        HStack {
            
            VStack(alignment: .leading) {
                
                Text("Select Genre")
                    .font(.system(size: screenWidth / 25))
                
                
                
                HStack {
                    
                    Text("Created by:")
                        .font(.system(size: screenWidth / 25))
                    
                    Text(artDetails.owner)
                        .font(.system(size: screenWidth / 25))
                        .underline()
                        
                }
                
                if(artDetails.collection != "") {
                    
                    HStack {
                        
                        Text("Collection:")
                            .font(.system(size: screenWidth / 25))
                        
                        Text(the_reel_desc_playlist.name)
                            .font(.system(size: screenWidth / 25))
                            .underline()
                        
                    }
                    
                }
                    
                Text("Description:  " + artDetails.desc)
                    .font(.system(size: screenWidth / 25))
                
            }
            
            Spacer()
            
            VStack {
                
                Button(action: {
                    Task {
                        await firestoreQuery.approveArt(art: artDetails)
                    }
                    
                }, label: {
                    
                    Text("Approve")
                        .font(.system(size: screenWidth / 25, weight: .light))
                        .foregroundColor(Color.white)
                        .padding(.horizontal, screenWidth / 15)
                        .padding(.vertical, screenHeight / 80)
                        .background(Color("Gallify-Pink"))
                        .cornerRadius(screenWidth / 20)
                        .padding(.vertical, screenHeight / 160)
                    
                })
                
                Button(action: {
                    
                    Task {
                        await firestoreQuery.rejectArt(art: artDetails)
                    }
                    
                    //send an email to the user explaining why it was rejected
                    MailViewTest()
                    
                }, label: {
                    
                    Text("Reject")
                        .font(.system(size: screenWidth / 25, weight: .light))
                        .foregroundColor(Color.white)
                        .padding(.horizontal, screenWidth / 12)
                        .padding(.vertical, screenHeight / 80)
                        .background(Color.red)
                        .cornerRadius(screenWidth / 20)
                        .padding(.vertical, screenHeight / 160)
                    
                })
                
            }
            
        }
        .padding(.horizontal, screenWidth / 25)
        .padding(.vertical, screenHeight / 54)
        .onAppear { async {await NetworkingCall()}}

    }
    
    func NetworkingCall() async {
         
        //convert recent date
       //  latestDate = artDetails.latestHistoryDate.dateValue()
        // latestString = latestDate.formatted()
         
         //convert created date
       //  createdDate = artDetails.createdDate.dateValue()
        // createdString = createdDate.formatted()
         
         //get the collection the art is apart of
         if(artDetails.collection != "") {
             the_reel_desc_playlist = await firestoreQuery.getReelPlaylist(playlist_id: artDetails.collection)
         }
         
    }
    
}
