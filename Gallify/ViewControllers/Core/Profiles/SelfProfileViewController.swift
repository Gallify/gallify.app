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

            VStack {
                
                SelfProfileViewHeader(screenWidth: width)
                    .padding(.top, width / 25)
                
                ScrollView(showsIndicators: false) {
                    
                    SelfProfileViewDetails(screenWidth: width)
                    
                    SelfProfileViewRooms(screenWidth: width)
                        .padding(.vertical, width / 37.5)
                    
                    SelfProfileCollectionList(screenWidth: width)
                                    
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
                
        }
            
    }
    
}

struct SelfProfileScreenPreview: PreviewProvider {
    static var previews: some View {
        SelfProfileView().environmentObject(TabBarViewModel())
    }
}
