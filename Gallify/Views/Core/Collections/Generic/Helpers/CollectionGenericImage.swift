//
//  CollectionGenericImage.swift
//  Gallify
//
//  Created by Tejvir Mann on 3/18/22.

import SwiftUI
import SDWebImageSwiftUI

struct CollectionGenericImage: View {
    
    let playlist: Playlist
    
    var body: some View {
        
        if(playlist.name == "Liked"){
            WebImage(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/gallify-64bbb.appspot.com/o/defaultImages%2Fliked.png?alt=media&token=653389a3-10c9-4395-babb-791e91227f42"))
                .resizable()
                .frame(width: 200, height: 200)
                .padding(.top, 20)
        }
        else if(playlist.name == "Review"){
            WebImage(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/gallify-64bbb.appspot.com/o/defaultImages%2Freview.png?alt=media&token=51e5008f-9586-49ba-beec-d28d4b04cc91"))
                .resizable()
                .frame(width: 200, height: 200)
                .padding(.top, 20)
        }
        else if(playlist.name == "Created"){
            WebImage(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/gallify-64bbb.appspot.com/o/defaultImages%2Fcreated.png?alt=media&token=bdba6772-b70d-4bc3-9d9d-78e9fb7c0713"))
                .resizable()
                .frame(width: 200, height: 200)
                .padding(.top, 20)
        }
        else if(playlist.name == "Owned"){
            WebImage(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/gallify-64bbb.appspot.com/o/defaultImages%2Fowned.jpg?alt=media&token=c7c9f2df-c813-4451-b4e4-ea0f1bc432c1"))
                .resizable()
                .frame(width: 200, height: 200)
                .padding(.top, 20)
        }
        else if(playlist.name == "Featured"){
            WebImage(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/gallify-64bbb.appspot.com/o/defaultImages%2Ffeatured.png?alt=media&token=2e91e5ec-ed5f-4fbc-8e31-f68680d0b434"))
                .resizable()
                .frame(width: 200, height: 200)
                .padding(.top, 20)
        }
        else if(playlist.name == "Singles"){
            WebImage(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/gallify-64bbb.appspot.com/o/defaultImages%2Fsingles.png?alt=media&token=7a9013a2-6245-4e85-999c-17ba379f3f32"))
                .resizable()
                .frame(width: 200, height: 200)
                .padding(.top, 20)
        }
        else{
            WebImage(url: URL(string: playlist.coverArtUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .clipped()
                .padding(.top, 20)
            
            
                
        }

    }
    
}






