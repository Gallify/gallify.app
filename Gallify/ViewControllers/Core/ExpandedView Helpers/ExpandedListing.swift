//
//  ExpandedListing.swift
//  Gallify
//
//  Created by Gianluca Profio on 9/26/21.
//

import SwiftUI

struct ExpandedListing: View {
    let screenWidth: CGFloat
    @State private var didTap:Bool = false
    var body: some View {
        
        VStack {
            
            Image("leonardo")
            .resizable()
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            .frame(width: screenWidth / 1, height: screenWidth / 1)
            
            VStack (alignment: .leading){
                HStack {
                    VStack (alignment: .leading) {
                        Text("Leonardo Da Vinci")
                            .font(.system(size: 19))
                        HStack {
                            Text("1/43")
                                .font(.system(size: 19))
                                .fontWeight(.bold)
                            Button(action: {
                                print("")
                            }) {
                                Image(systemName: "chevron.down")
                                .resizable()
                                .foregroundColor(Color.black)
                                .frame(width: screenWidth / 20, height: screenWidth / 30)
                            }
                            .padding(.leading)
                        }
                    }
                    
                    .padding(.leading)
                    
                    Spacer()
                    
                    Button(action: {
                        print("")
                    }) {
                        Image(systemName: "ellipsis")
                        .foregroundColor(Color.black)
                    }
                    
                    Text("$43,000")
                        .font(.system(size: 19))
                        .padding()

                    Button(action: {
                        self.didTap = true
                    }) {
                        Image(systemName: "heart.circle.fill")
                    }
                    .foregroundColor(didTap ? Color.red : Color.black)
                    .padding(.trailing)
                }
            }
        ExpandedDescription(screenWidth: screenWidth)
        Spacer()
        }
        
        VStack {
            
            Image("cat")
            .resizable()
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            .frame(width: screenWidth / 1, height: screenWidth / 1)
            
            VStack (alignment: .leading) {
                HStack{
                    
                    VStack (alignment: .leading) {
                        Text("Bobby")
                            .font(.system(size: 19))
                        HStack {
                            Text("1/1")
                                .fontWeight(.bold)
                                .font(.system(size: 19))
                            Button(action: {
                                print("")
                            }) {
                                Image(systemName: "chevron.down")
                                .resizable()
                                .foregroundColor(Color.black)
                                .frame(width: screenWidth / 20, height: screenWidth / 30)
                            }
                            .padding(.leading)
                            
                        }
                    }
                    .padding(.leading)
                    
                    Spacer()
                    
                    Button(action: {
                        print("")
                    }) {
                        Image(systemName: "ellipsis")
                        .foregroundColor(Color.black)
                    }
                    
                    Text("$100")
                        .padding()
                        .font(.system(size: 19))
                                       
                    Button(action: {
                        self.didTap = true
                    }) {
                        Image(systemName: "heart.circle.fill")
                    }
                    .foregroundColor(didTap ? Color.red : Color.black)
                    .padding(.trailing)
                    
                }
            }
            ExpandedDescription(screenWidth: screenWidth)
            Spacer()
        }
        
        VStack {
            
            Image("starry-night")
            .resizable()
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            .frame(width: screenWidth / 1, height: screenWidth / 1)
            
            VStack (alignment: .leading) {
                HStack{
                    VStack (alignment: .leading) {
                        Text("Jack Brown")
                            .font(.system(size: 19))
                        HStack {
                            Text("1/10")
                                .fontWeight(.bold)
                                .font(.system(size: 19))
                            Button(action: {
                                print("")
                            }) {
                                Image(systemName: "chevron.down")
                                .resizable()
                                .foregroundColor(Color.black)
                                .frame(width: screenWidth / 20, height: screenWidth / 30)
                            }
                            .padding(.leading)
                            
                        }
                    }
                    .padding(.leading)
                    
                    Spacer()
                    
                    Button(action: {
                        print("")
                    }) {
                        Image(systemName: "ellipsis")
                        .foregroundColor(Color.black)
                    }
                    
                    Text("$15,000")
                        .padding()
                        .font(.system(size: 19))
                                                
                    Button(action: {
                        self.didTap = true
                    }) {
                        Image(systemName: "heart.circle.fill")
                    }
                    .foregroundColor(didTap ? Color.red : Color.black)
                    .padding(.trailing)
                }
            }
            ExpandedDescription(screenWidth: screenWidth)
            Spacer()
        }
    }
}

struct ExpandedListing_Previews: PreviewProvider {
    static var previews: some View {
        ExpandedListing(screenWidth: UIScreen.main.bounds.width)
    }
}
