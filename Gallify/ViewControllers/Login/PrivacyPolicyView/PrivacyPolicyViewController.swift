//
//  PrivacyPolicyView.swift
//  Gallify
//
//  Created by Shruti Sharma on 8/26/21.
//
import SwiftUI

struct PrivacyPolicyView: View {
    
    let password: String
    
    @EnvironmentObject var user: User
    @EnvironmentObject var viewModel: LoginAppViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        NavigationView {
            
            VStack {
                    
                PrivacyPolicyViewHeader(screenHeight: screenHeight, screenWidth: screenWidth, presentationMode: _presentationMode)
                            
                PrivacyPolicyViewBody(password: password)
                
                    Spacer()
                        
                }
                .navigationBarHidden(true)
            
        }
        .navigationBarHidden(true)
        
    }
    
}

struct PrivacyPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyView(password: "")
            .environmentObject(User())
            .environmentObject(LoginAppViewModel())
    }
}
