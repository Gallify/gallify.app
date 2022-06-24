//
//  MainSettingsView.swift
//  Gallify
//
//  Created by Gianluca Profio on 1/15/22.
//
import SwiftUI

struct SettingsView: View {
    
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {

        VStack {
            
            MainSettingsViewHeader(screenWidth: screenWidth, screenHeight: screenHeight)
            
            ScrollView (showsIndicators: false) {
                
                MainSettingsViewBody(screenWidth: screenWidth, screenHeight: screenHeight)
                
            }
            
        }
        
    }
    
}

struct MainSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}
