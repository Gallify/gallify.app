//
//  RecentActivityRow.swift
//  Gallify
//
//  Created by Gianluca Profio on 9/26/21.
//

import SwiftUI

struct CollectionRecentActivityRow: View {
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
                        
            VStack (alignment: .leading){
                Text("Leonardo Da Vinci")
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                Text("Sotherbys")
                    .font(.system(size: 12))
            }
            
            Spacer()
            
            HStack{
                
                NavigationLink(
                    destination: TabBarView(),
                    label: {
                        CircleImage(image: Image("charlie-brown"), length: screenWidth / 11, breadth: screenWidth / 11, overlayColor: Color.white, overlayRadius: screenWidth / 125, shadowRadius: screenWidth / 125)
                    })
                    .buttonStyle(ThemeAnimationStyle())
                    .navigationBarBackButtonHidden(true)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                
                VStack (alignment: .leading){
                    HStack{
                        Text("Created")
                            .fontWeight(.bold)
                            .foregroundColor(.orange)
                            .font(.system(size: 13))
                        Text("• 2h")
                            .font(.system(size: 12))
                            .fontWeight(.bold)
                    }
                    Text("by Charlie B.")
                            .font(.system(size: 12))
                }
                .multilineTextAlignment(.center)
            }
            .frame(width: screenWidth / 3, height: screenWidth / 8)
            .padding()
            
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
            
            VStack (alignment: .leading){
                Text("Cat")
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                Text("Bobby")
                    .font(.system(size: 12))
            }
            
            Spacer()
            
            HStack{
                
                NavigationLink(
                    destination: TabBarView(),
                    label: {
                        CircleImage(image: Image("kanye-west"), length: screenWidth / 11, breadth: screenWidth / 11, overlayColor: Color.white, overlayRadius: screenWidth / 125, shadowRadius: screenWidth / 125)
                    })
                    .buttonStyle(ThemeAnimationStyle())
                    .navigationBarBackButtonHidden(true)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                
                VStack (alignment: .leading){
                    HStack{
                        Text("Bought")
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                            .font(.system(size: 13))
                        Text("• 10h")
                            .font(.system(size: 12))
                            .fontWeight(.bold)
                    }
                    Text("by Kanye West")
                            .font(.system(size: 12))
                }
                .multilineTextAlignment(.center)
            }
            .frame(width: screenWidth / 3, height: screenWidth / 8)
            .padding()
            
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
                        
            VStack (alignment: .leading){
                Text("Starry Night")
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                Text("Joe Ingles")
                    .font(.system(size: 12))
            }
            
            Spacer()
            
            HStack{
                
                NavigationLink(
                    destination: TabBarView(),
                    label: {
                        CircleImage(image: Image("kanye-west"), length: screenWidth / 11, breadth: screenWidth / 11, overlayColor: Color.white, overlayRadius: screenWidth / 125, shadowRadius: screenWidth / 125)
                    })
                    .buttonStyle(ThemeAnimationStyle())
                    .navigationBarBackButtonHidden(true)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                
                VStack (alignment: .leading){
                    HStack{
                        Text("Sold")
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                            .font(.system(size: 13))
                        Text("• 1h")
                            .font(.system(size: 12))
                            .fontWeight(.bold)
                    }
                    Text("by Kanye West")
                            .font(.system(size: 12))
                }
                .multilineTextAlignment(.center)
            }
            .frame(width: screenWidth / 3, height: screenWidth / 8)
            .padding()
            
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

struct CollectionRecentActivityRow_Previews: PreviewProvider {
    static var previews: some View {
        CollectionRecentActivityRow(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}

