//
//  OtherProfileViewController.swift
//  Gallify
//
//  Created by Tejvir Mann on 8/18/21.
//
import UIKit
import SwiftUI

class OtherProfileViewModel: ObservableObject {

}

struct OtherProfileView : View {
    
    @EnvironmentObject var viewModel : TabBarViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
            
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth

        VStack {
                
            OtherProfileViewHeader(screenHeight: screenHeight, screenWidth: screenWidth, presentationMode: _presentationMode)
                
            ScrollView(showsIndicators: false) {
                    
                OtherProfileViewDetails(screenHeight: screenHeight, screenWidth: screenWidth)
                    
                OtherProfileViewRooms(screenHeight: screenHeight, screenWidth: screenWidth)
                    
                OtherProfileCollectionList(screenHeight: screenHeight, screenWidth: screenWidth)
                                    
            }
            .navigationBarHidden(true)
                
        }
            
    }
    
}

struct OtherProfileScreenPreview: PreviewProvider {
    static var previews: some View {
        OtherProfileView().environmentObject(TabBarViewModel())
    }
}
