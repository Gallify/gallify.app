//
//  ProfileSignIn.swift
//  Gallify. If entered in as guest, prompts user to sign in via metamask.
//
//  Created by Tejvir Mann on 5/29/22.
//

import SwiftUI
import Firebase
import UIKit
import WalletConnectSwift



struct ProfileSignIn: View {

    
//    @EnvironmentObject var viewModel = LoginAppViewModel()
//    let auth = Auth.auth()
    
    var body: some View {
        
                
        Text("Want to sign in? Don't have an account?")
           
//        NavigationView {
//
//                let screenHeight = viewModel.screenHeight
//                let screenWidth = viewModel.screenWidth
//
//
//                    VStack {
//
//
//
//                        Text("Want to sign in? Don't have an account?")
//                            .font(Font.headline.weight(.semibold))
//
//                        NavigationLink(destination: CreateAccountView(), isActive: ($viewModel.createDoc)){}
//
//
//
//                            HStack {
//
//
//                                Button(action:
//                                    {
//                                    viewModel.userData.token = ""
//
//                                    let connectionUrl = viewModel.walletConnect.connect()
//
//                                    /// https://docs.walletconnect.org/mobile-linking#for-ios
//                                    /// **NOTE**: Majority of wallets support universal links that you should normally use in production application
//                                    /// Here deep link provided for integration with server test app only
//                                    let deepLinkUrl = "metamask://wc?uri=\(connectionUrl)"
//
//                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                                        if let url = URL(string: deepLinkUrl), UIApplication.shared.canOpenURL(url) {
//                                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
//                                        }
//                                        else{
//                                            print("Didn't open wallet app.")
//                                        }
//                                    }
//
//                                    DispatchQueue.main.async {
//                                        viewModel.semaphore_WalletConnect = true
//                                    }
//
//
//                                }) {
//
//                                    ZStack {
//                                        Text("                                             ")
//
//                                            .font(.system(size: screenWidth / 18.5, weight: .bold))
//                                            .foregroundColor(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
//                                            .padding(.horizontal, 40)
//                                            .padding(.vertical, screenHeight / 80)
//                                            .background(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
//                                            .cornerRadius(20)
//                                            //.padding(.horizontal, screenWidth / 30)
//                                            //.padding(.vertical, screenHeight / 65)
//
//                                        Image("metamask")
//                                            .resizable()
//                                            .frame(width: 25.0, height: 25.0)
//                                            .padding(.trailing, screenWidth/2.2)
//
//                                        Text("Connect Wallet")
//
//                                            .font(.system(size: screenWidth / 18.5, weight: .medium))
//                                            .foregroundColor(Color.white)
//                                            .padding(.leading, 10)
//                                            .padding(.vertical, screenHeight / 75)
//            //                                .background(Color.primary)
//                                            .cornerRadius(screenWidth / 20)
//                                            //.padding(.horizontal, screenWidth / 30)
//                                            .padding(.vertical, screenHeight / 65)
//                                        }
//                                }
//                            }
//
//
//                    }
//                    .padding(.bottom, screenHeight / 65)
//
//
//
//            }
           
//            .navigationBarHidden(true)
//            .environmentObject(viewModel)
            
        
        
//        }.onAppear{
//            viewModel.issignedin()
//        }
        
    }
    
    
    func NetworkingCall() async {
        
    }
}
    


    


//struct Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}

