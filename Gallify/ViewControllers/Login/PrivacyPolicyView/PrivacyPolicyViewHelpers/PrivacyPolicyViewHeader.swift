//
//  PrivacyPolicyViewHeader.swift
//  Gallify
//
//  Created by Patron on 10/8/21.
//

import SwiftUI

struct PrivacyPolicyViewHeader: View {
    
    @EnvironmentObject var viewModel: LoginAppViewModel
    
    var body: some View {
        
        let width = viewModel.screenWidth
        
        VStack {
            
            HStack {
                
                NavigationLink(destination: SignInView().environmentObject(viewModel).navigationBarBackButtonHidden(true),
                               label: {
                    Image(systemName: "lessthan")
                        .resizable()
                        .foregroundColor(Color.black)
                        .frame(width: width / 15, height: width / 15)
                })
                .padding(width / 20)
                .navigationBarTitle("")
                .navigationBarHidden(true)
                
                Spacer()
                
            }
            
            HStack {
                
                Text("Privacy Policy")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Spacer()
                
            }
            .padding(.leading, width / 12)
            .padding(.bottom, width / 25)
            
        }
        
    }
    
}

struct PrivacyPolicyViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyViewHeader().environmentObject(LoginAppViewModel())
    }
}
