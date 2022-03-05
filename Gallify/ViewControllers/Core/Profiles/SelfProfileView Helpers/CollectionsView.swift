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

    
    let art_id: String
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
       
        
        VStack {
        
            ForEach(firestoreQuery.userLibrary){ playlist in
                    HStack {
                            
//                        WebImage(url: URL(string: playlist.cover_art_url))
//                            .resizable()
//                            .frame(width: screenWidth / 5, height: screenHeight / 10.8)
                            
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
                            await firestoreQuery.addArtToPlaylist(art: Art(id:self.art_id), playlist_id: playlist.id)
                        }
                    }
        
            }
        .padding(.vertical, screenHeight / 80)
        .navigationBarHidden(true)
            
            Spacer()
            
            Button("Press to dismiss") {
                       dismiss()
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
