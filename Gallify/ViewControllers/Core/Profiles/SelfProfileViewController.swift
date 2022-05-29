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
    @EnvironmentObject var loginModel: LoginAppViewModel
    
    var body: some View {
        
        
        if(!loginModel.isGuest){
            NavigationView {
                    
                VStack {
                            
                    SelfProfileViewHeader()
                        
                    ScrollView(showsIndicators: false) {
                                
                        SelfProfileViewDetails()
                            
                        SelfProfileFeatured()
                                
                        SelfProfileCollectionList()
                                                
                    }
                    .navigationBarHidden(true)
                    
       
                            MinimizedView(screenHeight: viewModel.screenHeight, screenWidth: viewModel.screenWidth)
                            
                            
                }
                .navigationBarHidden(true)
                

                
            }
            .navigationBarHidden(true)
            .onAppear{ async{await NetworkingCall() }}
        }
        else{
            ProfileSignIn()
          //  DownloadView() //placeholder
        }
        
        
        
    }
    
    func NetworkingCall() async {
        await firestoreQuery.getUserData()
       // await firestoreQuery.getUser()
        
        await firestoreQuery.getFeaturedPlaylist()
        
        await firestoreQuery.getFeaturedArt()
        
        await firestoreQuery.getUserLibrary()
        
//        //gets user data and featured playlist
//        await firestoreQuery.fetchData() //gets data and featured playlist
//
//        //await firestoreQuery.loaditems_selfprofile()
//
//        firestoreQuery.getLibrary(library_ids: firestoreQuery.data.Library) //gets library
//
//       // print("in networkong call, playlist art")
//       // print(firestoreQuery.featuredPlaylist.art)
//
//        await firestoreQuery.fetchArt() //gets featured art
//
//       // print(firestoreQuery.featuredArt)
        
    }
    
}

struct SelfProfileScreenPreview: PreviewProvider {
    @available(iOS 15.0, *)
    static var previews: some View {
        SelfProfileView().environmentObject(TabBarViewModel())
            .environmentObject(SelfProfileViewModel())
    }
}
