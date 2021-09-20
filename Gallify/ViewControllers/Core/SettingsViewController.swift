//
//  SettingsViewController.swift
//  Gallify
//
//  Created by Tejvir Mann on 8/18/21.
//

import UIKit
import SwiftUI

class SettingsViewModel: ObservableObject {


}

struct SettingsView : View {
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel : LoginAppViewModel
    
        var body: some View {
            VStack{
                
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                
                Text("You are signed in")
                Button(action: {
                    viewModel.signOut()
                }, label: {
                    Text("Sign Out")
                        .frame(width: 200, height: 50)
                        .background(Color.green)
                        .foregroundColor(Color.blue)
                        .padding()
                })
                
        }
    }
}
