//
//  SwiftUIView.swift
//  Gallify
//
//  Created by Gianluca Profio on 9/26/21.
//

import SwiftUI

struct CollectionLikedHeader: View {
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    var body: some View {
        
        ZStack{
            
            HStack{
                
                Spacer()
                                        
                    Text("Liked")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                
                Spacer()
                
                
            }
            
            HStack{
                CustomBackButton(buttonHeight: 25.45, buttonWidth: 15, image: Image(systemName: "chevron.left"), presentationMode: _presentationMode)
                      .offset(x: 15)
                      .font(Font.title.weight(.light))
                
                Spacer()
            }
        }
    }
}

struct CollectionLikedHeader_Previews: PreviewProvider {
    static var previews: some View {
        CollectionLikedHeader(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}

