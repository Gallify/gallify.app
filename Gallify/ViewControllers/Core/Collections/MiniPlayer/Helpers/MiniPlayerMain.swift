//
//  MiniPlayerMain.swift
//  Gallify
//
//  Created by Gianluca Profio on 11/27/21.
//

import SwiftUI

struct MiniPlayerMain: View {
    
    /*@State private var showDetail1 = false
    @State private var showDetail2 = false
    @State private var showDetail3 = false

    
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
    let screenHeight: CGFloat
    
    // Add To Collection Pop-Up Integration
    @State var showActionSheet: Bool = false
    var actionSheet: ActionSheet {
        ActionSheet(title: Text("Add to a Collection"), message: Text("Your Collections:"), buttons: [
            .default(Text("Collection 1")),
            .default(Text("Collection 2")),
            .destructive(Text("Cancel"))
        ])
    }*/
    
    var animation: Namespace.ID
    @Binding var expand : Bool
    
    var screenHeight: CGFloat
    let screenWidth: CGFloat
    
    //Safe Area
    
    var safeArea = UIApplication.shared.windows.first?.safeAreaInsets
    
    var body: some View {
        
        VStack {
            
                Capsule()
                    .fill(Color.gray)
                    .frame(width: expand ? 60 : 0, height: expand ? 4 : 0)
                    .opacity(expand ? 1 : 0)
                    .padding(.top, expand ? safeArea?.top : 0)
                    .padding(.vertical, expand ? 30 : 0)
                
                HStack(spacing: 15) {
                    
                    if expand{Spacer(minLength: 0)}
                    
                    Image("leonardo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: expand ? screenHeight : 55, height: expand ? screenHeight : 55)
                        .cornerRadius(15)
                    
                    if !expand {
                                            
                        Text("Leonardo Da Vinci")
                            .fontWeight(.semibold)
                            .font(.system(size: 19))
                            .multilineTextAlignment(.center)
                            .matchedGeometryEffect(id: "Label", in: animation)
                        
                    }
                    
                    Spacer(minLength: 0)
                    
                    if !expand {
                        
                        Image(systemName: "chevron.up.circle")
                            .font(.system(size: 35))
                            .foregroundColor(.black)
                        
                    }
                    
                }
                .padding(.horizontal)
                
                VStack {
                    
                    if expand {
                        
                        Text("Leonardo Da Vinci")
                            .foregroundColor(.primary)
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .matchedGeometryEffect(id: "Label2", in: animation)
                        
                    }
                    
                    HStack {
                                            
                        if expand {
                            
                            Spacer(minLength: 0)
                                                            
                            NavigationLink (
                                destination: SwiftUIView().edgesIgnoringSafeArea(.all),
                                label: {
                                Image (systemName: "arkit")
                                    .resizable()
                                    .foregroundColor(Color.black)
                                    .frame(width: screenWidth / 10, height: screenWidth / 10)
                                    .padding(.trailing, screenWidth / 30)
                                    .animation(.easeInOut)
                                })
                                .buttonStyle(ThemeAnimationStyle())
                                .navigationBarBackButtonHidden(true)
                                .navigationBarTitle("")
                                .navigationBarHidden(true)
                                .matchedGeometryEffect(id: "Label3", in: animation)
                            
                            Spacer(minLength: 0)
                            
                            Text("$43,000")
                                .foregroundColor(Color(red: 1.0, green: 0.55, blue: 1.0))
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                                .matchedGeometryEffect(id: "Label4", in: animation)
                            
                            Spacer(minLength: 0)
                            
                            Image(systemName: "heart.circle")
                                .font(.system(size: 40))
                                .foregroundColor(.black)
                                .matchedGeometryEffect(id: "Label5", in: animation)
                            
                            Spacer(minLength: 0)
                            
                        }
                                            
                    }
                    .padding()
                    .padding(.top, 20)
                    
                    // Live String
                    
                    HStack {
                        
                        Capsule()
                            .fill (
                                LinearGradient(gradient: .init(colors:[Color.primary.opacity(0.7),Color.primary.opacity(0.1)]), startPoint: .leading, endPoint: .trailing)
                            )
                            .frame(height: 4)
                        
                        Text("Edition 2 | 15")
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        Capsule()
                            .fill (
                                LinearGradient(gradient: .init(colors:[Color.primary.opacity(0.1),Color.primary.opacity(0.7)]), startPoint: .leading, endPoint: .trailing)
                            )
                            .frame(height: 4)
                    }
                    .padding()
                    
                    CollectionReelDescription(screenWidth: screenWidth, screenHeight: screenHeight)
                        .offset(y: -screenWidth/8)
                    
                    //
                    
                    Spacer(minLength: 0)
            }
            // This provides the stretch effect
            .frame(width: expand ? nil : 0, height: expand ? nil : 0)
            .opacity(expand ? 1 : 0)
            
        }
        // Expanding to Full Screen when Clicked...
        .frame(maxWidth: .infinity, maxHeight: expand ? .infinity : 80)
        .background(
        
            VStack(spacing: 0){
                
                MiniPlayerBlur()
                
                Divider()
            }
            .onTapGesture(perform: {
                
                withAnimation(.spring()){expand.toggle()}
            })
        )
        .ignoresSafeArea()
        //.offset(y: 0)
    }
}




/*
 HStack {
     Button {
         withAnimation(.easeInOut(duration: 0.25)) {
             showDetail1.toggle()
         }
     } label: {
         VStack {
             
             Label("", systemImage: "chevron.down.circle")
                 .imageScale(.large)
                 .rotationEffect(.degrees(showDetail1 ? 180 : 0))
                 .animation(.spring(), value: showDetail1)
                 .font(.system(size: 25))
                 .foregroundColor(.black)
                 .padding(.top, 25)

             Spacer()
         }
     }
     .font(.system(size: 17))
    }
                 
    if showDetail1 {
     CollectionReelDescription(screenWidth: screenWidth, screenHeight: screenHeight)
         .offset(x: -screenWidth/95)
}
 */
