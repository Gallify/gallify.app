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
    @EnvironmentObject var firestoreQuery: FirestoreQuery
    let playlistName: String
    
    //image set
    @State var showImagePicker = false
    @State var sourceType : UIImagePickerController.SourceType = .photoLibrary
    @State var playlistImageUpdate = false
    @State var pickedImage: UIImage?
    @State var showActionSheet = false
    @State var privacyNum = -1
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

            
            VStack {
                HStack{
                    VStack {
                        if pickedImage != nil {
                            Image(uiImage: pickedImage!)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200,
                                       height: 200)
                                .clipped()
                                .padding(.top, 20)
                                .onTapGesture{
                                    self.showActionSheet = true
                                }
                        } else {
                            Image(systemName: "square.fill")
                                    .resizable()
                                    .overlay(
                                        Text("Select Image")
                                            .fontWeight(.bold)
                                           .foregroundColor(.white)
                                           //.padding()
                                          // .background(Color.blue)
                                           //.cornerRadius(15)
                                           //.padding()
                                      // alignment: .top
                                    )
                                    .cornerRadius(0)
                                    .frame(width: 100,
                                           height: 100)
                                    
                                    .padding(.top, 20)
                                    .padding(.bottom, 40)
                                    .foregroundColor(Color(red:CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48())))
                                    .onTapGesture {
                                       self.showActionSheet = true
                                    }
                        }
                    
                    }.actionSheet(isPresented: $showActionSheet){
                        ActionSheet(title: Text("Add a picture "), message: nil, buttons: [
                            //Button1
                            
                            .default(Text("Camera"), action: {
                                self.showImagePicker = true
                                self.sourceType = .camera
                                playlistImageUpdate = true  // is this the best place to change this?
                            }),
                            //Button2
                            .default(Text("Photo Library"), action: {
                                self.showImagePicker = true
                                self.sourceType = .photoLibrary
                                playlistImageUpdate = true
                            }),
                            
                            //Button3
                            .cancel()
                            
                        ])
                    }.sheet(isPresented: $showImagePicker){
                        imagePicker(image: self.$pickedImage, showImagePicker: self.$showImagePicker, sourceType: self.sourceType)
                    }
                
                }
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
                        .font(.system(size: screenWidth / 25, weight: .semibold))
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
                        .font(.system(size: screenWidth / 25, weight: .semibold))
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
                
                /*
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
                 */
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
                        .font(.system(size: screenWidth / 25, weight: .semibold))
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
                    
                    Text("Gallify Collection")
                        .font(.system(size: screenWidth / 25, weight: .semibold))
                        .foregroundColor(.black)
                        .padding(.leading, screenWidth / 25)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        playlistType = "Gallify Collection"
                        
                    }, label: {
                            
                        if playlistType == "Gallify Collection" {
                                
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
            
            Button(action: {
                
                    //haptic feedback
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                    
                    if(playlistPrivacy == "Private") {
                        privacyNum = 0
                    } else if(playlistPrivacy == "Public") {
                        privacyNum = 1
                    } else if(playlistPrivacy == "Followers Only") {
                        privacyNum = 2
                    } else {
                        privacyNum = 3
                    }
                
                
                    Task {
                        
                       // await firestoreQuery.updatePlaylistImage(image: self.pickedImage!.jpegData(compressionQuality: 0.5) ?? Data())
                        let playlistRef = await firestoreQuery.create_playlist(name: playlistName, privacy : privacyNum, type: playlistType)
                        
                        if(playlistImageUpdate == true){
                            await firestoreQuery.updatePlaylistImage(image: self.pickedImage!.jpegData(compressionQuality: 0.5) ?? Data(), uid: playlistRef)
                        }
                    }
                
                    //self.presentationMode.wrappedValue.dismiss()
                    
                
                    
                }, label: {
                    Group{
                        
                        Text("Create " + playlistType)
                            .font(.system(size: screenWidth / 18.5, weight: .bold))
                            .foregroundColor(Color.white)
                            .padding(.horizontal, screenWidth / 8.5)
                            .padding(.vertical, screenHeight / 65)
                            .background(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                            .cornerRadius(screenWidth / 15)
                    }
                    
                })
                
        
        
        }
        .navigationBarHidden(true)
        .padding(.top, screenHeight / 80)
    
            
    }
//    .navigationBarHidden(true)
//    .padding(.top, screenHeight / 80)
    
}
    


struct CreatePlaylistSettings_Previews: PreviewProvider {
    static var previews: some View {
        CreatePlaylistSettings(playlistName: "hi")
            .environmentObject(TabBarViewModel())
    }
}
