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
    var body: some Scene {
        WindowGroup {
            let viewModel = LoginAppViewModel()
            LoginView().environmentObject(viewModel)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()


        return true
    }
}
