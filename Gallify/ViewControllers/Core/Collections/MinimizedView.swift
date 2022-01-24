//
//  Minimized.swift
//  Gallify
//
//  Created by Tejvir Mann on 1/23/22.
//

import SwiftUI

struct MinimizedView: View {
        
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    let image: Image
    let title: String
    let searchType: String
    let artistName: String
    
    @EnvironmentObject var firestoreQuery: FirestoreQuery
        
    var body: some View {
        
        
        
        Button(action: {
            firestoreQuery.showNewScreen.toggle()
            
            //firestoreQuery.data.isClicked = artwork.art_id
            
        }){
        
            
        ZStack{

            HStack {
                    
                image
                    .resizable()
                    .frame(width: screenWidth / 7.5, height: screenHeight / 16.25)
                    
                VStack(alignment: .leading) {
                        
                    Text(title)
                        .font(.system(size: screenWidth / 20, weight: .bold))
                        .foregroundColor(.black)
                        
                    Text(searchType + ", by " + artistName)
                        .font(.system(size: screenWidth / 25))
                        .foregroundColor(.black)
                        
                }
                .padding(.horizontal, screenWidth / 50)
                    
                Spacer()
                    
            }
            .padding(.horizontal, screenWidth / 25)
            .padding(.bottom, screenHeight / 80)
            .padding(.top, screenHeight / 80)
            .background(Color.white)
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
