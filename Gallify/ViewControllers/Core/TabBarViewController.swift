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
    @StateObject var firestoreQuery = FirestoreQuery() //object data created here.
    
    private let tabBarImageNames = ["house.fill", "magnifyingglass", "person.fill"]
    
    init() {
        UINavigationBar.appearance().barTintColor = .white
    }
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                switch selectedTabIndex {
                    
                case 0:
                    HomeView().environmentObject(firestoreQuery)
                    //not sure why it made me add this param, but got rid of error.,
                case 1:
                    DiscoverMainView()
                case 2:
                    SelfProfileView()
                        .environmentObject(firestoreQuery)
                default:
                    HomeView()
                    //not sure why it made me add this param, but got rid of error.,
                    
                }
                
                Spacer()
                
                HStack {
                    
                    ForEach(0..<3, id: \.self) { num in
                        
                        HStack {
                            
                            Button(action: {
                                self.selectedTabIndex = num
                            }, label: {
                                Spacer()
                                Image(systemName: tabBarImageNames[num])
                                        .foregroundColor(selectedTabIndex == num ? .black : .init(white: 0.7))
                                
                                Spacer()
                            })
                            
                        }.font(.system(size: viewModel.screenWidth / 15, weight: .semibold))
                        
                    }
                    
                }
                
            }
            
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .environmentObject(viewModel)
        .environmentObject(firestoreQuery)
        .onAppear{ networking() }
        
    }
    
    func networking(){
        firestoreQuery.getUser()
        
    }
    
    
    
    
}

struct TabBarPreview: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}




    
    



