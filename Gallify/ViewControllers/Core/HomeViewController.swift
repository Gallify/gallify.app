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
    
    @EnvironmentObject var viewModel : HomeViewModel
        var body: some View {
            
            VStack {
                
                HomeViewHeader()
                
                ScrollView(showsIndicators: false) {
                    
                    VStack {
                            
                        HomeViewStories()
                        
                        HStack {
                            
                            Text("Good evening!")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .padding(15.0)
                            
                            Spacer()
                            
                        }
                        
                        HStack {
                            
                            Text("Your Portfolio")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.leading)
                            
                            Spacer()
                            
                        }
                        
                        //HomeViewPortfolio()
                        
                        HStack {
                            
                            Text("Recent")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding([.top, .leading])
                            
                            Spacer()
                            
                        }
                        
                        HomeViewRecent()
                        
                        HStack {
                            
                            Text("Discover")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding([.top, .leading])
                            
                            Spacer()
                            
                        }
                        
                        HomeViewDiscover()
                    }
                    
                    
                    VStack {
                        
                        HStack {
                            
                            Text("Made for you")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding([.top, .leading])
                            
                            Spacer()
                            
                        }
                        
                        HomeViewMadeForYou()
                        
                        HStack {
                            
                            Text("Auctions")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding([.top, .leading])
                                
                            Spacer()
                            
                        }
                        
                        HomeViewAuction()
                    
                    }
                    
                }
                
            }
            
    }
    
}

// Remove preview after done coding home screen
struct HomeScreenPreview: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
