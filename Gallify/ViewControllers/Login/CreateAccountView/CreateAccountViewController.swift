//
//  CreateAccountViewController.swift
//  Gallify
//
//  Created by Tejvir Mann on 8/18/21.
//

import SwiftUI
import Firebase

struct CreateAccountView : View {
    
    @EnvironmentObject var viewModel : LoginAppViewModel
    
    var body: some View {
        
        let width = viewModel.screenWidth
        
        NavigationView {
            
            VStack {
                
                CreateAccountViewHeader().environmentObject(viewModel)
                    .padding(.top, width / 75)

                CreateAccountViewBody().environmentObject(viewModel)
                
                Spacer()
                
            }
            
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        
    }
    
}

struct CreateAccountViewController: PreviewProvider {
    static var previews: some View {
        CreateAccountView().environmentObject(LoginAppViewModel())
    }
}

