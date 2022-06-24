//
//  ProfileSettingBody.swift
//  Gallify
//
//  Created by Gianluca Profio on 1/23/22.
//

import SwiftUI

struct AccountSettingBody: View {
    
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
                
                HStack {
                    Text("Email")
                        .padding(.leading)
                    Spacer()
                }
                
                VStack {
                    TextField("johnbrown@gmail.com", value: $firestoreQuery.data.email, formatter: NumberFormatter())
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .textFieldStyle(OvalTextFieldStyle(screenHeight: screenHeight, screenWidth: screenWidth))
                        .padding(.horizontal, screenWidth / 15)
                    
                    
                HStack {
                    Text("Phone #")
                        .padding(.leading)
                    Spacer()
                }
                
                TextField("6088073884", value: $firestoreQuery.data.phoneNumber, formatter: NumberFormatter())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .textFieldStyle(OvalTextFieldStyle(screenHeight: screenHeight, screenWidth: screenWidth))
                    .padding(.horizontal, screenWidth / 15)
                
                
                HStack {
                    Text("Location")
                        .padding(.leading)
                    Spacer()
                }
                
                TextField("Madison, WI", value: $firestoreQuery.data.location, formatter: NumberFormatter())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .textFieldStyle(OvalTextFieldStyle(screenHeight: screenHeight, screenWidth: screenWidth))
                    .padding(.horizontal, screenWidth / 15)
                
                
                HStack {
                    Text("Wallet ID")
                        .padding(.leading)
                    Spacer()
                }
                
                TextField("0x1232348w7er98dfguv98sd", value: $firestoreQuery.data.wallet, formatter: NumberFormatter())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .textFieldStyle(OvalTextFieldStyle(screenHeight: screenHeight, screenWidth: screenWidth))
                    .padding(.horizontal, screenWidth / 15)
                
                if buttonPressed {
                            
                    if firestoreQuery.data.email.isEmpty {
                            
                        ErrorText(errorText: "First Name cannot be empty.", screenHeight: screenHeight, screenWidth: screenWidth)
                            
                    }
                            
                    else if firestoreQuery.data.phoneNumber.isEmpty {
                                
                        ErrorText(errorText: "Last Name cannot be empty.", screenHeight: screenHeight, screenWidth: screenWidth)
                                
                    }
                            
                    else if firestoreQuery.data.location.isEmpty {
                                
                        ErrorText(errorText: "Username cannot be empty.", screenHeight: screenHeight, screenWidth: screenWidth)
                                
                    }
                    
                    else if firestoreQuery.data.wallet.isEmpty {
                                
                        ErrorText(errorText: "Username cannot be empty.", screenHeight: screenHeight, screenWidth: screenWidth)
                                
                    }
                            
                }
                
                Button(action: {
                        
                    if !(firestoreQuery.data.email.isEmpty || firestoreQuery.data.phoneNumber.isEmpty || firestoreQuery.data.location.isEmpty || firestoreQuery.data.wallet.isEmpty) {
                        
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

/*struct AccountSettingBody_Previews: PreviewProvider {
    static var previews: some View {
        AccountSettingBody(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}*/
