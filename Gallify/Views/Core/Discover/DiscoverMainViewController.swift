//
//  DiscoverMain.swift
//  Gallify
//
//  Created by Anshul on 11/12/21.
//
import SwiftUI
import AlgoliaSearchClient

struct DiscoverMainView: View {
    
    @EnvironmentObject var viewModel: TabBarViewModel
    @EnvironmentObject var firestoreQuery : FirestoreQuery
    @State var searchText = ""
    @State var showCancelButton = false
    @State var searchType = "User"
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        NavigationView {
            
            VStack {
                
               // ZStack{
                
                    HStack {
                        
                        HStack {

                            Image(systemName: "magnifyingglass")
                            TextField("Search", text: $firestoreQuery.searchText, onEditingChanged: { isEditing in
                                self.showCancelButton = true
                            })
                                .foregroundColor(.primary)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)

                            Button(action: {
                                firestoreQuery.searchText = ""
                            }) {
                                Image(systemName: "xmark")
                                    .foregroundColor(.black)
                                    .opacity(firestoreQuery.searchText == "" ? 0 : 1)
                            }
                        }
                        .padding(.horizontal, screenWidth / 37.5)
                        .padding(.vertical, screenHeight / 80)
                        .foregroundColor(.secondary)
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(screenWidth / 30)

                        if showCancelButton {
                            
                            Button("Cancel") {
                                UIApplication.shared.endEditing(true)
                                firestoreQuery.searchText = ""
                                self.showCancelButton = false
                            }
                            .foregroundColor(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                                                    
                        }
                        
                    }
                    .padding(.horizontal, screenWidth / 25)
                    .padding(.top, screenHeight / 54)
                
               // ScrollView(showsIndicators: false) {
                    
                    if showCancelButton {
                        
                        VStack {
                            
                            HStack {
                                
                                Button(action: {
                                    
                                    searchType = "User"
                                    
                                }, label: {
                                    
                                    Text("User")
                                        .foregroundColor(searchType == "User" ? Color("Gallify-Pink") : Color.black)
                                        .font(.system(size: screenWidth / 20, weight: .semibold))
                                    
                                })
                                .padding(.trailing, screenWidth / 25)
                                
                                Button(action: {
                                    
                                    searchType = "Artwork"
                                    
                                }, label: {
                                    
                                    Text("Artwork")
                                        .foregroundColor(searchType == "Artwork" ? Color("Gallify-Pink") : Color.black)
                                        .font(.system(size: screenWidth / 20, weight: .semibold))
                                    
                                })
                                .padding(.leading, screenWidth / 25)
                                
                            }
                            .padding(.top, screenHeight / 80)
                            
                            if firestoreQuery.searchText == "" {
                                
                                //DiscoverViewRecentSearch()
                                Spacer()
                                
                            }
                            
                            else {
                              
                                if(searchType == "User"){
                                    DiscoverUserSearch()
                                }
                                else{
                                    DiscoverSearch()
                                }
                                
                              
                                
                            }
                            
                        }
                        
                    }
                    
                    else {
                        
                        DiscoverPostsView()
                        
                    }
                    
               // }
               // .navigationBarHidden(true)
                
                
                //this is the minimized view of the reel.
                if !showCancelButton {
                    MinimizedView(screenHeight: screenHeight, screenWidth: screenWidth)
                }
                
            }
            .navigationBarHidden(true)
            
        }
        .navigationBarHidden(true)
        
    }
    
}

struct DiscoverMain_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverMainView()
            .environmentObject(TabBarViewModel())
    }
}
