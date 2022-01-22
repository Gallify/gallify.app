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
        NavigationView{
        
            ZStack{
        
            
                VStack {
                        
                    SelfProfileViewHeader()
                        
                    ScrollView(showsIndicators: false) {
                            
                        SelfProfileViewDetails()
                        
                        SelfProfileFeatured()
                            
                        SelfProfileCollectionList()
                                            
                    }
                    .environmentObject(firestoreQuery)
                    .navigationBarHidden(true)
                    .onAppear{ async{await NetworkingCall() }}
                        
                }
                .navigationBarHidden(true)
                
            
            
            
//            ZStack{
//                if(firestoreQuery.showNewScreen){
//                    //here
//                    newscreen()
//                        .padding(.top, 100)
//                        .transition(.move(edge: .bottom))
//                        .animation(.spring())
//                       // .padding(.top, 100)
//                        //.offset(y: firestoreQuery.showNewScreen ? 0 : )
//                        //.transition(.move(edge: .bottom))
//                        //.animation(.spring(), value: firestoreQuery.showNewScreen)
//                        //.edgesIgnoringSafeArea(.all)
//
//
//                }
//
//            }
//            .zIndex(3.0)
                
            }
            
        }
        
    }
    
    func NetworkingCall() async{
        
        await firestoreQuery.fetchData()
                    
       // await firestoreQuery.loaditems_selfprofile()
        
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
        SelfProfileView().environmentObject(TabBarViewModel())
            .environmentObject(SelfProfileViewModel())
    }
}
