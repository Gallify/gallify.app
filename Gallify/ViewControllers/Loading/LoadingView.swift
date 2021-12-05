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
    var body: some View {
        ZStack{
            Color(.systemBackground).ignoresSafeArea()
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint:.pink))
                .scaleEffect(3)
        }
    }
}

