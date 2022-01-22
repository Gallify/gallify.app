//
//  SelfProfileFeatured.swift
//  Gallify
//
//  Created by Tejvir Mann on 1/8/22.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth
import SDWebImageSwiftUI

struct SelfProfileFeatured: View {
    
    @EnvironmentObject var viewModel: TabBarViewModel
    @EnvironmentObject var firestoreQuery: FirestoreQuery
    @State var artNumber = 1
    
    @State private var sheetMode2: SheetMode = .none
    //@Binding var showNewScreen: Bool
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
//        ZStack{
//            //here
//            newscreen(showNewScreen: $showNewScreen)
//                .padding(.top, 10)
//                .offset(y: showNewScreen ? 0 : 700)
//                .animation(.spring())
//
//
//        }
//        .zIndex(2.0)
//
        
        VStack{
            
            HStack {
                        
                Text("Featured")
                    .font(.system(size: screenWidth / 12.5, weight: .semibold))
                        
                Spacer()
                        
            }
            .padding(.leading, screenWidth / 15)
            .padding(.bottom, screenHeight / 160)
            
            ForEach(firestoreQuery.featuredArt){ artwork in
                
                
                Button(action: {
                    firestoreQuery.isPresented.toggle()
                    firestoreQuery.data.isClicked = artwork.art_id
                }){
                    HStack {
                        
                        Text("\(artNumber)")
                            .font(.system(size: screenWidth / 15, weight: .medium))
                            .padding(.trailing, screenWidth / 50)
                            
                        
                            HStack {
                                    
                                WebImage(url: URL(string: artwork.content_url))
                                    .resizable()
                                    .frame(width: screenWidth / 7.5, height: screenHeight / 16.25)
                                    
                                VStack(alignment: .leading) {
                                        
                                    if(firestoreQuery.data.isClicked == artwork.art_id){
                                        Text(artwork.name)
                                            .foregroundColor(Color("Gallify-Pink"))
                                            .fontWeight(.bold)
                                            .font(.system(size: screenWidth / 20, weight: .medium))
                                            .lineLimit(1)
                                    }
                                    else{
                                        Text(artwork.name)
                                            .fontWeight(.bold)
                                            .font(.system(size: screenWidth / 20, weight: .medium))
                                            .foregroundColor(.black)
                                            .lineLimit(1)
                                    }
                                    
                                    
                                    Text("\(artwork.popularity)")
                                        .font(.system(size: screenWidth / 24, weight: .light))
                                        .foregroundColor(.black)
                                        .lineLimit(1)
                                        
                                }
                                .padding(.leading, screenWidth / 37.5)
                                    
                                Spacer()
                                    
                            }
                            .buttonStyle(ThemeAnimationStyle())
                            .navigationBarHidden(true)
                            
                      //  })
                        
                        Button(action: {
                            
                        }, label: {
                            
                            Image(systemName: "ellipsis")
                                .foregroundColor(.black)
                            
                        })
                        
                    }
                    .padding(.vertical, screenHeight / 160)
                    .padding(.horizontal, screenWidth / 15)
                }
//                }.fullScreenCover(isPresented: $firestoreQuery.isPresented){
//                    CollectionReelView(screenWidth: screenWidth, screenHeight: screenHeight)
//
//                }

            }
            
            
            
            
            
            
            //updated sheet.
            ForEach(firestoreQuery.featuredArt) { artwork in
                
                
                //flexible sheet
                //FlexibleSheet(sheetMode: $sheetMode2) //{//$firestoreQuery.sheetMode
                    
                    
                   // CollectionReelView(screenWidth: screenWidth, screenHeight: screenHeight)
               // }
                
                
                Button(action: {
                   
                    firestoreQuery.data.isClicked = artwork.art_id
                    firestoreQuery.isPresented.toggle()
                    
                    firestoreQuery.sheetMode = .full
                    firestoreQuery.maximized = true
                    sheetMode2 = .full
                    
                    firestoreQuery.showNewScreen = true
                    
                }){
                    HStack {
                        
                        Text("\(artNumber)")
                            .font(.system(size: screenWidth / 15, weight: .medium))
                            .padding(.trailing, screenWidth / 50)
                            
                        
                            HStack {
                                    
                                WebImage(url: URL(string: artwork.content_url))
                                    .resizable()
                                    .frame(width: screenWidth / 7.5, height: screenHeight / 16.25)
                                    
                                VStack(alignment: .leading) {
                                        
                                    if(firestoreQuery.data.isClicked == artwork.art_id){
                                        Text(artwork.name)
                                            .foregroundColor(Color("Gallify-Pink"))
                                            .fontWeight(.bold)
                                            .font(.system(size: screenWidth / 20, weight: .medium))
                                            .lineLimit(1)
                                    }
                                    else{
                                        Text(artwork.name)
                                            .fontWeight(.bold)
                                            .font(.system(size: screenWidth / 20, weight: .medium))
                                            .foregroundColor(.black)
                                            .lineLimit(1)
                                    }
                                    
                                    
                                    Text("\(artwork.popularity)")
                                        .font(.system(size: screenWidth / 24, weight: .light))
                                        .foregroundColor(.black)
                                        .lineLimit(1)
                                        
                                }
                                .padding(.leading, screenWidth / 37.5)
                                    
                                Spacer()
                                    
                            }
                            .buttonStyle(ThemeAnimationStyle())
                            .navigationBarHidden(true)
                            
                      //  })
                        
                        Button(action: {
                            
                        }, label: {
                            
                            Image(systemName: "ellipsis")
                                .foregroundColor(.black)
                            
                        })
                        
                    }
                    .padding(.vertical, screenHeight / 160)
                    .padding(.horizontal, screenWidth / 15)
                    
                    
                    
                }
                

                

            }
            
            
            
            
            
            
//            ZStack{
//                if(showNewScreen){
//                    newscreen(showNewScreen: $showNewScreen)
//                        .padding(.top, 100)
//                        .transition(.move(edge: .bottom))
//                        //.offset(y: firestoreQuery.maximized ? 0 : screenHeight)
//                        .animation(.spring())
//                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
//                }
//            }
//            .zIndex(2.0)
//
           
            
            
//            CollectionReelView(screenWidth: screenWidth, screenHeight: screenHeight)
//                .padding(.top, 100)
//                .offset(y: firestoreQuery.maximized ? 0 : screenHeight)
//                .animation(.spring())
//                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
//
        }
        .padding(.vertical, screenHeight / 80)
        .navigationBarHidden(true)
        //.onAppear{ NetworkingCall() }
        
    }
    
}

struct newscreen: View{
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var firestoreQuery: FirestoreQuery
    //@Binding var showNewScreen: Bool

    var body: some View{
        ZStack(alignment: .topLeading){
            Color.purple
                .edgesIgnoringSafeArea(.all)

            Button(action: {
                //presentationMode.wrappedValue.dismiss()
                firestoreQuery.showNewScreen.toggle()
            }, label: {
                Text("bttt")
            })
        }
    }

}

//struct newscreen: View{
//    @Environment(\.presentationMode) var presentationMode
//   // @Binding var showNewScreen: Bool
//
//    var body: some View{
//        ZStack{
//            Color.purple
//                .edgesIgnoringSafeArea(.all)
//
//            Button(action: {
//                presentationMode.wrappedValue.dismiss()
//            }, label: {
//                Text("ho")
//            })
//        }
//    }
//
//}


//struct SelfProfileFeatured_Previews: PreviewProvider {
//    static var previews: some View {
//        SelfProfileFeatured()
//            .environmentObject(TabBarViewModel())
//            .environmentObject(FirestoreQuery())
//    }
//}
