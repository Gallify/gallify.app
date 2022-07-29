//
//  ExpandedView.swift
//  Gallify
//
//  Created by Gianluca Profio on 10/23/21.
//
import SwiftUI

struct CollectionReelView: View {
    
    @EnvironmentObject var viewModel: TabBarViewModel
    @EnvironmentObject var firestoreQuery: FirestoreQuery
    @Environment(\.presentationMode) var presentationMode
    
    //@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    //@Binding var showDescription: Bool
    
    
    var body: some View {
        
        NavigationView {
            
            ZStack(alignment: .topLeading) {
                
                VStack {
                    
                    CollectionReelHeader()
                        
                    
                    CollectionReelListing()
                
                    
                    Spacer()
                    
                }
                
            }
            
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.all)
        
    }
    
}
