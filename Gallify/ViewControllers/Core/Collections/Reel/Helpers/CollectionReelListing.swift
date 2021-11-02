//
//  ExpandedListing.swift
//  Gallify
//
//  Created by Gianluca Profio on 9/26/21.
//

import SwiftUI
struct CollectionReelListing: View {
    
    //New Liked System
    
    @State private var animate1 = false
    @State private var animate2 = false
    @State private var animate3 = false
    
    @State private var isLiked1 = false
    @State private var isLiked2 = false
    @State private var isLiked3 = false
    
    @State private var likeAnimation1 = false
    @State private var likeAnimation2 = false
    @State private var likeAnimation3 = false
    
    private let duration: Double = 0.05
    
    private var animationScale1: CGFloat {
        isLiked1 ? 0.6: 2.0
    }
    private var animationScale2: CGFloat {
        isLiked2 ? 0.6: 2.0
    }
    private var animationScale3: CGFloat {
        isLiked3 ? 0.6: 2.0
    }

    func performAnimation1(){
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1500)) {
            likeAnimation1 = false
        }
    }
    func performAnimation2(){
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1500)) {
            likeAnimation2 = false
        }
    }
    func performAnimation3(){
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1500)) {
            likeAnimation3 = false
        }
    }
    
    //Expanded Listing Functionality
    @State private var isExpanded1 = false
    @State private var isExpanded2 = false
    @State private var isExpanded3 = false
    
    // Setting The Screen Width
    let screenWidth: CGFloat
    
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
            
            ZStack (alignment: .center) {
                Image("leonardo")
                    .resizable()
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                .frame(width: screenWidth / 1, height: screenWidth / 1)
                .onTapGesture (count: 2) {
                    likeAnimation1 = true
                    performAnimation1()
                    self.isLiked1.toggle()}
                
                Image(systemName: isLiked1 ? "heart.fill": "blank")
                    .resizable()
                    .scaledToFit()
                    .frame(width:  100, height: 100)
                    .scaleEffect(likeAnimation1 ? 1: 0)
                    .opacity(likeAnimation1 ? 1: 0)
                    .animation(.spring())
                    .foregroundColor(isLiked1 ? Color.white: Color.black)
            
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
                            self.isLiked1.toggle()
                    }) {
                        Image(systemName: isLiked1 ? "heart.circle.fill": "heart.circle")
                            .foregroundColor(isLiked1 ? Color.red: Color.black)
                            .font(.system(size: 30))
                            .scaleEffect(animate1 ? animationScale1: 1)
                            .animation(.easeIn(duration: duration))
                        }
                }
                .padding(.leading, 8)
                .padding(.trailing, 11.5)
            HStack {
                Spacer()
                DisclosureGroup("Edition 2", isExpanded: $isExpanded1) {
                    CollectionReelDescription(screenWidth: screenWidth)
                }
                .font(.system(size: 17))
                Spacer()
                Spacer()
            }
            Spacer()
        }
        .frame(width: screenWidth)
        
        VStack {
            
            ZStack (alignment: .center) {
                Image("cat")
                .resizable()
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                .frame(width: screenWidth / 1, height: screenWidth / 1)
                .onTapGesture (count: 2) {
                    likeAnimation2 = true
                    performAnimation2()
                    self.isLiked2.toggle()}
                
                Image(systemName: isLiked2 ? "heart.fill": "blank")
                    .resizable()
                    .scaledToFit()
                    .frame(width:  100, height: 100)
                    .scaleEffect(likeAnimation2 ? 1: 0)
                    .opacity(likeAnimation2 ? 1: 0)
                    .animation(.spring())
                    .foregroundColor(isLiked2 ? Color.white: Color.black)
            
            }
                HStack {
                    
                    Text("Bobby  - ")
                        .font(.system(size: 19))
                        .fontWeight(.semibold)
                                        
                    Text("$500")
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
                            self.isLiked2.toggle()
                    }) {
                        Image(systemName: isLiked2 ? "heart.circle.fill": "heart.circle")
                            .foregroundColor(isLiked2 ? Color.red: Color.black)
                            .font(.system(size: 30))
                            .scaleEffect(animate2 ? animationScale2: 1)
                            .animation(.easeIn(duration: duration))
                        }
                }
                .padding(.leading, 8)
                .padding(.trailing, 11.5)
            HStack {
                Spacer()
                DisclosureGroup("Edition 15", isExpanded: $isExpanded1) {
                    CollectionReelDescription(screenWidth: screenWidth)
                }
                .font(.system(size: 17))
                Spacer()
                Spacer()
            }
            Spacer()
        }
        .frame(width: screenWidth)

        VStack {
            
            ZStack (alignment: .center) {
                Image("starry-night")
                .resizable()
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                .frame(width: screenWidth / 1, height: screenWidth / 1)
                .onTapGesture (count: 2) {
                    likeAnimation3 = true
                    performAnimation3()
                    self.isLiked3.toggle()}
                
                Image(systemName: isLiked3 ? "heart.fill": "blank")
                    .resizable()
                    .scaledToFit()
                    .frame(width:  100, height: 100)
                    .scaleEffect(likeAnimation3 ? 1: 0)
                    .opacity(likeAnimation3 ? 1: 0)
                    .animation(.spring())
                    .foregroundColor(isLiked3 ? Color.white: Color.black)
            
            }
                HStack {
                    
                    Text("Starry Night  - ")
                        .font(.system(size: 19))
                        .fontWeight(.semibold)
                                        
                    Text("$100")
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
                            self.isLiked3.toggle()
                    }) {
                        Image(systemName: isLiked3 ? "heart.circle.fill": "heart.circle")
                            .foregroundColor(isLiked3 ? Color.red: Color.black)
                            .font(.system(size: 30))
                            .scaleEffect(animate3 ? animationScale3: 1)
                            .animation(.easeIn(duration: duration))
                        }
                }
                .padding(.leading, 8)
                .padding(.trailing, 11.5)
            HStack {
                Spacer()
                DisclosureGroup("Edition 2", isExpanded: $isExpanded1) {
                    CollectionReelDescription(screenWidth: screenWidth)
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

struct CollectionReelListing_Previews: PreviewProvider {
    static var previews: some View {
        CollectionReelListing(screenWidth: UIScreen.main.bounds.width)
    }
}


