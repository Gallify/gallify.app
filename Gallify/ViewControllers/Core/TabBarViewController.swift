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
     //   UITabBar.appearance().isHidden = doneLoading
        
    }
    
    var body: some View {
        
        
        if(loginViewModel.isSignedIn){
            
            ZStack{
                
//                if(firestoreQuery.showNewScreen == false){
//                    if(firestoreQuery.data.isClicked != ""){
//                        NavigationLink(destination: OtherProfileView(), label: {
//
//                            OtherSearchTemplate(screenHeight: screenHeight, screenWidth: screenWidth, image: Image("turtlerock"), title: "Desert", searchType: "Art", artistName: "Joe")
//                        })
//                    }
//                }
            
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
                
                ZStack{
                    if(firestoreQuery.showNewScreen){
                        //here
                        //newscreen()
                        CollectionReelView(screenWidth: viewModel.screenWidth, screenHeight: viewModel.screenHeight)
                            //.offset(y: 100 )
                            //.padding(.top, 100)
                            .transition(.move(edge: .bottom))
                            //.animation(Animation.spring(response: 0.0, dampingFraction: 0.5))
                             .animation(.spring())
//                            .onTapGesture {
//                                firestoreQuery.showNewScreen.toggle()
//                            }

                    }
                    
                      
                }
                //.zIndex(3.0)
                
                
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




    
    



