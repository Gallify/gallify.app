//
//  FirebaseStorageHelper.swift
//  Gallify
//
//  Created by Tejvir Mann on 2/22/22.
//

import Foundation
import Firebase


class FirebaseStorageHelper {
    static private let cloudStorage = Storage.storage()
    
    class func asyncDownloadToFilesystem(relativePath: String, handler: @escaping (_ fileURL: URL) -> Void) {
        let docsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        

        print(relativePath)
        let fileUrl = docsUrl.appendingPathComponent(relativePath)
         
        if FileManager.default.fileExists(atPath: fileUrl.path) {
            handler(fileUrl)
            return
        }
        
        let storageRef = cloudStorage.reference(withPath: relativePath)
        //let storageRef = cloudStorage.reference(forURL: "https://firebasestorage.googleapis.com/v0/b/gallify-64bbb.appspot.com/o/images%252Ftoy_biplane.usdz")
        
        storageRef.write(toFile: fileUrl) { url, error in
            guard let localUrl = url else {
                print("Firebase Storage: Error downloading file: \(relativePath)")
                return
            }
            handler(localUrl)
        }.resume()
    }
}
