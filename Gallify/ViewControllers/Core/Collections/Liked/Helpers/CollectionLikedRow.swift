//
//  CollectionViewLiked.swift
//  Gallify
//
//  Created by Gianluca Profio on 9/26/21.
//

import SwiftUI

struct CollectionLikedRow: View {
    
    let screenWidth: CGFloat
    let screenHeight: CGFloat

    
    @State private var animate1 = false
    @State private var animate2 = false
    @State private var animate3 = false
    
    @State private var isLiked1 = false
    @State private var isLiked2 = false
    @State private var isLiked3 = false
    
    private let duration: Double = 0.4
    
    private var animationScale1: CGFloat {
        isLiked1 ? 0.6: 2.0
    }
    private var animationScale2: CGFloat {
        isLiked2 ? 0.6: 2.0
    }
    private var animationScale3: CGFloat {
        isLiked3 ? 0.6: 2.0
    }
    
    @State private var didTap:Bool = false
    
    @State private var fgColor1: Color = .black
    @State private var fgColor2: Color = .black
    @State private var fgColor3: Color = .black
    
    @State var showActionSheet: Bool = false
    
    var actionSheet: ActionSheet {
        ActionSheet(title: Text("Add to a Collection"), message: Text("Your Collections:"), buttons: [
            .default(Text("Collection 1")),
            .default(Text("Collection 2")),
            .destructive(Text("Cancel"))
        ])
    }
    
    var body: some View {
        
        HStack {
            NavigationLink(
                destination: CollectionReelView(screenWidth: screenWidth, screenHeight: screenHeight),
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
                .padding(.leading)
            Spacer()
            VStack{
                Text("Leonardo Da Vinci")
                    .fontWeight(.bold)
                Text("Sotherbys")
            }
            .padding()
            Spacer()
            
            Button(action: {
                    self.isLiked1.toggle()
            }) {
                Image(systemName: isLiked1 ? "heart.circle.fill": "heart.circle")
                    .foregroundColor(isLiked1 ? Color.red: Color.black)
                    .font(.system(size: 30))
                    .scaleEffect(animate1 ? animationScale1: 1)
                    .animation(.easeIn(duration: duration))
                }
            
            Button(action: {self.showActionSheet.toggle()
            }) {
                Image(systemName: "ellipsis.circle")
                    .font(.system(size: 30))
                    .foregroundColor(.black)
                        }
            .actionSheet(isPresented: $showActionSheet, content: {
                            self.actionSheet }).padding()
        }
        
        HStack {
            NavigationLink(
                destination: CollectionReelView(screenWidth: screenWidth, screenHeight: screenHeight),
                label: {
                    Image("cat")
                        .resizable()
                        .frame(width: screenWidth / 6, height: screenWidth / 6)
                        .cornerRadius(15)
                })
                .buttonStyle(ThemeAnimationStyle())
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .padding(.leading)
            Spacer()
            VStack{
                Text("Cat")
                    .fontWeight(.bold)
                Text("Bobby")
            }
            .padding()
            Spacer()
            
            Button(action: {
                    self.isLiked2.toggle()
            }) {
                Image(systemName: isLiked2 ? "heart.circle.fill": "heart.circle")
                    .foregroundColor(isLiked2 ? Color.red: Color.black)
                    .font(.system(size: 30))
                    .scaleEffect(animate2 ? animationScale2: 1)
                    .animation(.easeIn(duration: duration))
                }
            
            Button(action: {self.showActionSheet.toggle()
            }) {
                Image(systemName: "ellipsis.circle")
                    .font(.system(size: 30))
                    .foregroundColor(.black)
                        }
            .actionSheet(isPresented: $showActionSheet, content: {
                            self.actionSheet }).padding()
        }
        
        HStack {
            NavigationLink(
                destination: CollectionReelView(screenWidth: screenWidth, screenHeight: screenHeight),
                label: {
                    Image("starry-night")
                        .resizable()
                        .frame(width: screenWidth / 6, height: screenWidth / 6)
                        .cornerRadius(15)
                })
                .buttonStyle(ThemeAnimationStyle())
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .padding(.leading)
            Spacer()
            VStack{
                Text("Starry Night")
                    .fontWeight(.bold)
                Text("Joe Ingles")
            }
            .padding()
            Spacer()
            
            Button(action: {
                    self.isLiked3.toggle()
            }) {
                Image(systemName: isLiked3 ? "heart.circle.fill": "heart.circle")
                    .foregroundColor(isLiked3 ? Color.red: Color.black)
                    .font(.system(size: 30))
                    .scaleEffect(animate3 ? animationScale3: 1)
                    .animation(.easeIn(duration: duration))
                }
            
            Button(action: {self.showActionSheet.toggle()
            }) {
                Image(systemName: "ellipsis.circle")
                    .font(.system(size: 30))
                    .foregroundColor(.black)
                        }
            .actionSheet(isPresented: $showActionSheet, content: {
                            self.actionSheet }).padding()
        }
    }
    
}

struct CollectionLikedRow_Previews: PreviewProvider {
    static var previews: some View {
        CollectionLikedRow(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}

