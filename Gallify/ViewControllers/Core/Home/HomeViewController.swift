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
                        
                        HomeViewStories(screenHeight: screenHeight, screenWidth: screenWidth)
                        
                        HStack {
                            
                            Text("Good evening!")
                                .font(.system(size: screenWidth / 11, weight: .bold))
                                .padding(.leading, widthPad)
                                .padding(.bottom, heightPad / 2)
                            
                            Spacer()
                            
                        }
                        
                        HStack {
                                                    
                            Text("Recent")
                                .font(.system(size: screenWidth / 13.5, weight: .bold))
                                .padding(.leading, widthPad)
                                                    
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
                        
                        HomeViewAuction(screenHeight: screenHeight, screenWidth: screenWidth)
                        
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
                
            }
            .navigationBarHidden(true)
            .onAppear{ NetworkingCall() }
            
    }
    
    func NetworkingCall(){
        isLoading = true
        DispatchQueue.main.async(){
            
            //get collections
            
            //get art
            
            
            isLoading = false
        
        }
    }
    
}

// Remove preview after done coding home screen
struct HomeScreenPreview: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(TabBarViewModel())
    }
}
