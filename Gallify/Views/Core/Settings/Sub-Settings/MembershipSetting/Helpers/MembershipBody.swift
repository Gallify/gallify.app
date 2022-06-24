//
//  MainSettingsViewHeader.swift
//  Gallify
//
//  Created by Gianluca Profio on 1/23/22.
//

import SwiftUI

struct MembershipBody: View {
    
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            
//            HStack {
//
//                CustomBackButton(buttonHeight: screenHeight / 19.5, buttonWidth: screenWidth / 9, image: Image(systemName: "chevron.left.circle"), presentationMode: _presentationMode)
//                    .padding(.horizontal, screenWidth / 25)
//                    .padding(.vertical, screenHeight / 100)
//
//                Spacer()
//
//            }
            
            HStack {
                        
                    
                    Group {
                        Text("To report any bugs or wrongful content, please email us at")
                            .font(.system(size: screenWidth / 29))
                            .foregroundColor(.gray) +
                        Text(" info@gallify.app")
                            .font(.system(size: screenWidth / 29))
                            .foregroundColor(.blue)
                    }
                        
                    
                    Spacer()

                        
            }
            .padding(.leading, screenWidth / 12)
            .padding(.bottom, screenHeight / 32.5)
            
            HStack {
                
//                Text("You can also contact us on Discord!")
//                    .font(.system(size: screenWidth / 29))
//                    .foregroundColor(.gray)
//
                Button(action: {
                    if let url = URL(string: "https://discord.com/invite/55DMTfkcA2") {
                       UIApplication.shared.open(url)
                    }
                }) {

                    Text("Discord")
                        
                        .font(.system(size: screenWidth / 18.5, weight: .bold))
                        .foregroundColor(Color(.white))
                        .padding(.horizontal, 40)
                        .padding(.vertical, screenHeight / 80)
                        .background(Color(.black))
                        .cornerRadius(20)
                }

                        
            }
//            .padding(.leading, screenWidth / 12)
            .padding(.bottom, screenHeight / 32.5)
            
        }
        .padding(.top, screenHeight / 160)
    }
}

//struct MembershipSettingHeader_Previews: PreviewProvider {
//    static var previews: some View {
//        MembershipSettingHeader(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
//    }
//}
