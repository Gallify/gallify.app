//
//  OtherProfileViewHeader.swift
//  Gallify
//
//  Created by Anshul on 9/13/21.
//
import SwiftUI

struct OtherProfileViewHeader: View {
    
    @EnvironmentObject var viewModel: TabBarViewModel
    @EnvironmentObject var firestoreQuery: FirestoreQuery
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        HStack {
            
            CustomBackButton(buttonHeight: screenHeight / 32.5, buttonWidth: screenWidth / 15, image: Image(systemName: "chevron.left.circle"), presentationMode: _presentationMode)
            
            Spacer()
            
            Text(firestoreQuery.otherUserData.username)
                .font(.system(size: screenWidth / 20, weight: .bold))
                .padding(.trailing, 14)
                //.multilineTextAlignment(.center)
            
            Spacer()
                    
     
            
        }
        .padding(.horizontal, screenWidth / 25)
        .padding(.top, screenHeight / 54)
        
    }
}

struct OtherProfileViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        OtherProfileViewHeader()
            .environmentObject(TabBarViewModel())
            .environmentObject(FirestoreQuery())
    }
}
