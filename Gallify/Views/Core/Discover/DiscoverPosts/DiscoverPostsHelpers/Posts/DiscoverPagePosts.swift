//
//  DiscoverPagePosts.swift
//  Gallify
//
//  Created by Anshul on 11/17/21.
//

import SwiftUI

struct DiscoverPagePosts: View {
    
    @EnvironmentObject var viewModel: TabBarViewModel
    @EnvironmentObject var firestoreQuery : FirestoreQuery
    
    var body: some View {
        
        let screenWidth = viewModel.screenWidth
        let screenHeight = viewModel.screenHeight
        
        if !firestoreQuery.discoveryPageArt.isEmpty {
            
            let count = firestoreQuery.discoveryPageArt.count
            
            LazyVStack {
                
                HStack {
                    
                    Post_Small(discover_art: firestoreQuery.discoveryPageArt[count % count], index: count % count)
                    
                    Post_Small(discover_art: firestoreQuery.discoveryPageArt[(count + 1) % count], index: (count + 1) % count)
                    
                    Post_Small(discover_art: firestoreQuery.discoveryPageArt[(count + 2) % count], index: (count + 2) % count)
                    
                }
                
                HStack {
                    
                    Post_Large(discover_art: firestoreQuery.discoveryPageArt[(count + 3) % count], index: (count + 3) % count)
                    
                    VStack {
                        
                        Post_Small(discover_art: firestoreQuery.discoveryPageArt[(count + 4) % count], index: (count + 4) % count)
                        
                        Post_Small(discover_art: firestoreQuery.discoveryPageArt[(count + 5) % count], index: (count + 5) % count)
                        
                    }
                    
                }
                
                HStack {
                    
                    Post_Small(discover_art: firestoreQuery.discoveryPageArt[(count + 6) % count], index: (count + 6) % count)
                    
                    Post_Small(discover_art: firestoreQuery.discoveryPageArt[(count + 7) % count], index: (count + 7) % count)
                    
                    Post_Small(discover_art: firestoreQuery.discoveryPageArt[(count + 8) % count], index: (count + 8) % count)
                    
                }
                
                HStack {
                    
                    VStack {
                        
                        Post_Small(discover_art: firestoreQuery.discoveryPageArt[(count + 9) % count], index: (count + 9) % count)
                        
                        Post_Small(discover_art: firestoreQuery.discoveryPageArt[(count + 10) % count], index: (count + 10) % count)
                        
                    }
                    
                    Post_Large(discover_art: firestoreQuery.discoveryPageArt[(count + 11) % count], index: (count + 11) % count)
                    
                }
                
                HStack {
                    
                    Post_Small(discover_art: firestoreQuery.discoveryPageArt[(count + 12) % count], index: (count + 12) % count)
                    
                    Post_Small(discover_art: firestoreQuery.discoveryPageArt[(count + 13) % count], index: (count + 13) % count)
                    
                    Post_Small(discover_art: firestoreQuery.discoveryPageArt[(count + 14) % count], index: (count + 14) % count)
                    
                }
                
                HStack {
                    
                    Post_Large(discover_art: firestoreQuery.discoveryPageArt[(count + 15) % count], index: (count + 15) % count)
                    
                    VStack {
                        
                        Post_Small(discover_art: firestoreQuery.discoveryPageArt[(count + 16) % count], index: (count + 16) % count)
                        
                        Post_Small(discover_art: firestoreQuery.discoveryPageArt[(count + 17) % count], index: (count + 17) % count)
                        
                    }
                    
                }
                
                HStack {
                    
                    Post_Small(discover_art: firestoreQuery.discoveryPageArt[(count + 18) % count], index: (count + 18) % count)
                    
                    Post_Small(discover_art: firestoreQuery.discoveryPageArt[(count + 19) % count], index: (count + 19) % count)
                    
                    Post_Small(discover_art: firestoreQuery.discoveryPageArt[(count + 20) % count], index: (count + 20) % count)
                    
                }
                
                HStack {
                    
                    VStack {
                        
                        Post_Small(discover_art: firestoreQuery.discoveryPageArt[(count + 21) % count], index: (count + 21) % count)
                        
                        Post_Small(discover_art: firestoreQuery.discoveryPageArt[(count + 22) % count], index: (count + 22) % count)
                        
                    }
                    
                    Post_Large(discover_art: firestoreQuery.discoveryPageArt[(count + 23) % count], index: (count + 23) % count)
                    
                }
                
            }
            .padding(.leading, screenWidth / 75)
            
        }
        
    }
    
}
