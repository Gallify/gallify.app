//
//  ARPlayerContainer.swift
//  Gallify
//
//  Created by Tejvir Mann on 12/3/21.
//

import SwiftUI
import RealityKit

struct ARPlayerContentView: View {
    var body: some View {
        VStack {
            ControlVisibiityToggleButton()
            
            Spacer()
            
            ControlButtonBar()
            
        }
    }
}

struct ControlVisibiityToggleButton: View {
    var body: some View {
        HStack {
            
        }
    }
}

struct ControlButtonBar: View {
    var body: some View {
        HStack {
            
            ControlButton(systemIconName: "clock.fill") {
                print("Most recently placed button pressed");
            }
            
            Spacer()
            
            ControlButton(systemIconName: "square.grid.2x2") {
                print("Browse button pressed");
            }
            
            Spacer()
            
            ControlButton(systemIconName: "slider.horizontal.3") {
                print("Settings button pressed");
            }
            
        }
        .frame(maxWidth: 500)
        .padding(30)
        .background(Color.black.opacity(0.25))
    }
}

struct ControlButton: View{
    let systemIconName: String
    let action: () -> Void
    
    var body: some View{
        Button(action: {
            self.action()
        }) {
            Image(systemName: systemIconName)
                .font(.system(size: 35))
                .foregroundColor(.white)
                .buttonStyle(PlainButtonStyle())
            
        }
        .frame(width: 50, height: 50)
    }
}
