//
//  Minimized.swift
//  Gallify
//
//  Created by Tejvir Mann on 1/23/22.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth
import SDWebImageSwiftUI

@MainActor
struct MinimizedView: View {
        
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    
//    let image: Image
//    let title: String
//    let searchType: String
//    let artistName: String
    
    @EnvironmentObject var firestoreQuery: FirestoreQuery
        
    var body: some View {
        
        
        
        Button(action: {
            
            firestoreQuery.showNewScreen = true
            
            //firestoreQuery.data.isClicked = artwork.art_id
            
        }){
        
            
        ZStack{

            HStack {
                    
                WebImage(url: URL(string: firestoreQuery.artThatsPlaying.thumbnailUrl))
                    .resizable()
                    .frame(width: screenWidth / 7.5, height: screenHeight / 16.25)
                    
                VStack(alignment: .leading) {
                        
                    Text(firestoreQuery.artThatsPlaying.name)
                        .font(.system(size: screenWidth / 20, weight: .bold))
                        .foregroundColor(.black)
                        
                    Text("by " + firestoreQuery.artThatsPlaying.creator)
                        .font(.system(size: screenWidth / 25))
                        .foregroundColor(.black)
                        
                }
                .padding(.horizontal, screenWidth / 50)
                    
                Spacer()
                
                Button(action: {
                    firestoreQuery.artPlaying = false
                    firestoreQuery.artisClicked = "artisClicked"
                }, label: {
                    
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: screenWidth / 20, height: screenHeight / 43)
                        .foregroundColor(.black)
                    
                })
                .padding(.horizontal, screenWidth / 25)
                    
            }
            .padding(.horizontal, screenWidth / 25)
            .padding(.bottom, screenHeight / 80)
            .padding(.top, (screenHeight / 80)-10)
            .background(Color.white)
           // .border(Color.primary)
        
        }
            
    }
    
}

}

//to be changed.
struct MinimizedView_Previews: PreviewProvider {
    static var previews: some View {
        OtherSearchTemplate(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width, image: Image("umbagog"), title: "Starry Night", searchType: "Art", artistName: "Adele")
    }
}
