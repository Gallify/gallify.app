//
//  CollectionViewLiked.swift
//  Gallify
//
//  Created by Gianluca Profio on 9/26/21.
//

import SwiftUI

struct CollectionGenericRow: View {
    let screenWidth: CGFloat
    let screenHeight: CGFloat

    
    
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
                    Image("logo")
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
                Text("[Collection_Name]")
                    .fontWeight(.bold)
                Text("Gallify")
            }
            .padding()
            
            Spacer()
            
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
                    Image("logo")
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
                Text("[Collection_Name]")
                    .fontWeight(.bold)
                Text("[Collection_Artist]")
            }
            .padding()
            
            Spacer()
            
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
                    Image("logo")
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
                Text("[Collection_Name]")
                    .fontWeight(.bold)
                Text("[Collection_Artist]")
            }
            .padding()
            
            Spacer()
            
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

struct CollectionGenericRow_Previews: PreviewProvider {
    static var previews: some View {
        CollectionGenericRow(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}

