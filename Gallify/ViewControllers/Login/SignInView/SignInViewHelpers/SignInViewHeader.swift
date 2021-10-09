//
//  SignInViewHeader.swift
//  Gallify
//
//  Created by Patron on 10/1/21.
//

import SwiftUI

struct SignInViewHeader: View {
    
    @EnvironmentObject var viewModel : LoginAppViewModel
    
    var body: some View {
        
        let width = viewModel.screenWidth
        
        VStack {
            
            HStack {
                
                NavigationLink(destination: LoginView().environmentObject(viewModel).navigationBarBackButtonHidden(true),
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
                
                Text("Sign in to Gallify")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Spacer()
                
            }
            .padding(.leading, width / 12)
            .padding(.bottom, width / 15)
            
        }
        
    }
    
}

struct SignInViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        SignInViewHeader().environmentObject(LoginAppViewModel())
    }
}
