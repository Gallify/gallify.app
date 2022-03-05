//
//  DiscoverPostsView.swift
//  Gallify
//
//  Created by Anshul on 11/14/21.
//

import SwiftUI
//import RefreshableScrollView

struct DiscoverPostsView: View {
    
    @EnvironmentObject var viewModel: TabBarViewModel
    @EnvironmentObject var firestoreQuery : FirestoreQuery

    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        

        
      //  Text("hi")
        
        ScrollView(showsIndicators: false) {
            
            LazyVStack {
                
//                DiscoverPostsViewTags(screenHeight: screenHeight, screenWidth: screenWidth)
//                    .padding(.bottom, 10)
//                
//                ForEach(firestoreQuery.discoveryPageArt) { i in
//                    Text("\(i.name)")
//                }
                
//                DiscoverPagePosts()
                
                
            }
            .padding(.top, screenHeight / 160)
        }
        
//        .onRefresh(spinningColor: .primary, text: "Pull Me!", textColor: .primary, backgroundColor: .white) { refreshControl in
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//               // await firestoreQuery.getDiscoverContent()
//                firestoreQuery.getDiscoverContent_non_async()
//                refreshControl.endRefreshing()
//            }
//        }
        //.offset(y: 100)
        

        
    }
    
}

struct DiscoverPostsView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverPostsView()
            .environmentObject(TabBarViewModel())
    }
}
