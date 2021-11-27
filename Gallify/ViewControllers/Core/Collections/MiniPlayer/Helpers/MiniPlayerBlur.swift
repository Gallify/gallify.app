//
//  MiniPlayerBlur.swift
//  Gallify
//
//  Created by Gianluca Profio on 11/27/21.
//

import SwiftUI

struct MiniPlayerBlur: UIViewRepresentable {

    func makeUIView(context: Context) -> UIVisualEffectView {
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterial))
        
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
}
