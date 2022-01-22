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
    
    
    var body: some View {
        
        VStack {
            
            Logo(height: screenHeight / 3, width: screenWidth / 1.45)
                .padding(.top, screenHeight / 16.25)
            
            
        }
      //  .onAppear{ async{ await NetworkingCall() }}
        
    }
    
  @MainActor
    func NetworkingCall() async {

            await firestoreQuery.getUser_await()

    }
    
}


