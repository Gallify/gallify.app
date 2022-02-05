//
//  SaveTransformView.swift
//  Gallify
//
//  Created by Tejvir Mann on 2/4/22.
//

import Foundation

//
//  DeletionView.swift
//  Gallify
//
//  Created by Apple on 03/01/22.
//

import SwiftUI

struct SaveTransformView: View {
    @EnvironmentObject var sceneManager: SceneManager
    @EnvironmentObject var modelDeletionManager: ModelDeletionManager
    
    
    var body: some View {
        HStack{
            Spacer()
            SaveTransformButton(systemIconName:"xmark.circle.fill") {
                print ( "Cancel Deletion button pressed.")
                self.modelDeletionManager.entitySelectedForDeletion = nil
            }
            Spacer()
            SaveTransformButton(systemIconName:"trash.circle.fill") {
                print ( "Confirm Deletion button pressed.")
                guard let anchor = self.modelDeletionManager.entitySelectedForDeletion?.anchor else { return }
                let anchoringIdentifier=anchor.anchorIdentifier
                if let index = self.sceneManager.anchorEntities.firstIndex(where:{$0.anchorIdentifier == anchoringIdentifier}){
                    print ("Deleting anchorEntity with id: \(String (describing: anchoringIdentifier))")
                    self.sceneManager.anchorEntities.remove(at: index)
                }
                anchor.removeFromParent()
                self.modelDeletionManager.entitySelectedForDeletion=nil
            }
        Spacer()
        }
        .padding(.bottom,30)
    }
}
      


struct SaveTransformButton: View {
    let systemIconName: String
    let action: () -> Void
    
    var body: some View{
        
        Button(action:{
            self.action()
        }){
            Image(systemName: systemIconName)
                .font(.system(size:50, weight: .light, design: .default))
                .foregroundColor(.white)
                .buttonStyle(PlainButtonStyle())
                
        }
        .frame(width: 75, height: 75)
        
    }
    
    
    
}
