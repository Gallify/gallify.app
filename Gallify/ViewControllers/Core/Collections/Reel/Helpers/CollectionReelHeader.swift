//
//  ExpandedHeader.swift
//  Gallify
//
//  Created by Gianluca Profio on 9/26/21.
//

import SwiftUI
import RealityKit
import UIKit
import ARKit

class collection2: UIViewController, ObservableObject, ARSessionDelegate {
//
//    @IBAction func showplayer(_ sender: Any){
//        let test = ARPlayerViewController()
//        navigationController?pushViewController(test, animated: true)
//    }
    //@IBOutlet weak var showPlayer: UIButton!
    
//    @IBAction func ar(_ sender: UIButton) {
//        navigationController?.pushViewController(ARPlayerViewController(), animated: true)
//    }
    
//    var name: String = ""
//    func updatename (_name : String){
//        self.name = "nae"
//    }
}


struct SwiftUIView: View {
    var body: some View {
        SwiftUIViewController()
    }
}

struct CollectionReelHeader: View {
    
    @EnvironmentObject var viewModel: collection2
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>


    let screenWidth: CGFloat
    let screenHeight: CGFloat
    
    var body: some View {
        HStack {
            
            CustomBackButton(buttonHeight: screenHeight / 21.08, buttonWidth: screenWidth / 9.73, image: Image(systemName: "chevron.down.circle"), presentationMode: _presentationMode)
                .padding(.horizontal, screenWidth / 25)
                .padding(.vertical, screenHeight / 100)
            
            Spacer()
            

            NavigationLink (
                destination: SwiftUIView().edgesIgnoringSafeArea(.all),
                label: {
                Image (systemName: "arkit")
                    .resizable()
                    .foregroundColor(Color.black)
                    .frame(width: screenWidth / 10, height: screenWidth / 10)
                    .padding(.trailing, screenWidth / 30)
                    .animation(.easeInOut)
                })
                .buttonStyle(ThemeAnimationStyle())
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle("")
                .navigationBarHidden(true)
            
           
       //     Spacer() //added
            

        }
        
        
        
    }
}

struct CollectionReelHeader_Previews: PreviewProvider {
    static var previews: some View {
        CollectionReelHeader(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}


