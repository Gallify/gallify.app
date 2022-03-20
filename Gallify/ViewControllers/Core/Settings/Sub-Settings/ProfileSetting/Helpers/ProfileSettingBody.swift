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
    
    @State var newUsername = ""
    @State var newFirstName = ""
    @State var newLastName = ""
    @State var description = ""
    @State var profileImageUpdate = false
    
//    @EnvironmentObject var viewModel : LoginAppViewModel
    @State var pickedImage: UIImage?
    @State var showActionSheet = false
    @State var showImagePicker = false
    @State var sourceType : UIImagePickerController.SourceType = .photoLibrary
//    @EnvironmentObject var settingsViewModel : ProfileSetting
//    private var metadata = StorageMetadata()
    
    var body: some View {
        
        VStack {
            VStack {
                HStack{
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
                                profileImageUpdate = true
                            }),
                            //Button2
                            .default(Text("Photo Library"), action: {
                                self.showImagePicker = true
                                self.sourceType = .photoLibrary
                                profileImageUpdate = true
                            }),
                            
                            //Button3
                            .cancel()
                            
                        ])
                    }.sheet(isPresented: $showImagePicker){
                        imagePicker(image: self.$pickedImage, showImagePicker: self.$showImagePicker, sourceType: self.sourceType)
                    }
                
//                    Button(action: {
//                        StorageService.saveProfileImage(uid: firestoreQuery.data.uid, imageData:self.pickedImage!.jpegData(compressionQuality: 0.5) ?? Data(), metaData: metadata)
//                    }, label: {
//                        Text("Save")
//                            .frame(width: 200, height: 50)
//                            .background(Color.blue)
//                            .foregroundColor(Color.white)
//                            .padding()
//                    })
//                    Spacer()
                }
            }
                
                //Taking out the formatter parameter because I need text: instead of value: -- Shruti
                VStack {
                    HStack {
                        Text("First Name")
                            .padding(.leading)
                        Spacer()
                    }
                    TextField(firestoreQuery.data.firstName, text: $newFirstName)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .textFieldStyle(OvalTextFieldStyle(screenHeight: screenHeight, screenWidth: screenWidth))
                        .padding(.horizontal, screenWidth / 15)
                    HStack {
                        Text("Last Name")
                            .padding(.leading)
                        Spacer()
                    }
                    TextField(firestoreQuery.data.lastName, text: $newLastName)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .textFieldStyle(OvalTextFieldStyle(screenHeight: screenHeight, screenWidth: screenWidth))
                        .padding(.horizontal, screenWidth / 15)
                    HStack {
                        Text("Username")
                            .padding(.leading)
                        Spacer()
                    }
                    TextField(firestoreQuery.data.username, text: $newUsername)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .textFieldStyle(OvalTextFieldStyle(screenHeight: screenHeight, screenWidth: screenWidth))
                        .padding(.horizontal, screenWidth / 15)
                    
                    Spacer()
                    
                    HStack {
                        Text("Enter your bio")
                            .padding(.leading)
                        Spacer()
                    }
                    TextField(firestoreQuery.data.description, text: $description)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .textFieldStyle(OvalTextFieldStyle(screenHeight: screenHeight, screenWidth: screenWidth))
                        .padding(.horizontal, screenWidth / 15)
                    
                    if buttonPressed {
                                
//                        if firestoreQuery.data.firstName.isEmpty {
//
//                            ErrorText(errorText: "First Name cannot be empty.", screenHeight: screenHeight, screenWidth: screenWidth)
//
//                        }
//
//                        else if firestoreQuery.data.lastName.isEmpty {
//
//                            ErrorText(errorText: "Last Name cannot be empty.", screenHeight: screenHeight, screenWidth: screenWidth)
//
//                        }
//
//                        else if firestoreQuery.data.username.isEmpty {
//
//                            ErrorText(errorText: "Username cannot be empty.", screenHeight: screenHeight, screenWidth: screenWidth)
//
//                        }
                        if(newUsername.isEmpty && newFirstName.isEmpty && newLastName.isEmpty && description.isEmpty && profileImageUpdate == false) {
                            ErrorText(errorText: "Please fill out one of the fields above", screenHeight: screenHeight, screenWidth: screenWidth)
                        }
                        
                                
                    }
                }
                VStack{
                    Button(action: {
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            buttonPressed = true
                        }
                            
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                            buttonPressed = false
                        }
                            
                        if (!newUsername.isEmpty) {
                                
                            Task {
                               await firestoreQuery.updateUsername(username: newUsername)
                            }
                                                        
                        }
                        if(!newFirstName.isEmpty){
                            
                            Task {
                                await firestoreQuery.updatefirstName(first: newFirstName)
                            }
                        }
                        if(!newLastName.isEmpty){
                            Task {
                                await firestoreQuery.updateLastName(last: newLastName)
                            }
                        }
                        if(!description.isEmpty){
                            Task {
                                await firestoreQuery.updateUserDescription(desc: description)
                            }
                        }
                        if(profileImageUpdate == true){
                            Task {
                                await firestoreQuery.updateProfileImage(image: self.pickedImage!.jpegData(compressionQuality: 0.5) ?? Data())
                            }
                        }
                        Task {
                            await firestoreQuery.getUser_await()
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
//                             .onTapGesture {
//                                 UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//                             }
                        
                    })
                }
            }
        .onAppear{ async{ await NetworkingCall() } }
        }
    
    func NetworkingCall() async{
        await firestoreQuery.getUser_await()
        print(firestoreQuery.data.featured)
        print("AFTER get data in home")
        
    }
}

/*struct ProfileSettingBody_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettingBody(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}*/
