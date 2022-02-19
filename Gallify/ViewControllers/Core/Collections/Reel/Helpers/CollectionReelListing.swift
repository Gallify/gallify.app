//
//  ExpandedListing.swift
//  Gallify
//
//  Created by Gianluca Profio on 9/26/21.
//

import SwiftUI
import SDWebImageSwiftUI


struct CollectionReelListing: View {
    
    
    @State private var showDetail = false
    @State var showActionSheet: Bool = false
    @State var art_popup = ""
    @State var scrollTo = 0
    
//    @State private var showDetail2 = false
//    @State private var showDetail3 = false
//
//
//    //New Liked System
//
//    @State private var animate1 = false
//    @State private var animate2 = false
//    @State private var animate3 = false
//
//    @State private var isLiked1 = false
//    @State private var isLiked2 = false
//    @State private var isLiked3 = false
//
//    @State private var likeAnimation1 = false
//    @State private var likeAnimation2 = false
//    @State private var likeAnimation3 = false
//
//    private let duration: Double = 0.05
//
//    private var animationScale1: CGFloat {
//        isLiked1 ? 0.6: 2.0
//    }
//    private var animationScale2: CGFloat {
//        isLiked2 ? 0.6: 2.0
//    }
//    private var animationScale3: CGFloat {
//        isLiked3 ? 0.6: 2.0
//    }
//
//    func performAnimation1(){
//        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1500)) {
//            likeAnimation1 = false
//        }
//    }
//    func performAnimation2(){
//        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1500)) {
//            likeAnimation2 = false
//        }
//    }
//    func performAnimation3(){
//        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1500)) {
//            likeAnimation3 = false
//        }
//    }
//
//    //Expanded Listing Functionality
//    @State private var isExpanded1 = false
//    @State private var isExpanded2 = false
//    @State private var isExpanded3 = false
//
//    // Setting The Screen Width
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    @EnvironmentObject var firestoreQuery : FirestoreQuery

//
//    // Add To Collection Pop-Up Integration
   
    var actionSheet: ActionSheet {
        ActionSheet(title: Text("Add to a Collection"), message: Text("Your Collections:"), buttons: [
            .default(Text("Collection 1")),
            .default(Text("Collection 2")),
            .destructive(Text("Cancel"))
        ])
    }
    
    var body: some View {
        
        Text("Scroll")
        Text("\(firestoreQuery.scrollTo)")
        
        ScrollView {
            
            ScrollViewReader { value in
                if(firestoreQuery.artworkThatsPlaying.count > 0){
                    ForEach(0...firestoreQuery.artworkThatsPlaying.count-1, id: \.self) { i in
                        
                        
                        
                        VStack {
                            
                            ZStack (alignment: .center) {
                                
                                WebImage(url: URL(string: firestoreQuery.artworkThatsPlaying[i].thumbnail))
                                .resizable()
                                //.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                                .overlay(Rectangle().frame(width: nil, height: 1, alignment: .top).foregroundColor(Color.black), alignment: .top)

                                .scaledToFit()
                                //.frame(width: screenWidth / 1, height: screenWidth / 1)
            //                    .onTapGesture (count: 2) {
            //                        likeAnimation1 = true
            //                        performAnimation1()
            //                        self.isLiked1.toggle()
            //
            //                    }
                                
            //                    Image(systemName: isLiked1 ? "heart.fill": "blank")
            //                        .resizable()
            //                        .scaledToFit()
            //                        .frame(width:  100, height: 100)
            //                        .scaleEffect(likeAnimation1 ? 1: 0)
            //                        .opacity(likeAnimation1 ? 1: 0)
            //                        .animation(.spring())
            //                        .foregroundColor(isLiked1 ? Color.white: Color.black)
                            
                            }
                                HStack {
                                    
                                    Text("\(firestoreQuery.artworkThatsPlaying[i].creator)  ")
                                        .font(.system(size: 15))
                                        .foregroundColor(.primary)
            //                            .fontWeight(.semibold)
                                    
                                    Text("\(firestoreQuery.artworkThatsPlaying[i].name)  ")
                                        .font(.system(size: 20))
                                        .foregroundColor(.primary)
            //                            .fontWeight(.semibold)
                                                        
                                    
                                    Spacer()

                                    Button(action: {
                                        self.showActionSheet.toggle()
                                    }) {
                                        Image(systemName: "ellipsis")
                                            .font(.system(size: 20))
                                            .foregroundColor(.black)
                                        }
                                        .actionSheet(isPresented: $showActionSheet, content: {
                                                self.actionSheet })
                                    
                                    Text("\(firestoreQuery.artworkThatsPlaying[i].price) ")
                                        //.foregroundColor(Color(red: 1.0, green: 0.55, blue: 1.0))
                                        .font(.system(size: 20))
                                        .foregroundColor(.primary)
                                        .bold()
                                    
                                    
            //                        Button(action: {
            //                                self.isLiked1.toggle()
            //                        }) {
            //                            Image(systemName: isLiked1 ? "heart.circle.fill": "heart.circle")
            //                                .foregroundColor(isLiked1 ? Color.red: Color.black)
            //                                .font(.system(size: 30))
            //                            }
                                    
                                    Button {
                                        withAnimation(.easeInOut(duration: 0.25)) {
                                            showDetail.toggle()
                                            art_popup = firestoreQuery.artworkThatsPlaying[i].name
                                            
                                            if(showDetail == false){
                                                art_popup = ""
                                            }
                                        }
                                    } label: {
                                        VStack {
                                            
                                            Label("", systemImage: "chevron.down.circle")
                                                .imageScale(.large)
                                                .rotationEffect(.degrees(showDetail ? 180 : 0))
                                                .animation(.spring(), value: showDetail)
                                                .font(.system(size: 20))
                                                .foregroundColor(.black)
                                                .padding(.top, 25)
                        
                                            Spacer()
                                        }
                                    }
                                    .font(.system(size: 17))
                                    
                                    if (showDetail && firestoreQuery.artworkThatsPlaying[i].name == art_popup) {
                                        CollectionReelDescription(screenWidth: screenWidth, screenHeight: screenHeight, artDetails: firestoreQuery.artworkThatsPlaying[i])
                                           // .offset(x: -screenWidth/95)
                                    }
                                    
                                
                                    
                                }
                                .padding(.top, 20)
                                .padding(.leading, 8)
                                .padding(.trailing, 11.5)
                            
                                                
                        }
                        .frame(width: screenWidth)
                    }
                    .onChange(of: firestoreQuery.scrollTo, perform: { scroll in
                        value.scrollTo(firestoreQuery.scrollTo, anchor: .top)
//                        withAnimation(.spring()){
//                            value.scrollTo(firestoreQuery.scrollTo, anchor: .top)
//                        }
                       
                    })
                }
            
            }
        }.onAppear(){
            firestoreQuery.scrollTo = firestoreQuery.scrollTo
        }
 
    }
}

struct CollectionReelListing_Previews: PreviewProvider {
    static var previews: some View {
        CollectionReelListing(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}



