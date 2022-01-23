//
//  MainSettingsViewHeader.swift
//  Gallify
//
//  Created by Gianluca Profio on 1/23/22.
//

import SwiftUI

struct MainSettingsViewBody: View {
    
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        HStack (alignment: .center) {
            Text("Profile")
                .padding(.leading, screenWidth/6)
            Spacer()
            NavigationLink(
                destination: ProfileSetting(screenWidth: screenWidth, screenHeight: screenHeight),
                label: {
                    Image(systemName: "chevron.right")
                })
                .buttonStyle(ThemeAnimationStyle())
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .padding(.trailing, screenWidth/6)
        }
        .padding(.top)
        

        HStack (alignment: .center) {
            Text("Account")
                .padding(.leading, screenWidth/6)
            Spacer()
            NavigationLink(
                destination: ProfileSetting(screenWidth: screenWidth, screenHeight: screenHeight),
                label: {
                    Image(systemName: "chevron.right")
                })
                .buttonStyle(ThemeAnimationStyle())
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .padding(.trailing, screenWidth/6)
        }
        .padding(.top)
        
        
        HStack (alignment: .center) {
            Text("Artist Program")
                .padding(.leading, screenWidth/6)
            Spacer()
            NavigationLink(
                destination: ProfileSetting(screenWidth: screenWidth, screenHeight: screenHeight),
                label: {
                    Image(systemName: "chevron.right")
                })
                .buttonStyle(ThemeAnimationStyle())
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .padding(.trailing, screenWidth/6)
        }
        .padding(.top)
        
        
        HStack (alignment: .center) {
            Text("Curator Program")
                .padding(.leading, screenWidth/6)
            Spacer()
            NavigationLink(
                destination: ProfileSetting(screenWidth: screenWidth, screenHeight: screenHeight),
                label: {
                    Image(systemName: "chevron.right")
                })
                .buttonStyle(ThemeAnimationStyle())
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .padding(.trailing, screenWidth/6)
        }
        .padding(.top)
        
        
        HStack (alignment: .center) {
            Text("Membership")
                .padding(.leading, screenWidth/6)
            Spacer()
            NavigationLink(
                destination: ProfileSetting(screenWidth: screenWidth, screenHeight: screenHeight),
                label: {
                    Image(systemName: "chevron.right")
                })
                .buttonStyle(ThemeAnimationStyle())
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .padding(.trailing, screenWidth/6)
        }
        .padding(.top)
        
        
        HStack (alignment: .center) {
            Text("Sign Out")
                .padding(.leading, screenWidth/6)
            Spacer()
            Button(action: {}) {
                Image(systemName: "chevron.right")
                    .foregroundColor(.black)
            }
            .padding(.trailing, screenWidth/6)
        }
        .padding(.top)
        
        
        Spacer()
    }
}

struct MainSettingsViewBody_Previews: PreviewProvider {
    static var previews: some View {
        MainSettingsViewBody(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}
