//
//  CreateAccountViewController.swift
//  Gallify
//
//  Created by Tejvir Mann on 8/18/21.
//

import SwiftUI
import Firebase

struct CreateAccountView : View {
    
    @StateObject var user = User()
    @EnvironmentObject var viewModel : LoginAppViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        NavigationView {
                    
            VStack {
                
                CreateAccountViewHeader(screenHeight: screenHeight, screenWidth: screenWidth, presentationMode: _presentationMode)

                CreateAccountViewBody()
                
                Spacer()
                
            }
            .navigationBarHidden(true)
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .environmentObject(user)
        
    }
    
}

struct CreateAccountViewController: PreviewProvider {
    static var previews: some View {
        CreateAccountView().environmentObject(LoginAppViewModel())
    }
}


