//
//  CollectionViewLiked.swift
//  Gallify
//
//  Created by Gianluca Profio on 9/26/21.
//

import SwiftUI

struct LikedRow: View {
    let screenWidth: CGFloat
    @State private var didTap:Bool = false
    var body: some View {
        
        HStack {
            NavigationLink(
                destination: ExpandedView(screenWidth: screenWidth),
                label: {
                    Image("leonardo")
                        .resizable()
                        .frame(width: screenWidth / 6, height: screenWidth / 6)
                })
                .buttonStyle(ThemeAnimationStyle())
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle("")
                .navigationBarHidden(true)
            Spacer()
            VStack{
                Text("Leonardo Da Vinci")
                    .fontWeight(.bold)
                Text("Sotherbys")
            }
            .padding()
            Spacer()
            
            Button(action: {
                self.didTap = true
            }) {
                Image(systemName: "heart.circle.fill")
            }
            .foregroundColor(didTap ? Color.red : Color.black)
            .padding(.trailing)
            
            Button(action: {
                print("")
            }) {
                Image(systemName: "ellipsis")
                .foregroundColor(Color.black)
            }
            
        }
        .padding()
        
        HStack {
            NavigationLink(
                destination: ExpandedView(screenWidth: screenWidth),
                label: {
                    Image("cat")
                        .resizable()
                        .frame(width: screenWidth / 6, height: screenWidth / 6)
                })
                .buttonStyle(ThemeAnimationStyle())
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle("")
                .navigationBarHidden(true)
            Spacer()
            VStack{
                Text("Cat")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                Text("Bobby")
                    .multilineTextAlignment(.leading)
            }
            .padding()
            Spacer()
            
            Button(action: {
                self.didTap = true
            }) {
                Image(systemName: "heart.circle.fill")
            }
            .foregroundColor(didTap ? Color.red : Color.black)
            .padding(.trailing)
            
            Button(action: {
                print("")
            }) {
                Image(systemName: "ellipsis")
                .foregroundColor(Color.black)
            }
            
        }
        .padding()
        
        HStack {
            NavigationLink(
                destination: ExpandedView(screenWidth: screenWidth),
                label: {
                    Image("starry-night")
                        .resizable()
                        .frame(width: screenWidth / 6, height: screenWidth / 6)
                })
                .buttonStyle(ThemeAnimationStyle())
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle("")
                .navigationBarHidden(true)
            Spacer()
            VStack{
                Text("Starry Night")
                    .fontWeight(.bold)
                Text("Joe Ingles")
            }
            .padding()
            Spacer()
            
            Button(action: {
                self.didTap = true
            }) {
                Image(systemName: "heart.circle.fill")
            }
            .foregroundColor(didTap ? Color.red : Color.black)
            .padding(.trailing)
            
            Button(action: {
                print("")
            }) {
                Image(systemName: "ellipsis")
                .foregroundColor(Color.black)
            }
            
        }
        .padding()
    }
}

struct CollectionViewLiked_Previews: PreviewProvider {
    static var previews: some View {
        LikedRow(screenWidth: UIScreen.main.bounds.width)
    }
}
