//
//  CreatePlaylistSettings.swift
//  Gallify
//
//  Created by Anshul on 2/12/22.
//

import SwiftUI

struct CreatePlaylistSettings: View {
    
    @EnvironmentObject var viewModel: TabBarViewModel
    @State var playlistPrivacy = "Public"
    @State var playlistType = "Playlist"
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        let screenWidth = viewModel.screenWidth
        let screenHeight = viewModel.screenHeight
    
        VStack {
            
            HStack {
                
                CustomBackButton(buttonHeight: screenHeight / 32.5, buttonWidth: screenWidth / 15, image: Image(systemName: "chevron.left.circle"), presentationMode: _presentationMode)
                    .padding(.horizontal, screenWidth / 25)
                    .padding(.vertical, screenHeight / 100)
                
                Spacer()
                
            }
            
            HStack {
                
                Text("Privacy")
                    .font(.system(size: screenWidth / 15, weight: .bold))
                
                Spacer()
                
            }
            .padding(.leading, screenWidth / 12)
            .padding(.bottom, screenHeight / 80)
            
            VStack {
                
                HStack {
                    
                    Text("Public")
                        .font(.system(size: screenWidth / 20, weight: .semibold))
                        .foregroundColor(.black)
                        .padding(.leading, screenWidth / 25)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        playlistPrivacy = "Public"
                        
                    }, label: {
                            
                        if playlistPrivacy == "Public" {
                                
                            Image(systemName: "circle")
                                .resizable()
                                .frame(width: screenWidth / 20, height: screenHeight / 43)
                                .foregroundColor(.black)
                                .background(Circle()
                                                .frame(width: screenWidth / 37.5, height: screenHeight / 80)
                                                .foregroundColor(.green))
                                
                                
                        }
                            
                        else {
                                
                            Image(systemName: "circle")
                                .resizable()
                                .frame(width: screenWidth / 20, height: screenHeight / 43)
                                .foregroundColor(.black)
                                
                        }
                        
                    })
                    
                }
                .padding(.horizontal, screenWidth / 12)
                
                HStack {
                    
                    Text("Private")
                        .font(.system(size: screenWidth / 20, weight: .semibold))
                        .foregroundColor(.black)
                        .padding(.leading, screenWidth / 25)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        playlistPrivacy = "Private"
                        
                    }, label: {
                            
                        if playlistPrivacy == "Private" {
                                
                            Image(systemName: "circle")
                                .resizable()
                                .frame(width: screenWidth / 20, height: screenHeight / 43)
                                .foregroundColor(.black)
                                .background(Circle()
                                                .frame(width: screenWidth / 37.5, height: screenHeight / 80)
                                                .foregroundColor(.green))
                                
                                
                        }
                            
                        else {
                                
                            Image(systemName: "circle")
                                .resizable()
                                .frame(width: screenWidth / 20, height: screenHeight / 43)
                                .foregroundColor(.black)
                                
                        }
                        
                    })
                    
                }
                .padding(.horizontal, screenWidth / 12)
                
                HStack {
                    
                    Text("Followers Only")
                        .font(.system(size: screenWidth / 20, weight: .semibold))
                        .foregroundColor(.black)
                        .padding(.leading, screenWidth / 25)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        playlistPrivacy = "Followers Only"
                        
                    }, label: {
                            
                        if playlistPrivacy == "Followers Only" {
                                
                            Image(systemName: "circle")
                                .resizable()
                                .frame(width: screenWidth / 20, height: screenHeight / 43)
                                .foregroundColor(.black)
                                .background(Circle()
                                                .frame(width: screenWidth / 37.5, height: screenHeight / 80)
                                                .foregroundColor(.green))
                                
                                
                        }
                            
                        else {
                                
                            Image(systemName: "circle")
                                .resizable()
                                .frame(width: screenWidth / 20, height: screenHeight / 43)
                                .foregroundColor(.black)
                                
                        }
                        
                    })
                    
                }
                .padding(.horizontal, screenWidth / 12)
                
                HStack {
                    
                    Text("Connections Only")
                        .font(.system(size: screenWidth / 20, weight: .semibold))
                        .foregroundColor(.black)
                        .padding(.leading, screenWidth / 25)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        playlistPrivacy = "Connections Only"
                        
                    }, label: {
                            
                        if playlistPrivacy == "Connections Only" {
                                
                            Image(systemName: "circle")
                                .resizable()
                                .frame(width: screenWidth / 20, height: screenHeight / 43)
                                .foregroundColor(.black)
                                .background(Circle()
                                                .frame(width: screenWidth / 37.5, height: screenHeight / 80)
                                                .foregroundColor(.green))
                                
                                
                        }
                            
                        else {
                                
                            Image(systemName: "circle")
                                .resizable()
                                .frame(width: screenWidth / 20, height: screenHeight / 43)
                                .foregroundColor(.black)
                                
                        }
                        
                    })
                    
                }
                .padding(.horizontal, screenWidth / 12)
                
            }
            .padding(.bottom, screenHeight / 160)
            
            HStack {
                
                Text("Type")
                    .font(.system(size: screenWidth / 15, weight: .bold))
                
                Spacer()
                
            }
            .padding(.leading, screenWidth / 12)
            .padding(.bottom, screenHeight / 80)
            
            VStack {
                
                HStack {
                    
                    Text("Playlist")
                        .font(.system(size: screenWidth / 20, weight: .semibold))
                        .foregroundColor(.black)
                        .padding(.leading, screenWidth / 25)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        playlistType = "Playlist"
                        
                    }, label: {
                            
                        if playlistType == "Playlist" {
                                
                            Image(systemName: "circle")
                                .resizable()
                                .frame(width: screenWidth / 20, height: screenHeight / 43)
                                .foregroundColor(.black)
                                .background(Circle()
                                                .frame(width: screenWidth / 37.5, height: screenHeight / 80)
                                                .foregroundColor(.green))
                                
                                
                        }
                            
                        else {
                                
                            Image(systemName: "circle")
                                .resizable()
                                .frame(width: screenWidth / 20, height: screenHeight / 43)
                                .foregroundColor(.black)
                                
                        }
                        
                    })
                    
                }
                .padding(.horizontal, screenWidth / 12)
                
                HStack {
                    
                    Text("Collection")
                        .font(.system(size: screenWidth / 20, weight: .semibold))
                        .foregroundColor(.black)
                        .padding(.leading, screenWidth / 25)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        playlistType = "Collection"
                        
                    }, label: {
                            
                        if playlistType == "Collection" {
                                
                            Image(systemName: "circle")
                                .resizable()
                                .frame(width: screenWidth / 20, height: screenHeight / 43)
                                .foregroundColor(.black)
                                .background(Circle()
                                                .frame(width: screenWidth / 37.5, height: screenHeight / 80)
                                                .foregroundColor(.green))
                                
                                
                        }
                            
                        else {
                                
                            Image(systemName: "circle")
                                .resizable()
                                .frame(width: screenWidth / 20, height: screenHeight / 43)
                                .foregroundColor(.black)
                                
                        }
                        
                    })
                    
                }
                .padding(.horizontal, screenWidth / 12)
                
                HStack {
                    
                    Text("Auction Collection")
                        .font(.system(size: screenWidth / 20, weight: .semibold))
                        .foregroundColor(.black)
                        .padding(.leading, screenWidth / 25)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        playlistType = "Auction Collection"
                        
                    }, label: {
                            
                        if playlistType == "Auction Collection" {
                                
                            Image(systemName: "circle")
                                .resizable()
                                .frame(width: screenWidth / 20, height: screenHeight / 43)
                                .foregroundColor(.black)
                                .background(Circle()
                                                .frame(width: screenWidth / 37.5, height: screenHeight / 80)
                                                .foregroundColor(.green))
                                
                                
                        }
                            
                        else {
                                
                            Image(systemName: "circle")
                                .resizable()
                                .frame(width: screenWidth / 20, height: screenHeight / 43)
                                .foregroundColor(.black)
                                
                        }
                        
                    })
                    
                }
                .padding(.horizontal, screenWidth / 12)
                
            }
            
            Spacer()
            
        }
        .navigationBarHidden(true)
        .padding(.top, screenHeight / 80)
        
    }
    
}

struct CreatePlaylistSettings_Previews: PreviewProvider {
    static var previews: some View {
        CreatePlaylistSettings()
            .environmentObject(TabBarViewModel())
    }
}
