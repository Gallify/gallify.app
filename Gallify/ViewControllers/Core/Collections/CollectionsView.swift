//
//  CollectionsView.swift
//  Gallify
//
//  Created by Shruti Sharma on 2/19/22.
//
import SwiftUI
import FirebaseFirestore
import FirebaseAuth
import SDWebImageSwiftUI

struct CollectionsView: View {
    
    @EnvironmentObject var viewModel: TabBarViewModel
    @EnvironmentObject var firestoreQuery : FirestoreQuery
    
    @Environment(\.dismiss) var dismiss

    
    let art : Art
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        
       
       
        VStack {
            
            Text("Add art to playlist or collection")
                .underline()
                .padding(.top, 10)
                .font(Font.body.bold())
                .foregroundColor(.primary)
               
                
            
            ScrollView{
        
                ForEach(firestoreQuery.userLibrary){ playlist in
                    
                        HStack {
                             
                            WebImage(url: URL(string: playlist.cover_art_url))
                                .resizable()
                                .frame(width: screenWidth / 5, height: screenHeight / 10.8)
                                
                            VStack(alignment: .leading) {
                                
                                Text(playlist.name)
                                    .font(.system(size: screenWidth / 17, weight: .semibold))
                                    .foregroundColor(.black)
                                    .lineLimit(1)
                                    
                            }
                            .padding(.leading, screenWidth / 37.5)
                                
                            Spacer()
                                
                        }
                        .padding(.vertical, screenHeight / 160)
                        .padding(.leading, screenWidth / 15)
                        .onTapGesture {
                            Task {
                                let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                                impactHeavy.impactOccurred()
                                await firestoreQuery.addArtToPlaylist(art: art, playlist_id: playlist.playlist_id)
                                await firestoreQuery.getUserLibrary()
                                //dismiss view
                                dismiss()
                            }
                        }
            
                }
            .padding(.vertical, screenHeight / 80)
            .navigationBarHidden(true)
            
                
    //            Spacer()
    //
    //            Button("Press to dismiss") {
    //                       dismiss()
    //            }
            }
        }
        
    }

    
}


//struct CollectionsView_Previews: PreviewProvider {
//    static var previews: some View {
//        CollectionsView()
////            .environmentObject(TabBarViewModel())
////            .environmentObject(FirestoreQuery())
//    }
//}
