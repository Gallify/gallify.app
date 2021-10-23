//
//  ExpandedListing.swift
//  Gallify
//
//  Created by Gianluca Profio on 9/26/21.
//

import SwiftUI
struct ExpandedListing: View {
    
    //Expanded Listing Functionality
    @State private var isExpanded1 = false
    @State private var isExpanded2 = false
    @State private var isExpanded3 = false
    
    // Setting The Screen Width
    let screenWidth: CGFloat
    
    // Double Tap To Like Integration
    @State private var didTap:Bool = false
    @State private var fgColor1: Color = .black
    @State private var fgColor2: Color = .black
    @State private var fgColor3: Color = .black
    
    // Add To Collection Pop-Up Integration
    @State var showActionSheet: Bool = false
    var actionSheet: ActionSheet {
        ActionSheet(title: Text("Add to a Collection"), message: Text("Your Collections:"), buttons: [
            .default(Text("Collection 1")),
            .default(Text("Collection 2")),
            .destructive(Text("Cancel"))
        ])
    }
    
    var body: some View {
        
        VStack {
            
            Image("leonardo")
            .resizable()
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            .frame(width: screenWidth / 1, height: screenWidth / 1)
            .onTapGesture (count: 2) {
                fgColor1 = .red
            }
                HStack {
                    
                    Text("Leonardo Da Vinci  - ")
                        .font(.system(size: 19))
                        .fontWeight(.semibold)
                                        
                    Text("$43,000")
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 19))
                    
                    Spacer()

                    Button(action: {self.showActionSheet.toggle()
                    }) {
                        Image(systemName: "ellipsis.circle")
                            .font(.system(size: 30))
                            .foregroundColor(.black)
                                }
                    .actionSheet(isPresented: $showActionSheet, content: {
                                self.actionSheet })
                    
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
                }
                .padding(.leading, 8)
                .padding(.trailing, 11.5)
            HStack {
                Spacer()
                DisclosureGroup("Edition 2", isExpanded: $isExpanded1) {
                    ExpandedDescription(screenWidth: screenWidth)
                }
                .font(.system(size: 17))
                Spacer()
                Spacer()
            }
            Spacer()
        }
        .frame(width: screenWidth)
        
        VStack {
            
            Image("cat")
            .resizable()
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            .frame(width: screenWidth / 1, height: screenWidth / 1)
            .onTapGesture (count: 2) {
                fgColor1 = .red
            }
                HStack {
                    
                    Text("Leonardo Da Vinci  - ")
                        .font(.system(size: 19))
                        .fontWeight(.semibold)
                                        
                    Text("$43,000")
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 19))
                    
                    Spacer()

                    Button(action: {self.showActionSheet.toggle()
                    }) {
                        Image(systemName: "ellipsis.circle")
                            .font(.system(size: 30))
                            .foregroundColor(.black)
                                }
                    .actionSheet(isPresented: $showActionSheet, content: {
                                self.actionSheet })
                    
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
                }
                .padding(.leading, 8)
                .padding(.trailing, 11.5)
            HStack {
                Spacer()
                DisclosureGroup("Edition 2", isExpanded: $isExpanded1) {
                    ExpandedDescription(screenWidth: screenWidth)
                }
                .font(.system(size: 17))
                Spacer()
                Spacer()
            }
            Spacer()
        }
        .frame(width: screenWidth)

        VStack {
            
            Image("starry-night")
            .resizable()
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            .frame(width: screenWidth / 1, height: screenWidth / 1)
            .onTapGesture (count: 2) {
                fgColor1 = .red
            }
                HStack {
                    
                    Text("Leonardo Da Vinci  - ")
                        .font(.system(size: 19))
                        .fontWeight(.semibold)
                                        
                    Text("$43,000")
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 19))
                    
                    Spacer()

                    Button(action: {self.showActionSheet.toggle()
                    }) {
                        Image(systemName: "ellipsis.circle")
                            .font(.system(size: 30))
                            .foregroundColor(.black)
                                }
                    .actionSheet(isPresented: $showActionSheet, content: {
                                self.actionSheet })
                    
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
                }
                .padding(.leading, 8)
                .padding(.trailing, 11.5)
            HStack {
                Spacer()
                DisclosureGroup("Edition 2", isExpanded: $isExpanded1) {
                    ExpandedDescription(screenWidth: screenWidth)
                }
                .font(.system(size: 17))
                Spacer()
                Spacer()
            }
            Spacer()
        }
        .frame(width: screenWidth)
        }
    }

struct ExpandedListing_Previews: PreviewProvider {
    static var previews: some View {
        ExpandedListing(screenWidth: UIScreen.main.bounds.width)
    }
}

