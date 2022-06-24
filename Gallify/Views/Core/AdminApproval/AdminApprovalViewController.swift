//
//  AdminApprovalViewController.swift
//  Gallify
//
//  Created by Anshul on 4/1/22.
//
import SwiftUI

struct AdminApprovalViewController: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: TabBarViewModel
    @EnvironmentObject var firestoreQuery: FirestoreQuery
    
    var body: some View {
        
        let screenWidth = viewModel.screenWidth
        let screenHeight = viewModel.screenHeight
        
        NavigationView {
                
            VStack {
                
                Text("Admin")
                    .font(.system(size: viewModel.screenWidth / 20, weight: .semibold))
                    .navigationBarHidden(true)
                    .navigationBarTitle("")
                
                AdminApprovalBody()
                
                Spacer()
                
            }
            
        }
        .navigationBarHidden(true)
        .navigationBarTitle("")
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            async{ await networkingCall() }
        }
        
    }
    
    func networkingCall() async {
        try await firestoreQuery.getArtInReview()
    }
    
}
