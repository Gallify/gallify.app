//
//  PrivacyPolicyView.swift
//  Gallify
//
//  Created by Shruti Sharma on 8/26/21.
//
import SwiftUI

struct PrivacyPolicyView: View {
    
    @EnvironmentObject var viewModel: LoginAppViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        let width = viewModel.screenWidth
        
        NavigationView {
            
            VStack() {
                
                PrivacyPolicyViewHeader(presentationMode: _presentationMode)
                    .environmentObject(viewModel)
                    .padding(.top, width / 75)
                        
                ScrollView(showsIndicators: false) {
                    
                    PrivacyPolicyViewBody()
                        .environmentObject(viewModel)
                    
                }

            }
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
    }
    
}

struct PrivacyPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyView().environmentObject(LoginAppViewModel())
    }
}

