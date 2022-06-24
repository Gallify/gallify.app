//
//  saveView.swift
//  Gallify
//
//  Created by Tejvir Mann on 5/28/22.
//

import SwiftUI
import Foundation
import CoreLocation
import Combine
import SDWebImageSwiftUI


struct SaveView: View {


    @EnvironmentObject var firestoreQuery : FirestoreQuery
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width

    var body: some View {
        Text("Save gallery via image.")
            .font(Font.headline.weight(.semibold))

    }
}
