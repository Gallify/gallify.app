//
//  SwiftUIView.swift
//  Gallify
//
//  Created by Gianluca Profio on 9/26/21.
//

import SwiftUI

struct CollectionLikedHeader: View {
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    var body: some View {
        
        HStack {
            
            HStack {
                
                CustomBackButton(buttonHeight: screenHeight / 39, buttonWidth: screenWidth / 18, image: Image(systemName: "lessthan"), presentationMode: _presentationMode)
                    .padding(.horizontal, screenWidth / 25)
                    .padding(.vertical, screenHeight / 100)
                
                Spacer()
                
            }
            
            
            
            HStack {
//                NavigationLink(
//                    destination: TabBarView(),
//                    label: {
//
//                        Image(systemName: "lessthan")
//                            .resizable()
//                            .foregroundColor(Color.black)
//                            .frame(width: screenWidth / 15, height: screenWidth / 15)
//                            .padding(.leading, screenWidth / 25)
//
//                    })
//                    .buttonStyle(ThemeAnimationStyle())
//                    .navigationBarBackButtonHidden(true)
//                    .navigationBarTitle("")
//                    .navigationBarHidden(true)
                
                
                
                Spacer()
                                        
                    Text("Liked")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                
                Spacer()
                
                Text("")
                .foregroundColor(Color.black)
                .frame(width: screenWidth / 15, height: screenWidth / 15)
                .padding(.leading, screenWidth / 25)
                
            }
        }
    }
}

struct CollectionLikedHeader_Previews: PreviewProvider {
    static var previews: some View {
        CollectionLikedHeader(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}

