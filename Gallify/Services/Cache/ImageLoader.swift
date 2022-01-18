//
//  ImageLoader.swift
//  Gallify
//
//  Created by Shruti Sharma on 12/20/21.
//

import Foundation
import SDWebImageSwiftUI

class ImageLoader: ObservableObject {
    let url: String?
    
    @Published var image: WebImage? = nil
    @Published var errorMessage: String? = nil
    @Published var isLoading: Bool = false
    
    init(url: String?) {
        self.url = url
    }
    
    func fetchImage() {
        guard let url = url, let fetchURL = URL(string: url) else {
            return
        }
        isLoading = true
        let task = URLSession.shared.dataTask(with: fetchURL) {[unowned self](data,response,error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error = \(error.localizedDescription)")
                }
            }
            
        }
    }
}
