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

class SettingsViewController : ObservableObject {
    let db = Firestore.firestore()
    private let userId : String = ""
    
    func fetchData() -> [String:Any] {
        guard let email = Auth.auth().currentUser?.email else { return [String:Any]() }
        let data = FirestoreQuery().query(email: email)
        print("THIS IS THE DICTIONARY --> ", data)
        return data
    }
    
}

struct SettingsView : View {
    
    @EnvironmentObject var viewModel : LoginAppViewModel

    //@State var profile_image:Image?
    @State var pickedImage: UIImage?
    @State private var showActionSheet = false
    @State private var showImagePicker = false
    @State private var sourceType : UIImagePickerController.SourceType = .photoLibrary
    
    @ObservedObject var settingViewModel = SettingsViewController()
    
    private var metadata = StorageMetadata()
    
     var body: some View {
        ScrollView {
            VStack {
                
            Text("Settings")
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
                    } else {
                        Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 100,
                                       height: 100)
                                .padding(.top, 20)
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
                    let auth = Auth.auth()
                    StorageService.saveProfileImage(email: (auth.currentUser?.email)!, imageData: self.pickedImage!.jpegData(compressionQuality: 0.5) ?? Data(), metaData: metadata)
                }, label: {
                    Text("Save")
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .padding()
                })
                
            Text("You are signed in")
                
            Button(action: {
                viewModel.signOut()
            }, label: {
                Text("Sign Out")
                    .frame(width: 200, height: 50)
                    .background(Color.green)
                    .foregroundColor(Color.blue)
                    .padding()
            })
                
             
        }
    }
}
    
}

struct SettingViewController: PreviewProvider {
    static var previews: some View {
        SettingsView().environmentObject(LoginAppViewModel())
    }
}
