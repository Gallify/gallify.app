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
    
        var body: some View {
            
            let width = viewModel.screenWidth

            ScrollView(showsIndicators: false) {
                
                SelfProfileViewHeader(screenWidth: width)
                    .padding(.bottom, width / 25)
                
                SelfProfileViewDetails(screenWidth: width)
                    .padding(.bottom, width / 25)
                
                SelfProfileViewRooms(screenWidth: width)
                
                Divider()
                    .padding(.vertical, width / 25)
                
                SelfProfileCollectionList(screenWidth: width)
                                
        }
    }
}

struct SelfProfileScreenPreview: PreviewProvider {
    static var previews: some View {
        SelfProfileView().environmentObject(TabBarViewModel())
    }
}
