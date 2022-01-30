//
//  ProfileSettingBody.swift
//  Gallify
//
//  Created by Gianluca Profio on 1/23/22.
//

import SwiftUI

struct ProfileSettingBody: View {
    
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    
    @State var buttonPressed = false
        
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var firestoreQuery: FirestoreQuery
    
    /*@EnvironmentObject var viewModel : LoginAppViewModel
    @State var pickedImage: UIImage?
    @State private var showActionSheet = false
    @State private var showImagePicker = false
    @State private var sourceType : UIImagePickerController.SourceType = .photoLibrary
    @EnvironmentObject var settingsViewModel : ProfileSetting
    private var metadata = StorageMetadata()*/
    
    var body: some View {
        
        VStack {
            /*VStack {
                HStack{
                    Spacer()
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
                        StorageService.saveProfileImage(uid: firestoreQuery.data.uid, imageData:self.pickedImage!.jpegData(compressionQuality: 0.5) ?? Data(), metaData: metadata)
                    }, label: {
                        Text("Save")
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .padding()
                    })
                    Spacer()
                }*/
                HStack {
                    Text("First Name")
                        .padding(.leading)
                    Spacer()
                }
                VStack {
                    TextField("John", value: $firestoreQuery.data.firstName, formatter: NumberFormatter())
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .textFieldStyle(OvalTextFieldStyle(screenHeight: screenHeight, screenWidth: screenWidth))
                        .padding(.horizontal, screenWidth / 15)
                    HStack {
                        Text("Last Name")
                            .padding(.leading)
                        Spacer()
                    }
                    TextField("Brown", value: $firestoreQuery.data.lastName, formatter: NumberFormatter())
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .textFieldStyle(OvalTextFieldStyle(screenHeight: screenHeight, screenWidth: screenWidth))
                        .padding(.horizontal, screenWidth / 15)
                    HStack {
                        Text("Username")
                            .padding(.leading)
                        Spacer()
                    }
                    TextField("johnny_buckets", value: $firestoreQuery.data.username, formatter: NumberFormatter())
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .textFieldStyle(OvalTextFieldStyle(screenHeight: screenHeight, screenWidth: screenWidth))
                        .padding(.horizontal, screenWidth / 15)
                    
                    if buttonPressed {
                                
                        if firestoreQuery.data.firstName.isEmpty {
                                
                            ErrorText(errorText: "First Name cannot be empty.", screenHeight: screenHeight, screenWidth: screenWidth)
                                
                        }
                                
                        else if firestoreQuery.data.lastName.isEmpty {
                                    
                            ErrorText(errorText: "Last Name cannot be empty.", screenHeight: screenHeight, screenWidth: screenWidth)
                                    
                        }
                                
                        else if firestoreQuery.data.username.isEmpty {
                                    
                            ErrorText(errorText: "Username cannot be empty.", screenHeight: screenHeight, screenWidth: screenWidth)
                                    
                        }
                                
                    }

                    Button(action: {
                            
                        if !(firestoreQuery.data.firstName.isEmpty || firestoreQuery.data.lastName.isEmpty || firestoreQuery.data.username.isEmpty) {
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                buttonPressed = true
                            }
                                
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                                buttonPressed = false
                            }
                        }
                            
                    }, label: {
                            
                         Text("Save")
                             .font(.title3)
                             .fontWeight(.bold)
                             .foregroundColor(Color.white)
                             .padding(screenWidth / 30)
                             .padding(.horizontal, screenWidth / 12)
                             .background(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                             .cornerRadius(screenWidth / 15)
                             .multilineTextAlignment(.center)
                             .padding()
                        
                    })
                }
            }
        .onAppear{ async{ await NetworkingCall() } }
        }
    func NetworkingCall() async{
    await firestoreQuery.getUser_await()
    print(firestoreQuery.data.featured)
    print("AFTER get data in home")    }
}

/*struct ProfileSettingBody_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettingBody(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}*/
