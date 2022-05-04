//
//  LoginViewNavLinks.swift
//  Gallify
//
//  Created by Anshul on 10/1/21.
//
import SwiftUI
import WalletConnectSwift


struct LoginViewNavLinks: View {
    
    
    @EnvironmentObject var viewModel: LoginAppViewModel
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
        VStack {
            
            NavigationLink(destination: SignInView(),
                            label: {
                
            
                HStack {
                    
                    Text("Sign In")
                        
                        .font(.system(size: screenWidth / 18.5, weight: .bold))
                        .foregroundColor(Color.white)
                        .padding(.horizontal, screenWidth / 3)
                        .padding(.vertical, screenHeight / 75)
                        .background(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                        .cornerRadius(screenWidth / 10)
                        
                        .padding(.horizontal, screenWidth / 30)
                        .padding(.vertical, screenHeight / 65)

                    
                }
                
                    
                
            })
            .navigationBarHidden(true)
            
            
            NavigationLink(destination: CreateAccountView(),
                           label: {
                
                Text("Create Account")
                    .font(.system(size: screenWidth / 18.5, weight: .bold))
                    .foregroundColor(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                    .padding(.horizontal, screenWidth / 30)
                    .padding(.vertical, screenHeight / 65)
                
            })
            .navigationBarHidden(true)
            
      
            
                HStack {
                    
                    Button(action:
                        {
                        
                        let connectionUrl = viewModel.walletConnect.connect()

                        /// https://docs.walletconnect.org/mobile-linking#for-ios
                        /// **NOTE**: Majority of wallets support universal links that you should normally use in production application
                        /// Here deep link provided for integration with server test app only
                        let deepLinkUrl = "metamask://wc?uri=\(connectionUrl)"

                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            if let url = URL(string: deepLinkUrl), UIApplication.shared.canOpenURL(url) {
                                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            }
                            else{
                                print("Didn't open wallet app.")
                            }
                        }
                        
                    }) {

                        Text("CW")
                            
                            .font(.system(size: screenWidth / 18.5, weight: .bold))
                            .foregroundColor(Color.white)
                            .padding(.horizontal, screenWidth / 3)
                            .padding(.vertical, screenHeight / 75)
                            .background(Color.primary)
                            .cornerRadius(screenWidth / 10)
                            .padding(.horizontal, screenWidth / 30)
                            .padding(.vertical, screenHeight / 65)

                    }
                }

            
            HStack {
                
                Button(action:
                    {
                    guard let session = viewModel.walletConnect.session else { return }

                    for session in viewModel.walletConnect.client.openSessions() {
                        try? viewModel.walletConnect.client.disconnect(from: session)
                    }
                    
                    
                    //sign out
                    
                }) {

                    Text("DW")
                        
                        .font(.system(size: screenWidth / 18.5, weight: .bold))
                        .foregroundColor(Color.white)
                        .padding(.horizontal, screenWidth / 3)
                        .padding(.vertical, screenHeight / 75)
                        .background(Color.primary)
                        .cornerRadius(screenWidth / 10)
                        .padding(.horizontal, screenWidth / 30)
                        .padding(.vertical, screenHeight / 65)

                }
            }
                
                    

            
            
            
            
            
        }
        .padding(.bottom, screenHeight / 65)
        
    }
    
}

struct LoginViewNavLinks_Previews: PreviewProvider {
    static var previews: some View {
        LoginViewNavLinks().environmentObject(LoginAppViewModel())
    }
}
