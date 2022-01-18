//
//  CacheManager.swift
//  Gallify
//
//  Created by Shruti Sharma on 12/20/21.
//

import Foundation
import SDWebImageSwiftUI
import SwiftUI

class ImageCache {
     
//    static let instance = ImageCache()
//    private init() {}
    
    var imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100 //100mb
        return cache
    }()
    
    func add(image: UIImage, name: String) {
        imageCache.setObject(image, forKey: name as NSString)
    }
    
    func remove(name: String) {
        imageCache.removeObject(forKey: name as NSString)
    }
    
    func get(forKey: String) -> UIImage? {
            return imageCache.object(forKey: NSString(string: forKey))
        }
        
    func set(forKey: String, image: UIImage) {
        imageCache.setObject(image, forKey: NSString(string: forKey))
    }
    
}

extension ImageCache {
    private static var imageCache = ImageCache()
    static func getImageCache() -> ImageCache {
        return imageCache
    }
}
