//
//  SwiftUIView.swift
//  Gallify
//
//  Created by Gianluca Profio on 10/23/21.
//

import SwiftUI

struct CollectionGenericView: View {
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        CustomBackButton(buttonHeight: screenHeight / 39, buttonWidth: screenWidth / 18, image: Image(systemName: "lessthan"), presentationMode: _presentationMode)
        
        NavigationView {
            VStack{
                CollectionGenericHeader(screenWidth: screenWidth)
                    .padding()
                ScrollView (showsIndicators: false) {
                    CollectionGenericRow(screenWidth: screenWidth, screenHeight: screenHeight)
                }
                Spacer()
                CollectionGenericFooter(screenWidth: screenWidth, screenHeight: screenHeight)
                
            }
        }
        .navigationBarHidden(true)
        .navigationBarTitle("")
    }
}

struct CollectionGenericView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionGenericView(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}

