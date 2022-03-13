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
            
//            VStack {
//
//                HStack {
//
//                    Text("ACCEPTANCE OF THIS PRIVACY POLICY")
//                        .font(.system(size: screenWidth / 22, weight: .bold))
//
//                    Spacer()
//
//                }
//                .padding(.leading, screenWidth / 25)
//                .padding(.vertical, screenHeight / 65)
//
//                HStack {
//
//                    Text("By accessing and using our Services, you signify acceptance to the terms of this Privacy Policy. Where we require your consent to process your personal information, we will ask for your consent to the collection, use, and disclosure of your personal information as described further below. We may provide additional 'just-in-time' disclosures or information about the data processing practices of specific Services. These notices may supplement or clarify our privacy practices or may provide you with additional choices about how we process your data.")
//                        .font(.system(size: screenWidth / 21))
//
//                    Spacer()
//
//                }
//                .padding(.horizontal, screenWidth / 25)
//                .padding(.bottom, screenHeight / 54)
//
//                HStack {
//
//                    Text("If you do not agree with or you are not comfortable with any aspect of this Privacy Policy, you should immediately discontinue access or use of our Services.")
//                        .font(.system(size: screenWidth / 21))
//
//                    Spacer()
//
//                }
//                .padding(.horizontal, screenWidth / 25)
//
//                HStack {
//
//                    Text("CHANGES TO THIS PRIVACY POLICY")
//                        .font(.system(size: screenWidth / 22, weight: .bold))
//
//                    Spacer()
//
//                }
//                .padding(.leading, screenWidth / 25)
//                .padding(.vertical, screenHeight / 65)
//
//                HStack {
//
//                    Text("We may modify this Privacy Policy from time to time which will be indicated by changing the date at the top of this page. If we make any material changes, we will notify you by email (sent to the email address specified in your account), by means of a notice on our Services prior to the change becoming effective, or as otherwise required by law.")
//                        .font(.system(size: screenWidth / 21))
//
//                    Spacer()
//
//                }
//                .padding(.horizontal, screenWidth / 25)
//                .padding(.bottom, screenHeight / 54)
//
//                if !(password.isEmpty)
//                {
//
//                    HStack {
//
//                        Text("By clicking \"Create Account\", you agree to Gallify's User Agreement.")
//                            .font(.system(size: screenWidth / 21))
//                            .multilineTextAlignment(.center)
//
//                        Spacer()
//
//                    }
//                    .padding(.horizontal, screenWidth / 25)
//
//
//                    Button(action:
//                        {
//                       // async{ await viewModel.createAccount(password: password, user: user) }
//                        Task{
//                            //new user created in "authentication"
//                            //verification email sent here.
//                            await viewModel.createAccount(password: password, user: user)
//
//                            if(viewModel.isVerified){
//                                //now create a document for them.
//                                await viewModel.createUserDocument(password: password, user: user)
//                            }
//
//                        }
//
//                    }) {
//
//                        Text("Create Account")
//                            .font(.system(size: screenWidth / 18.5, weight: .bold))
//                            .foregroundColor(Color.white)
//                            .padding(.horizontal, screenWidth / 8.5)
//                            .padding(.vertical, screenHeight / 65)
//                            .background(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
//                            .cornerRadius(screenWidth / 15)
//
//                    }
//                    .padding(.vertical, screenHeight / 54)
//
//                }
//
//            }
            VStack{
                HStack {
                    
                    Text("email. Didn't get it? ")
                        .font(.system(size: screenWidth / 22))
                        .padding(.leading, screenWidth / 12)
                    
                    Button(action: {
                        viewModel.sendVerificationEmail()
                        
                    }) {
                        Text("Resend Code")
                            .font(.system(size: screenWidth / 22))
                            .foregroundColor(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                            .padding(.leading, -screenWidth / 50)
                    }
                    
                    Spacer()
                    
                }
                
                HStack{
                    Button(action:
                        {
                     
                        Task{

                            //reload current user
                            await viewModel.reloadUser()
                            
                            //checks if user is verified. Result stored in viewModel.userVerified
                            let value = await viewModel.isVerified()
                            
                            print("value ")
                            print(value)
                            print("user verified? create in")
                            print(viewModel.userVerified)
                            if(viewModel.userVerified){
                                await viewModel.createUserDocument(password: password, user: user) //creates user document
                                await viewModel.createUserData(password: password, user: user) //adds data to user document
                            }
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
