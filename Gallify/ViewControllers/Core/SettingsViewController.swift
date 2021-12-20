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

class SettingsViewController : ObservableObject {

    
}

struct SettingsView : View {
    
    @EnvironmentObject var viewModel : LoginAppViewModel

    @State var pickedImage: UIImage?
    @State private var showActionSheet = false
    @State private var showImagePicker = false
    @State private var sourceType : UIImagePickerController.SourceType = .photoLibrary
    
    @EnvironmentObject var settingsViewModel : SettingsViewController
    
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
                    let db = Firestore.firestore()
                    func fetchUser() {
                        let docRef = db.collection("users").document(Auth.auth().currentUser!.email!)
                        docRef.getDocument { (document, error) in
                            let result = Result {
                                try document?.data(as: User.self)
                            }
                            switch result {
                            case .success(let user):
                                 if let user = user {
                                     // A `User` value was successfully initialized from the DocumentSnapshot
                                     //set data to user
                                     
                                     print("USER EMAIL = ", user.email)
                                     StorageService.saveProfileImage(email: user.email, imageData:self.pickedImage!.jpegData(compressionQuality: 0.5) ?? Data(), metaData: metadata)
                                 } else {
                                     // A nil value was successfully initialized from the DocumentSnapshot,
                                     // or the DocumentSnapshot was nil.
                                     print("Document does not exist")
                                 }
                             case .failure(let error):
                                 // A `User` value could not be initialized from the DocumentSnapshot.
                                 print("Error decoding user: \(error)")
                             }
                         }
                        
                        //return self.email
                    }
                    
                    fetchUser()
                    
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
        SettingsView()
            .environmentObject(LoginAppViewModel())
            .environmentObject(SettingsViewController())
        
    }
}
