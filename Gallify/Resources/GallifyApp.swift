//
//  GallifyLoginApp.swift
//  Shared
//
//  Created by Shruti Sharma on 8/15/21.
//

import SwiftUI
import Firebase

@main
struct GallifyLoginApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var firestoreQuery = FirestoreQuery()
    
    
    
    var body: some Scene {
        WindowGroup {
            
            
            let viewModel = LoginAppViewModel()
            
            if (viewModel.isSignedIn){

                TabBarView()
                    .environmentObject(firestoreQuery)
                    .environmentObject(viewModel)

            }
            else{
                LoginView()
                    .environmentObject(viewModel)
                    .environmentObject(firestoreQuery)
            }
        
            
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        
        return true
    }
}
