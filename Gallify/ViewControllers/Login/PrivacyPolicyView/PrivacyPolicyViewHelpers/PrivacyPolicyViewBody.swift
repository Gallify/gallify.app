//
//  PrivacyPolicyViewBody.swift
//  Gallify
//
//  Created by Anshul on 10/10/21.
//
import SwiftUI
import Firebase

struct PrivacyPolicyViewBody: View {
    
    let password: String
    
    @EnvironmentObject var user: User
    @EnvironmentObject var viewModel: LoginAppViewModel
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        ScrollView(showsIndicators: false) {
            
            VStack{
                
                HStack {
                    
                    Group {
                        Text("An email has been sent to ")
                            .font(.system(size: screenWidth / 29))
                            .foregroundColor(.gray) +
                        Text(user.email)
                            .font(.system(size: screenWidth / 29))
                            .foregroundColor(.blue) +
                        Text(" to verify your account.")
                            .font(.system(size: screenWidth / 29))
                            .foregroundColor(.gray)
                    }
                        
                    
                    Spacer()

                }
                .padding(.leading, screenWidth / 12)
                .padding(.bottom, screenHeight / 160)
                
//                HStack {
//
//                    Text("Didn't get an email? ")
//                        .font(.system(size: screenWidth / 29))
//                        .foregroundColor(.gray)
////                        .font(.system(size: screenWidth / 22))
////                        .padding(.leading, screenWidth / 12)
//
//                    Button(action: {
//                        viewModel.sendVerificationEmail()
//
//                    }) {
//                        Text("Resend Email")
//                            .font(.system(size: screenWidth / 29))
//                            .foregroundColor(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
//                            .padding(.leading, -screenWidth / 50)
//                            .onTapGesture {
//                                let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
//                                impactHeavy.impactOccurred()
//                            }
//                    }
//
//                    Spacer()
//
//                }
//                .padding(.leading, screenWidth / 12)
//                .padding(.bottom, screenHeight / 160)
                
                
                HStack{
                    Button(action:
                        {
                     
                        Task{

//                            //reload current user
//                            await viewModel.reloadUser()
//
//                            //checks if user is verified. Result stored in viewModel.userVerified
//                            let value = await viewModel.isVerified()
//
//                            if(viewModel.userVerified){
//                                await viewModel.createUserDocument(password: password, user: user) //creates user document
//                                await viewModel.createUserData(password: password, user: user) //adds data to user document
//                            }
                            
                            
//                            if(viewModel.signedIn){
//                                if(viewModel.documentCreated == false){
//                                    await viewModel.createUserDocument(password: password, user: user) //creates user document
//                                    await viewModel.createUserData(password: password, user: user) //adds data to user document
//                                }
//                            }
                                
                            
                        }

                    }) {

                        Text("Create Account")
                            .font(.system(size: screenWidth / 18.5, weight: .bold))
                            .foregroundColor(Color.white)
                            .padding(.horizontal, screenWidth / 8.5)
                            .padding(.vertical, screenHeight / 65)
                            .background(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                            .cornerRadius(screenWidth / 15)

                    }
                    .padding(.vertical, screenHeight / 54)

                }
                
                HStack {
                    
                    Button(action: {
                        
                        if let url = URL(string: "https://www.gallify.app/policies") {
                           UIApplication.shared.open(url)
                        }
                        
                    }) {
                        
                        Group {
                            Text("By clicking 'Creating Account' you agree to follow Gallify's ")
                                .font(.system(size: screenWidth / 29))
                                .foregroundColor(.gray) +
                            Text("Rules & Regulations.")
                                .font(.system(size: screenWidth / 29))
                                .foregroundColor(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                        }
                        
                    }
                    
                    Spacer()
                    
                }
                .padding(.leading, screenWidth / 12)
                .padding(.bottom, screenHeight / 160)
                
                
            }
            
        }
        
    }
    
}

struct PrivacyPolicyViewBody_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyViewBody(password: "")
            .environmentObject(User())
            .environmentObject(LoginAppViewModel())
    }
}
