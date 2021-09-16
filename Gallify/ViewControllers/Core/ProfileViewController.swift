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
    
    @EnvironmentObject var viewModel : TabBarViewModel
    
        var body: some View {
            
            let width = viewModel.screenWidth

            ScrollView(showsIndicators: false) {
                
                ProfileViewHeader(screenWidth: width)
                    .padding(.bottom, width / 25)
                
                ProfileViewUserDetails(screenWidth: width)
                                
        }
    }
}

struct ProfileScreenPreview: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(TabBarViewModel())
    }
}
