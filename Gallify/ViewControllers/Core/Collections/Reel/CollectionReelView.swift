//
//  ExpandedView.swift
//  Gallify
//
//  Created by Gianluca Profio on 10/23/21.
//
import SwiftUI

struct CollectionReelView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: TabBarViewModel
    @EnvironmentObject var firestoreQuery: FirestoreQuery
    
    //@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    //@Binding var isPresented: Bool
    
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading){
                VStack{
                    CollectionReelHeader(screenWidth: screenWidth, screenHeight: screenHeight)
                        .padding()
                    
                        CollectionReelListing(screenWidth: screenWidth, screenHeight: screenHeight)
                    
                    Spacer()
                }
            }
            
        }
        .navigationBarHidden(true)
        .navigationBarTitle("")
        .edgesIgnoringSafeArea(.all)
        
    }
}

//struct CollectionReelView_Previews: PreviewProvider {
//    @Binding var isPresented: Bool
//
//    static var previews: some View {
//        CollectionReelView(isPresented: $isPresented, screenWidth: UIScreen.main.bounds.width,screenHeight: UIScreen.main.bounds.height)
//    }
//}
