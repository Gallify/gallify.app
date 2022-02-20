//
//  CreatePlaylistName.swift
//  Gallify
//
//  Created by Anshul on 2/12/22.
//

import SwiftUI

struct CreatePlaylistName: View {
    
    @EnvironmentObject var viewModel: TabBarViewModel
    @State var playlistName = ""
    @State var buttonPressed = false
    @State var goForward: Bool? = false

    var body: some View {
        
        let screenWidth = viewModel.screenWidth
        let screenHeight = viewModel.screenHeight
        
        NavigationView {
            
            VStack {
                
                if buttonPressed && playlistName.isEmpty {
                    
                    ErrorText(errorText: "Playlist Name cannot be empty.", screenHeight: screenHeight, screenWidth: screenWidth)
                    
                }
                
                Text("Name")
                    .font(.system(size: screenWidth / 20, weight: .semibold))
                
                TextField("", text: $playlistName)
                    .disableAutocorrection(true)
                    .font(.system(size: screenWidth / 15, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .overlay(Rectangle().frame(height: screenHeight / 500)
                                .padding(.top, screenHeight / 16.25))
                    .padding(.horizontal, screenWidth / 10)
                    .padding(.vertical, screenHeight / 15)
                
                Button(action: {
                    
                    if !(playlistName.isEmpty) {
                        goForward = true
                    }
                        
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        buttonPressed = true
                    }
                        
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                        buttonPressed = false
                    }
                        
                }, label: {
                        
                    Text("Next")
                        .font(.system(size: screenWidth / 18.5, weight: .bold))
                        .foregroundColor(Color.white)
                        .padding(.horizontal, screenWidth / 8.5)
                        .padding(.vertical, screenHeight / 65)
                        .background(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                        .cornerRadius(screenWidth / 15)
                    
                })
                .padding(.vertical, screenHeight / 54)
                    
                NavigationLink(destination: CreatePlaylistSettings(),
                    tag: true, selection: $goForward) { EmptyView() }
                    .navigationBarHidden(true)
                
            }
            
        }
        .navigationBarHidden(true)
        
    }
    
}

struct CreatePlaylistName_Previews: PreviewProvider {
    static var previews: some View {
        CreatePlaylistName()
            .environmentObject(TabBarViewModel())
    }
}
