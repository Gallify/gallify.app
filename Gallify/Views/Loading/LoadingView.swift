//
//  LoadingView.swift
//  Gallify
// new
//  This view shows whenever we are trying to load in data and it is taking time.
//
//  Created by Tejvir Mann on 12/4/21.
//

import Foundation
import SwiftUI

struct LoadingView: View {
    
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    @EnvironmentObject var firestoreQuery : FirestoreQuery
    //@Binding var isLoading : Bool
    
    
    var body: some View {
        
        VStack {
            
            Logo(height: screenHeight / 3, width: screenWidth / 1.45)
                .padding(.top, screenHeight / 16.25)
            
            
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
      //  .onAppear{ async{ await NetworkingCall() }}
        
    }
    
  @MainActor
    func NetworkingCall() async {
//            isLoading = true
//
//            //await firestoreQuery.getUser_await()
//            await firestoreQuery.fetchData()
//            //firestoreQuery.getLibrary(library_ids: firestoreQuery.data.Library)
//            //refresh collection list
//            await firestoreQuery.getUserLibrary()
//
//            await firestoreQuery.fetchArt()
//
//            isLoading = false

    }
    
}


