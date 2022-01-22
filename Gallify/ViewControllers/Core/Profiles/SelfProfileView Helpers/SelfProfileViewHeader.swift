//
//  SelfProfileViewHeader.swift
//  Gallify
//
//  Created by Anshul on 9/13/21.
//
import SwiftUI

struct SelfProfileViewHeader: View {
    
    @EnvironmentObject var viewModel: TabBarViewModel
    @EnvironmentObject var firestoreQuery: FirestoreQuery
    
    var body: some View {
        
        let screenHeight = viewModel.screenHeight
        let screenWidth = viewModel.screenWidth
        
       // NavigationView{
            HStack {
                
                Spacer()
                
                /*Text("\(firestoreQuery.data.username)")
                    .font(.system(size: screenWidth / 17, weight: .bold))
                    .padding(.leading, screenWidth / 9.4)*/
                
                Text("i_am_here")
                    .font(.system(size: screenWidth / 17, weight: .bold))
                    .padding(.leading, screenWidth / 9.4)
                
                Spacer()
                
                
                NavigationLink(
                    destination: SettingsView(),
                    label: {
                            
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .foregroundColor(.gray)
                            .frame(width: screenWidth / 15, height: screenHeight / 32.5)
                            .padding(.trailing, screenWidth / 25)
                            
                })
                .navigationBarHidden(true)
                 
            }
            .padding(.top, screenHeight / 54)
    
        
   // }
    }
    
}

struct SelfProfileViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        SelfProfileViewHeader()
            .environmentObject(TabBarViewModel())
            .environmentObject(FirestoreQuery())
    }
}

