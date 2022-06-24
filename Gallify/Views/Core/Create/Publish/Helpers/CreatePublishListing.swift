//
//  CreateViewPublishListing.swift
//  Gallify
//
//  Created by Gianluca Profio on 10/31/21.
//

import SwiftUI

struct CreatePublishListing: View {
    
    @State private var listingName: String = ""
    @State private var listingTags: String = ""
    @State private var listingQuantity: Double = 0
    @State private var listingRoyalities: Double = 0
    @State private var listingPrice: Double = 0
    @State private var listingDescription: String = ""

    
    let screenWidth: CGFloat
    let screenHeight: CGFloat

    var body: some View {
        ScrollView {
            
        Image("raging-bull")
            .resizable()
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            .frame(width: screenWidth / 1, height: screenWidth / 1)
            .padding()
        
        VStack {
            HStack{
                Text("Name")
                Spacer()
            }
            .padding(.horizontal, screenWidth / 15)
            
            TextField("Gallify", text: $listingName)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .textFieldStyle(OvalTextFieldStyle(screenHeight: screenHeight, screenWidth: screenWidth))
                .padding(.horizontal, screenWidth / 15)
            
        }
        
        
        
        VStack {
            HStack{
                Text("Tags")
                Spacer()
            }
            .padding(.horizontal, screenWidth / 15)

            TextField("Metaverse, AR, VR, NFT, Ethereum", text: $listingTags)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .textFieldStyle(OvalTextFieldStyle(screenHeight: screenHeight, screenWidth: screenWidth))
                .padding(.horizontal, screenWidth / 15)
        }
            
        
        
        VStack {
            HStack{
                Text("Quantity:  0 (Public) - 100")
                Spacer()
            }
            .padding(.horizontal, screenWidth / 15)

            TextField("", value: $listingQuantity, formatter: NumberFormatter())
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .textFieldStyle(OvalTextFieldStyle(screenHeight: screenHeight, screenWidth: screenWidth))
                .padding(.horizontal, screenWidth / 15)
        }
        
        
            
        VStack {
            HStack{
                Text("Royalities (%)")
                Spacer()
            }
            .padding(.horizontal, screenWidth / 15)

            TextField("", value: $listingRoyalities, formatter: NumberFormatter())
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .textFieldStyle(OvalTextFieldStyle(screenHeight: screenHeight, screenWidth: screenWidth))
                .padding(.horizontal, screenWidth / 15)
        }
        
        
            
        VStack{
            HStack{
                Text("Price ($)")
                Spacer()
            }
            .padding(.horizontal, screenWidth / 15)

            TextField("", value: $listingQuantity, formatter: NumberFormatter())
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .textFieldStyle(OvalTextFieldStyle(screenHeight: screenHeight, screenWidth: screenWidth))
                .padding(.horizontal, screenWidth / 15)
        }
        
        
            
        VStack {
            HStack{
                Text("Description")
                Spacer()
            }
            .padding(.horizontal, screenWidth / 15)

            TextField("Changing the Art World, Forever.", text: $listingDescription)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .textFieldStyle(OvalTextFieldStyle(screenHeight: screenHeight, screenWidth: screenWidth))
        }
            
            NavigationLink(
                destination: TabBarView(),
                label: {
                    
                    HStack{
                        
                        Text("Publish")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding(screenWidth / 30)
                            .padding(.horizontal, screenWidth / 12)
                            .background(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                            .cornerRadius(screenWidth / 15)
                        
                    }
                    .padding()
                    
                })
                .buttonStyle(ThemeAnimationStyle())
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
    }
}

struct CreatePublishListing_Previews: PreviewProvider {
    static var previews: some View {
        CreatePublishListing(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}
