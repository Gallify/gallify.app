//
//  DiscoverBrowse.swift
//  Gallify
//
//  Created by Anshul on 11/29/21.
//

import SwiftUI

struct DiscoverBrowse: View {
    
    @EnvironmentObject var viewModel: TabBarViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        NavigationView {
            
            ScrollView {
                
                DiscoverBrowseHeader(screenHeight: screenHeight, screenWidth: screenWidth, presentationMode: _presentationMode)
                
                RecommendedSlabsView()
                
                HStack {
                            
                    Text("Browse")
                        .font(.system(size: screenWidth / 11, weight: .semibold))
                            
                    Spacer()
                            
                }
                .padding(.leading, screenWidth / 12)
                .padding(.bottom, screenHeight / 32.5)
                
                BrowseSlabsView()
                
            }
            .navigationBarHidden(true)
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
    }
    
}

struct DiscoverBrowse_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverBrowse()
            .environmentObject(TabBarViewModel())
    }
}
