//
//  HomeViewController.swift
//  Gallify
//
//  Created by Tejvir Mann on 8/18/21.
//
import UIKit
import SwiftUI



class HomeViewModel: ObservableObject {
    
    //called here
    
}

struct HomeView : View {
    
    @EnvironmentObject var viewModel : TabBarViewModel
    @EnvironmentObject var firestoreQuery: FirestoreQuery
    
    @State private var isLoading = false
    
        var body: some View {
            
            let screenHeight = viewModel.screenHeight
            let screenWidth = viewModel.screenWidth
            let heightPad = screenHeight / 54
            let widthPad = screenWidth / 25
            
            if isLoading {
                LoadingView()
            }
            
            VStack {
                
                HomeViewHeader(screenHeight: screenHeight, screenWidth: screenWidth)
                
                ScrollView(showsIndicators: false) {
                    
                    VStack {
                        
                       // HomeViewStories(screenHeight: screenHeight, screenWidth: screenWidth)
                        
                        HStack {
                            
                            //print(viewModel.firestoreQuery.museumlist.museums[0])  viewModel.firestoreQuery.museumlist.museums[0]
                            Text("Firstname: \(firestoreQuery.data.firstName)") //\(firestoreQuery.museumlist.museums[1]) \(firestoreQuery.data.email)
                                .font(.system(size: screenWidth / 11, weight: .bold))
                                .padding(.leading, widthPad)
                                .padding(.bottom, heightPad / 2)
                            
                            Spacer()
                            
                        }
                        
                        HStack {

//                            Text("Good evening \(firestoreQuery.fullname)")  // \(firestoreQuery.museumlist.museums[1])
//                                .font(.system(size: screenWidth / 13.5, weight: .bold))
//                                .padding(.leading, widthPad)
//
//                            List(firestoreQuery.data.Library, id: \.self) { playlist in
//                                Text("Firstname")
//                                print(playlist)
//                            }
                            
                            ForEach(firestoreQuery.data.Library, id: \.self) { color in
                                Text(color)
                                    
                            }
                                
                            
                            
//                            Text("0th library index \(firestoreQuery.data.Library[0])")  // \(firestoreQuery.museumlist.museums[1])
//                                .font(.system(size: screenWidth / 13.5, weight: .bold))
//                                .padding(.leading, widthPad)
//
                            Spacer()
                                                
                        }
                                                
                        HomeViewRecent(screenHeight: screenHeight, screenWidth: screenWidth)
                    
//Portfolio turned off for now.
//                        HStack {
//
//                            Text("Your Portfolio")
//                                .font(.system(size: screenWidth / 13.5, weight: .bold))
//                                .padding(.leading, widthPad)
//                                .padding(.top, heightPad)
//
//                            Spacer()
//
//                        }
//
//                        HomeViewPortfolio(screenHeight: screenHeight, screenWidth: screenWidth)
                        
                        HStack {
                            
                            Text("Auctions")
                                .font(.system(size: screenWidth / 13.5, weight: .bold))
                                .padding(.leading, widthPad)
                            
                            Button(action: {
                                
                                
                                
                            }, label: {
                                
                                Image(systemName: "greaterthan")
                                    .resizable()
                                    .foregroundColor(Color.black)
                                    .frame(width: screenWidth / 15, height: screenHeight / 32.5)
                                    .padding(.leading, widthPad / 2)
                                
                            })
                                
                            Spacer()
                            
                            Location(screenHeight: screenHeight, screenWidth: screenWidth)
                                .padding(.trailing, widthPad)
                            
                        }
                        .padding(.top, heightPad)
                        
                        //HomeViewAuction(screenHeight: screenHeight, screenWidth: screenWidth)
                        HomeViewMadeForYou(screenHeight: screenHeight, screenWidth: screenWidth)
                    }
                    
                    VStack {
                        
                        HStack {
                            
                            Text("Museums")
                                .font(.system(size: screenWidth / 13.5, weight: .bold))
                                .padding(.leading, widthPad)
                                .padding(.top, heightPad)
                            
                            Spacer()
                            
                        }
                        
                        HomeViewMuseums(screenHeight: screenHeight, screenWidth: screenWidth)
                        
                        HStack {
                            
                            Text("Discover")
                                .font(.system(size: screenWidth / 13.5, weight: .bold))
                                .padding(.leading, widthPad)
                                .padding(.top, heightPad)
                            
                            Spacer()
                            
                        }
                        
                        HomeViewDiscover(screenHeight: screenHeight, screenWidth: screenWidth)
                        
                        HStack {
                            
                            Text("Made for you")
                                .font(.system(size: screenWidth / 13.5, weight: .bold))
                                .padding(.leading, widthPad)
                                .padding(.top, heightPad)
                            
                            Spacer()
                            
                        }
                        
                        HomeViewMadeForYou(screenHeight: screenHeight, screenWidth: screenWidth)
                                                
                    }
                    
                }
                .navigationBarHidden(true)
                
            }
            .navigationBarHidden(true)
            .onAppear{ NetworkingCall() }
            
    }
   
    func NetworkingCall(){
        firestoreQuery.getUser()
    }
    
}


// Remove preview after done coding home screen
struct HomeScreenPreview: PreviewProvider {

    static var previews: some View {
        HomeView()
            .environmentObject(TabBarViewModel())
            .environmentObject(FirestoreQuery())
    }
}
