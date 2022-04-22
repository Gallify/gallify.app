//
//  LoginViewNavLinks.swift
//  Gallify
//
//  Created by Anshul on 10/1/21.
//
import SwiftUI
import WalletConnectSwift


struct LoginViewNavLinks: View, WalletConnectDelegate {
    func failedToConnect() {
        
    }
    
    func didConnect() {
        
    }
    
    func didDisconnect() {
        
    }
    
    
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
                        var connectionUrl = ""
                     //call connect wallet
                        viewModel.walletConnect = WalletConnect(delegate: self)
                        connectionUrl = viewModel.walletConnect.connect()
                        viewModel.walletConnect.reconnectIfNeeded()

                        /// https://docs.walletconnect.org/mobile-linking#for-ios
                        /// **NOTE**: Majority of wallets support universal links that you should normally use in production application
                        /// Here deep link provided for integration with server test app only
                       // let deepLinkUrl = "metamask://wc?uri=\(connectionUrl)"
                        
                        let deepLinkUrl = "wc://wc?uri=\(connectionUrl)"
                        //let deepLinkUrl = "https://metamask.app.link/wc?uri=\(connectionUrl)"
                        
                        print(deepLinkUrl)
//                        if let url = URL(string: "https://metamask.app.link/dapp/https://open.gallify.app/create") {
//                           UIApplication.shared.open(url)
//                        }

                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            if let url = URL(string: deepLinkUrl), UIApplication.shared.canOpenURL(url) {
                                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            }
                        }
                        
                     //call the url. If the wallet address is not empty.
                        
//                        if(connectionUrl != ""){
//                            if(viewModel.walletConnect.session.walletInfo != nil){
//                                print("hi")
//                            }
//                        }
                        

                    //parse the url. If the url is not empty.

                    //sign in with token. Set signed in to true.


                       

                    }) {

                        Text("Connect Wallet")
                            
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
