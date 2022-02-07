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
    @EnvironmentObject var firestoreQuery: FirestoreQuery
    
    var body: some View {
        
        NavigationView {
                
            VStack {
                        
                SelfProfileViewHeader()
                    
                ScrollView(showsIndicators: false) {
                            
                    SelfProfileViewDetails()
                        
                    SelfProfileFeatured()
                            
                    SelfProfileCollectionList()
                                            
                }
                .navigationBarHidden(true)
                        
            }
            .navigationBarHidden(true)
            
//                ZStack{
//                    if(firestoreQuery.showNewScreen){
//                        //here
//                        //newscreen()
//                        CollectionReelView(screenWidth: viewModel.screenWidth, screenHeight: viewModel.screenHeight)
//                            //.offset(y: 100 )
//                            //.padding(.top, 100)
//                            .transition(.move(edge: .bottom))
//                            //.animation(Animation.spring(response: 0.0, dampingFraction: 0.5))
//                             .animation(.spring())
//                             .edgesIgnoringSafeArea(.all)
////                            .onTapGesture {
////                                firestoreQuery.showNewScreen.toggle()
////                            }
//
//                    }
//
//
//                }
//                .zIndex(3.0)
            
        }
        .navigationBarHidden(true)
        .onAppear{ async { await NetworkingCall() } }
        
    }
    
    func NetworkingCall() async {
        
        //gets user data and featured playlist
        await firestoreQuery.fetchData()
                    
        //await firestoreQuery.loaditems_selfprofile()
        
        firestoreQuery.getLibrary(library_ids: firestoreQuery.data.Library)
        
        print("in networkong call, playlist art")
        print(firestoreQuery.featuredPlaylist.art)
        
        await firestoreQuery.fetchArt()
       
        print(firestoreQuery.featuredArt)
        
    }
    
}

struct SelfProfileScreenPreview: PreviewProvider {
    @available(iOS 15.0, *)
    static var previews: some View {
        SelfProfileView()
            .environmentObject(TabBarViewModel())
            .environmentObject(SelfProfileViewModel())
    }
}
