//
//  PrivacyPolicyView.swift
//  Gallify
//
//  Created by Shruti Sharma on 8/26/21.
//
import SwiftUI

struct PrivacyPolicyView: View {
    
    let email: String
    let password: String
    
    @EnvironmentObject var viewModel: LoginAppViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        let width = viewModel.screenWidth
        
        NavigationView {
            
            VStack {
                    
                PrivacyPolicyViewHeader(width: width, presentationMode: _presentationMode)
                        .environmentObject(viewModel)
                        .padding(.top, width / 75)
                            
                PrivacyPolicyViewBody(email: email, password: password)
                        .environmentObject(viewModel)
                
                    Spacer()
                        
                }
                .navigationBarHidden(true)
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
    }
    
}

struct PrivacyPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyView(email: "", password: "").environmentObject(LoginAppViewModel())
    }
}

