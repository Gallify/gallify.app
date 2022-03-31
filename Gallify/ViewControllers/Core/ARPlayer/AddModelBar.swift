//
//  AddModelBar.swift
//  Gallify
//
//  Created by Sourish Kundu on 2/12/22.
//

import SwiftUI

struct AddModelBar: View {
    @EnvironmentObject var modelsViewModel: ModelsViewModel
    @EnvironmentObject var firestoreQuery : FirestoreQuery
    @EnvironmentObject var placementSettings: PlacementSettings
    
    var body: some View {
        HStack {
            Spacer()
            
            ControlButton(systemIconName: "xmark.circle.fill") {
                print("Cancel placement button pressed.")
                self.placementSettings.selectedModel = nil
            }
            
            Spacer()
            
            ControlButton(systemIconName: "checkmark.circle.fill") {
                print("Confirm placement button pressed.")
                
                self.placementSettings.confirmedModel = self.placementSettings.selectedModel
                self.placementSettings.selectedModel = nil
            }
            
            Spacer()
        }
    }
}

struct ControlButton: View {
    let systemIconName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            Image(systemName: systemIconName)
                .font(.system(size: 45))
                .foregroundColor(.white)
                .buttonStyle(PlainButtonStyle())
        }
        .frame(width: 45, height: 45)
    }
}
