//
//  PrivacyPolicyView.swift
//  Gallify
//
//  Created by Shruti Sharma on 8/26/21.
//
import SwiftUI

struct PrivacyPolicyView: View {
    
    @EnvironmentObject var viewModel: LoginAppViewModel
    
    var body: some View {
        
        let width = viewModel.screenWidth
        
        NavigationView {
            
            VStack() {
                
                PrivacyPolicyViewHeader().environmentObject(viewModel)
                
                ScrollView {
                        
                    PrivacyPolicyViewBody().environmentObject(viewModel)
                             
                }

            }
            
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        
    }
    
}

struct PrivacyPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyView().environmentObject(LoginAppViewModel())
    }
}
