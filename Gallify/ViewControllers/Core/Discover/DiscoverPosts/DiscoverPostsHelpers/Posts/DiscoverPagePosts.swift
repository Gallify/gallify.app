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
        
        
        if(!firestoreQuery.discoveryPageArt.isEmpty){
            
            let count = firestoreQuery.discoveryPageArt.count
            //Text("GI \(firestoreQuery.discoveryPageArt.count)")
                
                VStack {
                    
                    HStack {
                            
                        VStack {
                            
                            
                                HStack {
                                    if(0<count){
                                        Post_Small(discover_art: firestoreQuery.discoveryPageArt[0], index: 0)
                                    }
                                    if(1<count){
                                        Post_Small(discover_art: firestoreQuery.discoveryPageArt[1], index: 1)
                                    }
                                    
                                }
                    
                            
                            if(2<count){
                                Post_Large(discover_art: firestoreQuery.discoveryPageArt[2], index: 2)
                            }
                            
                        }
                        
                        
                        VStack {
                            
                            if(3<count){
                                Reel(discover_art: firestoreQuery.discoveryPageArt[3], index: 3)
                            }
                            
                            if(4<count){
                                Post_Small(discover_art: firestoreQuery.discoveryPageArt[4], index: 4)
                            }
                            
                        }
                        
                    }
                    
                    HStack {
                        if(5<count){
                            Post_Small(discover_art: firestoreQuery.discoveryPageArt[5], index: 5)
                        }
                        
                        if(6<count){
                            Post_Small(discover_art: firestoreQuery.discoveryPageArt[6], index: 6)
                        }
                        
                        if(7<count){
                            Post_Small(discover_art: firestoreQuery.discoveryPageArt[7], index: 7)
                        }
                        
                        
                    }
                    
                    HStack {
                        
                        
                            VStack {
                                
                                if(8<count){
                                    Post_Small(discover_art: firestoreQuery.discoveryPageArt[8], index: 8)
                                }
                                
                                if(9<count){
                                    Post_Small(discover_art: firestoreQuery.discoveryPageArt[9], index: 9)
                                }
                                
                            }
                    
                        
                        if(10<count){
                            Post_Large(discover_art: firestoreQuery.discoveryPageArt[10], index: 10)
                        }
                        
                    }
                    
                }
                .padding(.leading, screenWidth / 75)
            }
    }
}

struct DiscoverPagePosts_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverPagePosts()
            .environmentObject(TabBarViewModel())
    }
}

