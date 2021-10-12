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
    
        var body: some View {
            
            let width = viewModel.screenWidth

            ScrollView(showsIndicators: false) {
                
                OtherProfileViewHeader(screenWidth: width)
                    .padding(.vertical, width / 25)
                
                OtherProfileViewDetails(screenWidth: width)
                    .padding(.bottom, width / 25)
                
                OtherProfileViewRooms(screenWidth: width)
                
                Divider()
                    .padding(.vertical, width / 25)
                
                OtherProfileCollectionList(screenWidth: width)
                                
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
            
    }
    
}

struct OtherProfileScreenPreview: PreviewProvider {
    static var previews: some View {
        OtherProfileView().environmentObject(TabBarViewModel())
    }
}
