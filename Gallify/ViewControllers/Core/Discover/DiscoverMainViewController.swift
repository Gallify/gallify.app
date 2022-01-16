//
//  DiscoverMain.swift
//  Gallify
//
//  Created by Anshul on 11/12/21.
//
import SwiftUI

struct DiscoverMainView: View {
    
    @EnvironmentObject var viewModel: TabBarViewModel
    @State var searchText = ""
    @State var showCancelButton = false
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        NavigationView {
            
            VStack {
                
                HStack {
                    
                    HStack {

                        Image(systemName: "magnifyingglass")
                        TextField("Search", text: $searchText, onEditingChanged: { isEditing in
                            self.showCancelButton = true
                        })
                            .foregroundColor(.primary)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)

                        Button(action: {
                            self.searchText = ""
                        }) {
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .opacity(searchText == "" ? 0 : 1)
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
                            self.searchText = ""
                            self.showCancelButton = false
                        }
                        .foregroundColor(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                                                
                    }
                    
                }
                .padding(.horizontal, screenWidth / 25)
                .padding(.top, screenHeight / 54)
                
                ScrollView(showsIndicators: false) {
                    
                    if showCancelButton {
                        
                        if searchText == "" {
                            
                            DiscoverViewRecentSearch()
                            
                        }
                        
                        else {
                            
                            DiscoverSearch()
                            
                        }
                        
                    }
                    
                    else {
                        
                        DiscoverPostsView()
                        
                    }
                    
                }
                .navigationBarHidden(true)
                
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
