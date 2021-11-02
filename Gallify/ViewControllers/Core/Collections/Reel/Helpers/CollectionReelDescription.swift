//
//  ExpandedDescription.swift
//  Gallify
//
//  Created by Gianluca Profio on 10/3/21.
//

import SwiftUI

struct CollectionReelDescription: View {
    let screenWidth: CGFloat
    var body: some View {
        VStack {
            HStack {
                VStack (alignment: .leading) {
                    Text("Edition of 15")
                        .fontWeight(.bold)
                        .font(.system(size: 18))
                        .underline()
                    Text("")
                    HStack {
                        Text("Owned by:")
                            .font(.system(size: 16))
                        NavigationLink (
                            destination: CollectionLikedView(screenWidth: screenWidth),
                            label: {
                                Text("JackBrown_3")
                                    .font(.system(size: 16))
                                    .underline()
                                    .fontWeight(.bold)
                            })
                            .buttonStyle(ThemeAnimationStyle())
                            .navigationBarBackButtonHidden(true)
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                    }
                    HStack {
                        Text("Created by:")
                            .font(.system(size: 16))
                        NavigationLink (
                            destination: CollectionLikedView(screenWidth: screenWidth),
                            label: {
                                Text("MustyMondedas")
                                    .font(.system(size: 16))
                                    .underline()
                                    .fontWeight(.bold)
                            })
                            .buttonStyle(ThemeAnimationStyle())
                            .navigationBarBackButtonHidden(true)
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                    }
                    HStack {
                        Text("Collection:")
                            .font(.system(size: 16))
                        NavigationLink (
                            destination: CollectionLikedView(screenWidth: screenWidth),
                            label: {
                                Text("MustyCollection")
                                    .font(.system(size: 16))
                                    .underline()
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                            })
                    }
                    HStack {
                        Text("Last Sold:")
                            .font(.system(size: 16))
                        Text("550.34")
                            .font(.system(size: 16))
                    }
                    HStack {
                        Text("Released")
                            .font(.system(size: 16))
                        Text("Sep 16, 2021 for $0.00")
                            .font(.system(size: 16))
                    }
                }
                .padding(.leading)
                .frame(width: screenWidth / 1.5, height: screenWidth / 1.5)
                VStack (alignment: .trailing) {
                    
                    NavigationLink (
                        destination: TabBarView(),
                        label: {
                            HStack {
                                Text("0x42f6...60690")
                                    .font(.system(size: 10))
                                    .underline()
                                Image(systemName: "link.icloud")
                            }
                        })
                        .buttonStyle(ThemeAnimationStyle())
                        .navigationBarBackButtonHidden(true)
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                    
                    NavigationLink (
                        destination: TabBarView(),
                        label: {
                            Text("Bid")
                                .font(.system(size: 18))
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color(red: 1.0, green: 0.55, blue: 1.0))
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color(red: 1.0, green: 0.55, blue: 1.0), lineWidth: 2)
                                .frame(width: screenWidth / 5, height: screenWidth / 10)
                                )
                        })
                        .buttonStyle(ThemeAnimationStyle())
                        .navigationBarBackButtonHidden(true)
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                    
                    Spacer()
                    
                }
                .padding(.trailing)
                .frame(width: screenWidth / 3, height: screenWidth / 3)
            }
        }
    }
}

struct CollectionReelDescription_Previews: PreviewProvider {
    static var previews: some View {
        CollectionReelDescription(screenWidth: UIScreen.main.bounds.width)
    }
}
