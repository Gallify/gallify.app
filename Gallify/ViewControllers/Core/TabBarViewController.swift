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
    
    @StateObject var viewModel = TabBarViewModel()
    @State var selectedTabIndex = 0
    //@StateObject var firestoreQuery = FirestoreQuery() //object data created here.
    @EnvironmentObject var firestoreQuery : FirestoreQuery
    @EnvironmentObject var loginViewModel: LoginAppViewModel
    
    @State private var doneLoading = false
    //@State var showNewScreen = false
    
    private let tabBarImageNames = ["house.fill", "magnifyingglass", "person.fill"]
    

    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
       // let valure = firestoreQuery.showNewScreen
       // UITabBar.appearance().isHidden = valure
        
    }
    

    
    var body: some View {
        
        
        if(loginViewModel.isSignedIn){
            
            ZStack{
                
               // if(firestoreQuery.showNewScreen == false){
                        
//                Button(action:{
//                    UITabBar.appearance().isHidden = firestoreQuery.showNewScreen
//                }) {
                
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
                                LoadingView(screenHeight: viewModel.screenHeight, screenWidth: viewModel.screenWidth)
                                   
                            }
                            

                        }
                        //.navigationBarTitle("")
                       // .navigationBarHidden(true)
                        .accentColor(Color("Gallify-Pinkish"))
                        .environmentObject(viewModel)
                        .environmentObject(firestoreQuery)
                        .onAppear{ async{await NetworkingCall() }}
                //}
                
                
                
                
//                ZStack{
//
//                    //add minimized view to the tip of this. Hide if
//                    
//
//                    if(firestoreQuery.showNewScreen){
//
//                        CollectionReelView(screenWidth: viewModel.screenWidth, screenHeight: viewModel.screenHeight)
//                            .transition(.move(edge: .bottom))
//                            .animation(.spring())
//                            .edgesIgnoringSafeArea(.all)
////                            .onTapGesture {
////                                firestoreQuery.showNewScreen.toggle()
////                            }
//
//                    }
//                }
//                .zIndex(3.0)
                
                
                
                
            }
        }

        else{
            LoginView()
                .environmentObject(viewModel)
                .environmentObject(firestoreQuery)
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




    
    



