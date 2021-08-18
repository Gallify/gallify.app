//
//  ProfileViewController.swift
//  Gallify
//
//  Created by Tejvir Mann on 8/18/21.
//

import UIKit
import SwiftUI


class ProfileViewModel: ObservableObject {


}

struct ProfileView : View {
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel : ProfileViewModel
        var body: some View {
            VStack(alignment: .leading){
                
                Text("Profile")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    

            
        }
    }
}
