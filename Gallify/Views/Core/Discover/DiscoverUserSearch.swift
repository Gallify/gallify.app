//
//  DiscoverSearch.swift
//  Gallify
//
//  Created by Anshul on 11/28/21.
//

import SwiftUI

struct DiscoverUserSearch: View {
    
    @EnvironmentObject var firestoreQuery : FirestoreQuery
    @EnvironmentObject var viewModel: TabBarViewModel
    
    
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        VStack {
            
            ScrollView(showsIndicators: false) {

                if(firestoreQuery.foundContacts_users.count > 0) {
                    
                    if(firestoreQuery.foundContacts_users.count > 20) {
                        
                        ForEach(0...19, id: \.self) { i in
                            
                            //NavigationLink(destination: OtherProfileViewVerified(), label: {
                                                
                                HStack {
                                    
                                    
                                        
                                        UserSearchResult(screenHeight: screenHeight, screenWidth: screenWidth, user: firestoreQuery.foundContacts_users[i])
                                        
                                        /*
                                        UserSearchResult(screenHeight: screenHeight, screenWidth: screenWidth)*/
                                        
                                   
                                        
                                }
                                    
                           // })
                            
                        }
                        .listStyle(.plain)
                        .searchable(text: $firestoreQuery.searchText)
                        .onChange(of: firestoreQuery.searchText){ value in
                            if(!value.isEmpty){ // && value.count > 3
                                firestoreQuery.search_user(searchText: value)
                            }
                            else{
                                firestoreQuery.foundContacts_users.removeAll()
                            }
                        }
                    }
                    
                    else {
                        
                        ForEach(0...firestoreQuery.foundContacts_users.count - 1, id: \.self) { i in
                            
                            
                           // NavigationLink(destination: OtherProfileViewVerified(), label: {
                                        
                            
                                
                                UserSearchResult(screenHeight: screenHeight, screenWidth: screenWidth, user: firestoreQuery.foundContacts_users[i])
                                
//                                UserSearchResult(screenHeight: screenHeight, screenWidth: screenWidth)
                                
                            
                            
                            
                                
//                                HStack {
//
//                                    OtherSearchTemplate(screenHeight: screenHeight, screenWidth: screenWidth, image: Image("charleyrivers"), title: "Dreamy Nights", searchType: "Gallify Collection", artistName: "Pablo Escobar")
//
//                                    Image(systemName: "greaterthan")
//                                        .resizable()
//                                        .frame(width: screenWidth / 20, height: screenHeight / 43)
//                                        .foregroundColor(.black)
//                                        .padding(.horizontal, screenWidth / 25)
//
//                                }
                                    
                          //  })
                            
                        }
                        .listStyle(.plain)
                        .searchable(text: $firestoreQuery.searchText)
                        .onChange(of: firestoreQuery.searchText){ value in
                            if(!value.isEmpty){ // && value.count > 3
                                firestoreQuery.search_user(searchText: value)
                            }
                            else{
                                firestoreQuery.foundContacts_users.removeAll()
                            }
                        }
                    }
                }
                else{
                    ForEach(0...0, id: \.self) { i in
                    }
                    .listStyle(.plain)
                    .searchable(text: $firestoreQuery.searchText)
                    .onChange(of: firestoreQuery.searchText){ value in
                        if(!value.isEmpty){ // && value.count > 3
                            firestoreQuery.search_user(searchText: value)
                        }
                        else{
                            firestoreQuery.foundContacts_users.removeAll()
                        }
                    }
                    
                }
                
            }

        }
        .navigationBarHidden(true)
        
    }
}
        
       
