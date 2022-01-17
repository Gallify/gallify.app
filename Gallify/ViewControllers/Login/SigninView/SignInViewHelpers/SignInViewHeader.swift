//
//  SignInViewHeader.swift
//  Gallify
//
//  Created by Anshul on 10/1/21.
//
import SwiftUI

struct SignInViewHeader: View {
    
    let screenHeight: CGFloat
    let screenWidth: CGFloat
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
            
        VStack {
            
            HStack {
                
                CustomBackButton(buttonHeight: screenHeight / 32.5, buttonWidth: screenWidth / 15, image: Image(systemName: "chevron.left.circle"), presentationMode: _presentationMode)
                    .padding(.horizontal, screenWidth / 25)
                    .padding(.vertical, screenHeight / 100)
                
                Spacer()
                
            }
            
            HStack {
                        
                Text("Sign in to Gallify")
                    .font(.system(size: screenWidth / 12.5, weight: .semibold))
                        
                Spacer()
                        
            }
            .padding(.leading, screenWidth / 12)
            .padding(.bottom, screenHeight / 32.5)
            
        }
        
        /*HStack {
                
            CustomBackButton(buttonHeight: screenHeight / 32.5, buttonWidth: screenWidth / 15, image: Image(systemName: "chevron.left.circle"), presentationMode: _presentationMode)
                .padding(.horizontal, screenWidth / 25)
                .padding(.vertical, screenHeight / 100)
                
            Spacer()
                
            Text("Sign in to Gallify")
                .font(.system(size: screenWidth / 12.5, weight: .semibold))
                .padding(.trailing, screenWidth / 7.5)
                
            Spacer()
                
        }
        .padding(.top, screenHeight / 160)
        .padding(.bottom, screenHeight / 32.5)*/
        
    }
    
}

struct SignInViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        SignInViewHeader(screenHeight: UIScreen.main.bounds.height, screenWidth: UIScreen.main.bounds.width)
    }
}
