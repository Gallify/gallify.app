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
    
    @State var selectedTabIndex = 0
    
    private let tabBarImageNames = ["house.fill", "magnifyingglass", "person.fill"]
    
    init() {
        UINavigationBar.appearance().barTintColor = .white
    }
    
    var body: some View {
        ZStack {
            VStack {
                
                switch selectedTabIndex {
                case 0:
                    HomeView().environmentObject(TabBarViewModel())
                case 1:
                    SearchView()
                case 2:
                    ProfileView().environmentObject(TabBarViewModel())
                default:
                    HomeView()
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
                        }.font(.system(size: 25, weight: .semibold))
                    }
                }
            }
        }
    }
}

struct TabBarPreview: PreviewProvider {
    static var previews: some View {
        TabBarView().environmentObject(TabBarViewModel())
    }
}




    
    



