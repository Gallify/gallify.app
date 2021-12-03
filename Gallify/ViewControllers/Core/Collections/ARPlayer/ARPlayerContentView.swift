//
//  ARPlayerContainer.swift
//  Gallify
//
//  Created by Tejvir Mann on 12/3/21.
//

import SwiftUI
import RealityKit

struct ARPlayerContentView: View {
    @Binding var isControlsVisible: Bool
    var body: some View {
        VStack {
            ControlVisibiityToggleButton(isControlsVisible: $isControlsVisible)
            
            Spacer()
            
            if isControlsVisible {
                ControlButtonBar()
            }
            
        }
    }
}

struct ControlVisibiityToggleButton: View {
    @Binding var isControlsVisible: Bool
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        HStack {
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "lessthan")
            }
            .font(.system(size: 40))
            .foregroundColor(.white)
            .buttonStyle(PlainButtonStyle())
            //.frame(width: 65, height: 65)
            .padding(.top, 45)
            .padding(.leading, 20)
            
            Spacer()
            
            ZStack {
                
                Color.black.opacity(0.25)
                
                Button(action: {
                    print("Control Visibility Toggle button pressed")
                    self.isControlsVisible.toggle()
                }) {
                    Image(systemName: self.isControlsVisible ? "rectangle" : "slider.horizontal.below.rectangle")
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .buttonStyle(PlainButtonStyle())
                }
            }
            .frame(width: 50, height: 50)
            .cornerRadius(8.0)
            .padding(.top, 45)
            .padding(.trailing, 20)
            
            
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
