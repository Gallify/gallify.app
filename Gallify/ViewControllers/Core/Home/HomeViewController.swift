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
    @EnvironmentObject var firestoreQuery : FirestoreQuery
    @State var museumCount = 1
    
    var body: some View {
            
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
            
        NavigationView {
            
            VStack {
                    
                HomeViewHeader(screenHeight: screenHeight, screenWidth: screenWidth)
                    
                ScrollView(showsIndicators: false) {
                    
                    HomeViewBody(screenHeight: screenHeight, screenWidth: screenWidth, museumCount: museumCount)
                        .padding(.bottom, screenHeight / 54)
                    
                }
                
                if (firestoreQuery.showNewScreen == false) {
                    
                    if (firestoreQuery.artPlaying == true) {
                        
                        MinimizedView(screenHeight: screenHeight, screenWidth: screenWidth)
                        
                    }
                    
                }
                    
            }
            .onAppear(perform: getMuseumCount)
            .navigationBarHidden(true)
            
            
        }
        .navigationBarHidden(true)
        .onAppear{ async { await NetworkingCall() } }
        
    }
    
    func getMuseumCount() {
        
        if (firestoreQuery.homeMuseums.count > 1) {
            
            museumCount = firestoreQuery.homeMuseums.count
            
        }
        
    }
   
    //@MainActor
    func NetworkingCall() async {
        
        //this gets all the data for the home page.
        //firestoreQuery.getHome()
        
        //await firestoreQuery.getHome()
        await firestoreQuery.getHomeMuseumList()

        //getMuseums. Gets all these Museums. List of Playlists
        await firestoreQuery.getHomeMuseums()

        //getPlaylists. Gets all the data for the playlists. Called once per museum.
        await firestoreQuery.getHomePlaylists()
        
    }
    
}
