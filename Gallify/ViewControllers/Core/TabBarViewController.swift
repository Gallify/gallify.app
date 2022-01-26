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
    
   // @StateObject var viewModel = TabBarViewModel()
    @State var selectedTabIndex = 0
    //@StateObject var firestoreQuery = FirestoreQuery() //object data created here.
   //@EnvironmentObject var firestoreQuery : FirestoreQuery
    //@EnvironmentObject var loginViewModel: LoginAppViewModel
    
    @StateObject var firestoreQuery = FirestoreQuery()
    @StateObject var storageService = StorageService()
    @StateObject var viewModel = TabBarViewModel()
    
    @State private var doneLoading = false
    @State var isLoading = false
    
    private let tabBarImageNames = ["house.fill", "magnifyingglass", "person.fill"]
    

    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
       // let valure = firestoreQuery.showNewScreen
       // UITabBar.appearance().isHidden = valure
        
    }
    

    
    var body: some View {
        
        
            ZStack{
                
               // if(firestoreQuery.showNewScreen == false){
                        
//                Button(action:{
//                    UITabBar.appearance().isHidden = firestoreQuery.showNewScreen
//                }) {
                
              //  if firestoreQuery.showNewScreen == false {
                        NavigationView{
                                TabView{
                                    if(doneLoading){
                                            
                                            HomeView()
                                          
                                                .tabItem{
                                                    Label("Home", systemImage: "house.fill" )
                                                        
                                                }
                                                .environmentObject(firestoreQuery)
                                                
                                    
                                            DiscoverMainView()
                                                .tabItem{
                                                    Label("Discover", systemImage: "magnifyingglass" )
                                                }
                                                .environmentObject(firestoreQuery)

                                            SelfProfileView()
                                                .tabItem{
                                                    Label("Profile", systemImage: "person.fill" )
                                                }
                                                
                                                .environmentObject(firestoreQuery)
                                            
                                            
                                        
                                        
                                    }
                                    else{
                                        LoadingView(screenHeight: viewModel.screenHeight, screenWidth: viewModel.screenWidth, isLoading: $isLoading)
                                           
                                    }
                                    

                                }
                                //.navigationBarTitle("")
                               // .navigationBarHidden(true)
                                .accentColor(Color.primary)
                                .environmentObject(viewModel)
                                .environmentObject(firestoreQuery)
                                .onAppear{ async{await NetworkingCall() }}
                        }
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                
                
                
                
                
                ZStack{
                    if(firestoreQuery.showNewScreen){
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
//                            .onTapGesture {
//                                firestoreQuery.showNewScreen.toggle()
//                            }

                    }
                    
                    
                    
                    
                    
                      
                }
                .zIndex(3.0)
                
                
                
                
            }

        
    }
    
    /*
     This method turns off the loadingView screen once basic data is recieved.
     */
    func NetworkingCall() async{
        
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




    
    



