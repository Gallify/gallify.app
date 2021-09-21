//
//  HomeViewController.swift
//  Gallify
//
//  Created by Tejvir Mann on 8/18/21.
//

import UIKit
import SwiftUI

class HomeViewModel: ObservableObject {
    
}

struct HomeView : View {
    
    @EnvironmentObject var viewModel : TabBarViewModel
    
        var body: some View {
            
            let width = viewModel.screenWidth
            let pad = width / 25
            
            VStack {
                
                HomeViewHeader(screenWidth: width)
                
                ScrollView(showsIndicators: false) {
                    
                    VStack {
                            
                        HomeViewStories(screenWidth: width)
                        
                        HStack {
                            
                            Text("Good evening!")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .padding([.leading, .bottom], pad)
                            
                            Spacer()
                            
                        }
                        
                        HStack {
                            
                            Text("Your Portfolio")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.leading, pad)
                            
                            Spacer()
                            
                        }
                        
                        HomeViewPortfolio(screenWidth: width)
                        
                        HStack {
                            
                            Text("Auctions")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding([.top, .leading], pad)
                            
                            Button(action: {
                                
                                
                                
                            }, label: {
                                
                                Image(systemName: "greaterthan")
                                    .resizable()
                                    .foregroundColor(Color.black)
                                    .frame(width: width / 15, height: width / 15)
                                    .padding(.top, pad)
                                    .padding(.leading, pad / 2)
                                
                            })
                                
                            Spacer()
                            
                            Location(screenWidth: width)
                                .padding([.top, .trailing], pad)
                            
                        }
                        
                        HomeViewAuction(screenWidth: width)

                        HStack {
                            
                            Text("Museums")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding([.top, .leading], pad)
                            
                            Spacer()
                            
                        }
                        
                        HomeViewMuseums(screenWidth: width)
                        
                    }
                    
                    
                    VStack {
                        
                        HStack {
                            
                            Text("Recent")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding([.top, .leading], pad)
                            
                            Spacer()
                            
                        }
                        
                        HomeViewRecent(screenWidth: width)
                        
                        HStack {
                            
                            Text("Discover")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding([.top, .leading], pad)
                            
                            Spacer()
                            
                        }
                        
                        HomeViewDiscover(screenWidth: width)
                        
                        HStack {
                            
                            Text("Made for you")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding([.top, .leading], pad)
                            
                            Spacer()
                            
                        }
                        
                        HomeViewMadeForYou(screenWidth: width)
                                                
                    }
                    
                }
                
            }
            
    }
    
}

// Remove preview after done coding home screen
struct HomeScreenPreview: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(TabBarViewModel())
    }
}
