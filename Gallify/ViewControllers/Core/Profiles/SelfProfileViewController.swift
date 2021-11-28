//
//  SelfProfileViewController.swift
//  Gallify
//
//  Created by Tejvir Mann on 8/18/21.
//
import UIKit
import SwiftUI

class SelfProfileViewModel: ObservableObject {

}

struct SelfProfileView : View {
    
    @EnvironmentObject var viewModel : TabBarViewModel
    @EnvironmentObject var profileViewModel : SelfProfileViewModel
    
    var body: some View {
            
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth

        VStack {
                
            SelfProfileViewHeader(screenHeight: screenHeight, screenWidth: screenWidth)
                
            ScrollView(showsIndicators: false) {
                    
                SelfProfileViewDetails(screenHeight: screenHeight, screenWidth: screenWidth)
                    
                SelfProfileViewRooms(screenHeight: screenHeight, screenWidth: screenWidth)
                    
                SelfProfileCollectionList(screenHeight: screenHeight, screenWidth: screenWidth)
                                    
            }
            .navigationBarHidden(true)
                
        }
            
    }
    
}

struct SelfProfileScreenPreview: PreviewProvider {
    static var previews: some View {
        SelfProfileView().environmentObject(TabBarViewModel())
    }
}
