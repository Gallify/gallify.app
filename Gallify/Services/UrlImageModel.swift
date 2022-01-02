//
//  UrlImageModel.swift
//  Gallify
//
//  Created by Shruti Sharma on 12/21/21.
//

import Foundation
import UIKit
import FirebaseAuth

class UrlImageModel: ObservableObject {
    
    @Published var image: UIImage?
    @Published var urlString: String?
    
    init(urlString: String?) {
        self.urlString = urlString
           loadImage()
    }
    
    var imageCache = ImageCache.getImageCache()
    
    func loadImage() {
        if loadImageFromCache() {
            return
        }
        loadImageFromUrl()
    }
    
    
    func loadImageFromUrl() {
           guard let urlString = urlString else {
               return
           }
           
           let url = URL(string: urlString)!
           let task = URLSession.shared.dataTask(with: url, completionHandler: getImageFromResponse(data:response:error:))
           task.resume()
    }
    
    func loadImageFromCache() -> Bool {
        guard let urlString = urlString else {
            return false
        }
        
        guard let cacheImage = imageCache.get(forKey: urlString) else {
            return false
        }
        
        image = cacheImage
        return true
    }

    func getImageFromResponse(data: Data?, response: URLResponse?, error: Error?) {
        guard error == nil else {
            print("Error: \(error!)")
            return
        }
        guard let data = data else {
            print("No data found")
            return
        }
        
        DispatchQueue.main.async {
            guard let loadedImage = UIImage(data: data) else {
                return
            }
            self.image = loadedImage

        }
    }

}
