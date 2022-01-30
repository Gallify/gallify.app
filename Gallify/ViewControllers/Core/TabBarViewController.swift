//
//  TabBarViewController.swift
//  Gallify
//
//  Created by Tejvir Mann on 8/18/21.
//
import UIKit
import SwiftUI
import Firebase

class TabBarViewModel: UITabBarController, ObservableObject {
    
    let screenWidth: CGFloat = UIScreen.main.bounds.width
    let screenHeight: CGFloat = UIScreen.main.bounds.height
    
}

struct TabBarView: View {
    
    @StateObject var firestoreQuery = FirestoreQuery()
    @StateObject var storageService = StorageService()
    @StateObject var viewModel = TabBarViewModel()
    
    @State private var doneLoading = false
    @State var isLoading = false
    
    init() {
        
        UITabBar.appearance().backgroundColor = UIColor.white
        //let valure = firestoreQuery.showNewScreen
        //UITabBar.appearance().isHidden = valure
        
    }
    
    var body: some View {
        
        ZStack {
                
            //if(firestoreQuery.showNewScreen == false) {
                        
                //Button(action:{
                    //UITabBar.appearance().isHidden = firestoreQuery.showNewScreen
                //}) {
                
            //if firestoreQuery.showNewScreen == false {
            
            TabView {
                    
                HomeView()
                    .tabItem {
                            
                        Label("Home", systemImage: "house.fill")
                            .font(.system(size: viewModel.screenWidth / 15, weight: .semibold))
                        
                }
                    
                DiscoverMainView()
                    .tabItem {
                            
                        Label("Discover", systemImage: "magnifyingglass")
                            .font(.system(size: viewModel.screenWidth / 15, weight: .semibold))
                            
                }
                    
                SelfProfileView()
                    .tabItem {
                            
                        Label("Profile", systemImage: "person.fill")
                            .font(.system(size: viewModel.screenWidth / 15, weight: .semibold))
                            
                }
                    
            }
            .accentColor(Color.black)
            .environmentObject(viewModel)
            .environmentObject(firestoreQuery)
            .environmentObject(storageService)
                
            ZStack {
                
                if firestoreQuery.showNewScreen {
                    
                    //here
                    //newscreen()
                        
                    CollectionReelView(screenWidth: viewModel.screenWidth, screenHeight: viewModel.screenHeight)
                        .offset(y: 10 )
                        //.padding(.top, 100)
                        .transition(.move(edge: .bottom))
                        //.animation(Animation.spring(response: 0.0, dampingFraction: 0.5))
                        .animation(.spring())
                        .edgesIgnoringSafeArea(.all)
                        .environmentObject(firestoreQuery)
                        //.onTapGesture {
                            //firestoreQuery.showNewScreen.toggle()
                        //}

                }
                      
            }
            .zIndex(3.0)
                
        }
        
    }
    
    /*
     This method turns off the loadingView screen once basic data is recieved.
     */
    func NetworkingCall() async {
        
        UITabBar.appearance().isHidden = firestoreQuery.showNewScreen
        
        await firestoreQuery.fetchData()
                    
        firestoreQuery.getLibrary(library_ids: firestoreQuery.data.Library)

        await firestoreQuery.fetchArt()
       
        doneLoading = true
        
    }
    
}

struct TabBarPreview: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
