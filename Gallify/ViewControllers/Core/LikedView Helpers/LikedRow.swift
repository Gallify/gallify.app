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
                    .foregroundColor(fgColor1)
                    .font(.system(size: 30))
                    .onTapGesture(count: 2) {
                        fgColor1 = .red
                    }
            }
            .padding(.trailing)
            
            Button(action: {self.showActionSheet.toggle()
            }) {
                Image(systemName: "ellipsis.circle")
                    .font(.system(size: 30))
                    .foregroundColor(.black)
                        }
            .actionSheet(isPresented: $showActionSheet, content: {
                        self.actionSheet })
            
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
                    .foregroundColor(fgColor2)
                    .font(.system(size: 30))
                    .onTapGesture(count: 2) {
                        fgColor2 = .red
                    }
            }
            .padding(.trailing)
            
            Button(action: {self.showActionSheet.toggle()
            }) {
                Image(systemName: "ellipsis.circle")
                    .font(.system(size: 30))
                    .foregroundColor(.black)
                        }
            .actionSheet(isPresented: $showActionSheet, content: {
                        self.actionSheet })
            
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
                    .foregroundColor(fgColor3)
                    .font(.system(size: 30))
                    .onTapGesture(count: 2) {
                        fgColor3 = .red
                    }
            }
            .padding(.trailing)
            
            Button(action: {self.showActionSheet.toggle()
            }) {
                Image(systemName: "ellipsis.circle")
                    .font(.system(size: 30))
                    .foregroundColor(.black)
                        }
            .actionSheet(isPresented: $showActionSheet, content: {
                        self.actionSheet })
            
        }
        .padding()
    }
}

struct CollectionViewLiked_Previews: PreviewProvider {
    static var previews: some View {
        LikedRow(screenWidth: UIScreen.main.bounds.width)
    }
}
