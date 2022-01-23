//
//  DropDownReels.swift
//  Gallify
//
//  Created by Gianluca Profio on 1/2/22.
//

import SwiftUI

struct DropDownReelsView: View {
        
    let screenWidth: CGFloat
    
    let screenHeight: CGFloat
    
    @State var showSheet: Bool = false
        
    public var body: some View {
        
        ZStack {
            // Please note, CollectionLikedView is run as a sample page
            CollectionLikedView(screenWidth: screenWidth, screenHeight: screenHeight)
                
            HStack {
                NavigationLink(
                    destination: CollectionReelView(screenWidth: screenWidth,screenHeight: screenHeight),
                    label: {
                        Image("leonardo")
                            .resizable()
                            .frame(width: screenWidth / 6, height: screenWidth / 6)
                            .cornerRadius(15)
                    })
                    .buttonStyle(ThemeAnimationStyle())
                    .navigationBarBackButtonHidden(true)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    .padding()
                
                Text("2 of 15")
                    .font(.system(size: 19))
                    .fontWeight(.bold)
                    .padding(.trailing)
                    .multilineTextAlignment(.center)
                
                Text("Leonardo Da Vinci")
                    .fontWeight(.semibold)
                    .font(.system(size: 19))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Button(action: {
                    
                    showSheet.toggle()
                    
                }) {
                    Image(systemName: "chevron.up.circle")
                        .foregroundColor(.black)
                        .font(.system(size: 30))
                }
                .fullScreenCover(isPresented: $showSheet, content: {
                    CollectionReelView(screenWidth: screenWidth, screenHeight: screenHeight)
                })
                
                Spacer()
                
            }
            .background(Color(red: 1.0, green: 0.55, blue: 1.0, opacity: 0.6))
            .offset(y: 255)
        }
    }
}

struct DropDownReelsView_Previews: PreviewProvider {
    static var previews: some View {
        DropDownReelsView(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}

