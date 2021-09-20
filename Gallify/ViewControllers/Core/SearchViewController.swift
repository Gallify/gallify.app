//
//  SearchViewController.swift
//  Gallify
//
//  Created by Tejvir Mann on 8/18/21.
//

import UIKit
import SwiftUI


class SearchViewModel: ObservableObject {


}

struct SearchView : View {
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel : SearchViewModel
    var body: some View {
        VStack{
            
            Text("Search")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                

        
    }
    
}
}

