//
//  CreateLandingOptions.swift
//  Gallify
//
//  Created by Gianluca Profio on 10/31/21.
//

import SwiftUI

struct CreateLandingOptions: View {
    
    let screenWidth: CGFloat
    let screenHeight: CGFloat

    
    @State private var uploadModelShowingSheet = false
    @State private var uploadVideoShowingSheet = false
    @State private var uploadImageShowingSheet = false
    @State private var createModelVideoShowingSheet = false
    @State private var createModelImageShowingSheet = false

    @State private var uploadModelShowingHelp = false
    @State private var uploadVideoShowingHelp = false
    @State private var uploadImageShowingHelp = false
    @State private var createModelVideoShowingHelp = false
    @State private var createModelImageShowingHelp = false

    var body: some View {
        
        VStack {
          
            VStack {
                Button(action: {
                    self.uploadModelShowingSheet = true;
                    self.uploadVideoShowingSheet = true;
                    self.uploadImageShowingSheet = true;
            }) {
                Text("Upload")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(screenWidth / 30)
                    .padding(.horizontal, screenWidth / 12)
                    .background(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                    .cornerRadius(screenWidth / 15)
                    .multilineTextAlignment(.center)
                        }
                
                NavigationLink(destination: TabBarView(), isActive: $uploadModelShowingHelp) {
                    EmptyView()
                }
                
                NavigationLink(destination: CollectionRecentActivityView(screenWidth: screenWidth, screenHeight: screenHeight), isActive: $uploadVideoShowingHelp) {
                    EmptyView()
                }
                
                NavigationLink(destination: CollectionLikedView(screenWidth: screenWidth, screenHeight: screenHeight), isActive: $uploadImageShowingHelp) {
                    EmptyView()
                }
                
            }
            
            .actionSheet(isPresented: $uploadModelShowingSheet) {
                ActionSheet(
                    title: Text("Asset Class:"),
                    message: Text(""),
                    buttons: [.cancel(),
                              .default(Text("Model")) {
                                self .uploadModelShowingSheet = false
                                self .uploadModelShowingHelp = true
                        },
                              .default(Text("Video")) {
                                self .uploadVideoShowingSheet = false
                                self .uploadVideoShowingHelp = true
                        },
                              .default(Text("Image")) {
                                self .uploadImageShowingSheet = false
                                self .uploadImageShowingHelp = true
                        }
                    ]
                )
            }.padding()
            
            
            
            VStack {
                
            Button(action: {
                self.createModelVideoShowingSheet = true;
                self.createModelImageShowingSheet = true;
            }) {
                Text("Create")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(screenWidth / 30)
                    .padding(.horizontal, screenWidth / 12)
                    .background(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                    .cornerRadius(screenWidth / 15)
                    .multilineTextAlignment(.center)
                        }
                
                NavigationLink(destination: TabBarView(), isActive: $createModelVideoShowingHelp) {
                    EmptyView()
                }
                
                NavigationLink(destination: CollectionRecentActivityView(screenWidth: screenWidth, screenHeight: screenHeight), isActive: $createModelImageShowingHelp) {
                    EmptyView()
                }
                
                .actionSheet(isPresented: $createModelVideoShowingSheet) {
                    ActionSheet(
                        title: Text("Asset Class:"),
                        message: Text(""),
                        buttons: [.cancel(),
                                  .default(Text("Video")) {
                                    self .createModelVideoShowingSheet = false
                                    self .createModelVideoShowingHelp = true
                            },
                                  .default(Text("Image")) {
                                    self .createModelVideoShowingSheet = false
                                    self .createModelImageShowingHelp = true
                            },
                        ]
                    )
                }
                
            }
            
        }
    }
}

struct CreateLandingOptions_Previews: PreviewProvider {
    static var previews: some View {
        CreateLandingOptions(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}
