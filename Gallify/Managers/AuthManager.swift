//
//  AuthManager.swift
//  Gallify
//
//  Created by Tejvir Mann on 8/18/21.
//

import FirebaseAuth
import Foundation

final class AuthManager {
    static let shared = AuthManager()
    
    private init(){}
        
    let auth = Auth.auth()
    
//    var isSignedIn: Bool {
//        return auth.currentUser != nil
//    }
    
    var isSignedIn: Bool{
            if FirebaseAuth.Auth.auth().currentUser != nil{
                return false
            }
            else{
                return false //then would have to log in.
            }
    }
    
}
