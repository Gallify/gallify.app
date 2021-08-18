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
    @State var email = ""
    @State var password = ""
    
    let SettingsImageName = "gear"
    
    @EnvironmentObject var viewModel : HomeViewModel
        var body: some View {
            VStack{
                
                Text("Home")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                
                NavigationLink("Settings", destination:  SettingsView())
                    .foregroundColor(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                    .padding()
        
        }
    }
}

