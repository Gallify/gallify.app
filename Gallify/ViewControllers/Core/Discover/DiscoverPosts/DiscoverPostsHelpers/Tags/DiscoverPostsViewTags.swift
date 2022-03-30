//
//  DiscoverPostsViewTags.swift
//  Gallify
//
//  Created by Anshul on 11/14/21.
//
import SwiftUI

struct DiscoverPostsViewTags: View {
    
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    @EnvironmentObject var firestoreQuery : FirestoreQuery

    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack {
                
                Button(action: {
                    if(firestoreQuery.lastDocument != nil){
                        async{ await firestoreQuery.getDiscoverContent() }
                    }
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                }) {
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color("Gallify-Pinkish"))
                            .frame(width: screenWidth / 10.5, height: screenWidth / 10.5)
                            .cornerRadius(screenWidth / 50)
                        
                        Image(systemName: "arrow.clockwise")
                            .resizable()
                            .foregroundColor(Color.white)
                            .frame(width: screenWidth / 25, height: screenWidth / 25)
                            .font(Font.title.weight(.bold))
                        
                    }
                }
                .buttonStyle(ThemeAnimationStyle_refresh())
                
               
//                DiscoverViewTag(screenHeight: screenHeight, screenWidth: screenWidth, tag: "Refresh", bgColor: Color("Gallify-Pink").opacity(0.7))
//                    .onTapGesture{
//                        if(firestoreQuery.lastDocument != nil){
//                            async{ await firestoreQuery.getDiscoverContent() }
//                        }
//                    }
//                    .buttonStyle(ThemeAnimationStyle_refresh())

                
                /*
                NavigationLink(destination: DiscoverBrowse(), label: {
                    
                    DiscoverViewTag(screenHeight: screenHeight, screenWidth: screenWidth, tag: "Browse", bgColor: Color.primary)
                    
                })
                */
//                DiscoverViewTag(screenHeight: screenHeight, screenWidth: screenWidth, tag: "Abstract", bgColor: Color.gray.opacity(0.7))
//
//                DiscoverViewTag(screenHeight: screenHeight, screenWidth: screenWidth, tag: "International", bgColor: Color.gray.opacity(0.7))
//
//                DiscoverViewTag(screenHeight: screenHeight, screenWidth: screenWidth, tag: "Marvel", bgColor: Color.gray.opacity(0.7))
//
//                DiscoverViewTag(screenHeight: screenHeight, screenWidth: screenWidth, tag: "Food", bgColor: Color.gray.opacity(0.7))
                
            }
            .padding(.horizontal, screenWidth / 25)
            .padding(.vertical, screenHeight / 160)
            
        }
        
    }
    
}

struct DiscoverPostsViewTags_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverPostsViewTags(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width)
    }
}
