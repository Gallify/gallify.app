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
            
            let width = viewModel.screenWidth

            VStack {
                
                OtherProfileViewHeader(screenWidth: width, presentationMode: _presentationMode)
                    .padding(.top, width / 25)
                
                ScrollView(showsIndicators: false) {
                    
                    OtherProfileViewDetails(screenWidth: width)
                    
                    OtherProfileViewRooms(screenWidth: width)
                        .padding(.vertical, width / 37.5)
                    
                    OtherProfileCollectionList(screenWidth: width)
                                    
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
                
        }
            
    }
    
}

struct OtherProfileScreenPreview: PreviewProvider {
    static var previews: some View {
        OtherProfileView().environmentObject(TabBarViewModel())
    }
}
