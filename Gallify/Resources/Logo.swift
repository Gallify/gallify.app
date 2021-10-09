//
//  Logo.swift
//  GallifyLogin
//
//  Created by Jade Lee on 7/13/21.
//
import SwiftUI

struct Logo: View {
    var body: some View {
        Image("logo")
            .resizable()
            .frame(width: UIScreen.main.bounds.width / 1.45, height: UIScreen.main.bounds.width / 1.4)
    }
}

struct Logo_Previews: PreviewProvider {
    static var previews: some View {
        Logo()
    }
}
