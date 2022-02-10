//
//  DiscoverSearch.swift
//  Gallify
//
//  Created by Anshul on 11/28/21.
//

import SwiftUI





struct DiscoverSearch: View {
    
    @EnvironmentObject var firestoreQuery : FirestoreQuery
    @EnvironmentObject var viewModel: TabBarViewModel
    //@EnvironmentObject var searchModel: SearchViewModel
    //@Binding var searchText: String
    
    var body: some View {
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        
        VStack{
            ScrollView(showsIndicators: false) {

                if(firestoreQuery.foundContacts.count > 0){
                    if(firestoreQuery.foundContacts.count > 20){
                        ForEach(0...19, id: \.self) { i in
                            
                            HStack{
                                Text("\(firestoreQuery.foundContacts.count)")
                                Spacer()
                            }
                            .offset(x: 10)
                            
                            //NavigationLink(destination: OtherProfileViewVerified(), label: {
                                                
                                HStack {
                                    
                                    SearchResultView(screenHeight: screenHeight, screenWidth: screenWidth, artwork: firestoreQuery.foundContacts[i])
                                        
                                        
                                }
                                    
                           // })
                            
                        }
                        .listStyle(.plain)
                        .searchable(text: $firestoreQuery.searchText)
                        .onChange(of: firestoreQuery.searchText){ value in
                            if(!value.isEmpty){ // && value.count > 3
                                firestoreQuery.search(searchText: value)
                            }
                            else{
                                firestoreQuery.foundContacts.removeAll()
                            }
                        }
                    }
                    else{
                        
                        HStack{
                            Text("\(firestoreQuery.foundContacts.count)")
                            Spacer()
                        }
                        .offset(x: 10)
                        
                        
                        ForEach(0...firestoreQuery.foundContacts.count - 1, id: \.self) { i in
                            
                            
                           // NavigationLink(destination: OtherProfileViewVerified(), label: {
                                        
                                SearchResultView(screenHeight: screenHeight, screenWidth: screenWidth, artwork: firestoreQuery.foundContacts[i])
                                
//                                HStack {
//
//                                    OtherSearchTemplate(screenHeight: screenHeight, screenWidth: screenWidth, image: Image("charleyrivers"), title: "Dreamy Nights", searchType: "Collection", artistName: "Pablo Escobar")
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
                                firestoreQuery.search(searchText: value)
                            }
                            else{
                                firestoreQuery.foundContacts.removeAll()
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
                            firestoreQuery.search(searchText: value)
                        }
                        else{
                            firestoreQuery.foundContacts.removeAll()
                        }
                    }
                    
                }
                
                
               

                
                
                
                
            }

        }
        .navigationBarHidden(true)
 
        
    }
}
        
       
