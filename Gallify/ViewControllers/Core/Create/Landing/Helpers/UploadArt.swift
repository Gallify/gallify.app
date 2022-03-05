//
//  SettingsViewController.swift
//  Gallify
//
//  Created by Tejvir Mann on 8/18/21.
//
import UIKit
import SwiftUI
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestoreSwift



struct UploadArt : View {
    
    @EnvironmentObject var viewModel : LoginAppViewModel
    @EnvironmentObject var tabBarViewModel: TabBarViewModel
    @EnvironmentObject var firestoreQuery: FirestoreQuery
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var pickedImage: UIImage?
    @State var showActionSheet = false
    @State var showImagePicker = false
    @State var sourceType : UIImagePickerController.SourceType = .photoLibrary
    
    var metadata = StorageMetadata()
    let playlist: Playlist
    
     var body: some View {
         
         let screenWidth = viewModel.screenWidth
         let screenHeight = viewModel.screenHeight
         
         HStack {
             
             CustomBackButton(buttonHeight: screenHeight / 32.5, buttonWidth: screenWidth / 15, image: Image(systemName: "chevron.left.circle"), presentationMode: _presentationMode)
                 .padding(.horizontal, screenWidth / 25)
                 .padding(.vertical, screenHeight / 100)
             
             Spacer()
             
         }
         
        ScrollView {
            
            VStack {
                
                Text("Upload Image")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                
                VStack {
                    
                    if pickedImage != nil {
                        
                        Image(uiImage: pickedImage!)
                            .resizable()
                            .frame(width: 100,
                                   height: 100)
                            .padding(.top, 20)
                            .onTapGesture{
                                self.showActionSheet = true
                        }
                        
                    }
                    
                    else {
                        
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .frame(width: 100,
                                       height: 100)
                            .padding(.top, 20)
                            .onTapGesture {
                                   self.showActionSheet = true
                         }
                        
                    }
                
                }.actionSheet(isPresented: $showActionSheet) {
                    
                    ActionSheet(title: Text("Add a picture "), message: nil, buttons: [
                        //Button1
                        
                        .default(Text("Camera"), action: {
                            self.showImagePicker = true
                            self.sourceType = .camera
                        }),
                        //Button2
                        .default(Text("Photo Library"), action: {
                            self.showImagePicker = true
                            self.sourceType = .photoLibrary
                        }),
                        
                        //Button3
                        .cancel()
                        
                    ])
                }.sheet(isPresented: $showImagePicker){
                    imagePicker(image: self.$pickedImage, showImagePicker: self.$showImagePicker, sourceType: self.sourceType)
                }
            
            Button(action: {
              
                async{ await StorageService.uploadArtImage(image: self.pickedImage!.jpegData(compressionQuality: 0.5) ?? Data(), playlist: self.playlist)}
                
                }, label: {
                    Text("Upload")
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .padding()
                })
                
            //Text("Image Uploaded")
                
//                Button(action: {
//                    viewModel.signOut()
//                }, label: {
//                    Text("Sign Out")
//                        .frame(width: 200, height: 50)
//                        .background(Color.green)
//                        .foregroundColor(Color.blue)
//                        .padding()
//                })
//
            }
            .navigationBarHidden(true)
            
        }
        .navigationBarHidden(true)
         
    }
    
}

//struct SettingViewController: PreviewProvider {
//    static var previews: some View {
//        OldSettingsView()
//            .environmentObject(LoginAppViewModel())
//            .environmentObject(SettingsViewController())
//        
//    }
//}
