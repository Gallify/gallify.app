//
//  ReelNames.swift
//  Gallify
//
//  Created by Tejvir 06/3/22
//
import SwiftUI

struct CollectionReelNames: View {
    
    let artwork: Art
    let screenWidth: CGFloat
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        

        Text("\(artwork.name)")
            .font(.system(size: screenWidth / 17).bold())


        NavigationLink ( destination: OtherProfileView(otherUserId: artwork.creatorId),
        label: {
            Text("\(artwork.creator)")
                .font(.system(size: screenWidth / 27))
                .foregroundColor(Color(.black))

        })

    }
    
}


