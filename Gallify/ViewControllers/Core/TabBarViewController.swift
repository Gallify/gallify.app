//
//  TabBarViewController.swift
//  Gallify
//
//  Created by Tejvir Mann on 8/18/21.
//
import UIKit
import SwiftUI
import Firebase

class TabBarViewModel: UITabBarController, ObservableObject {
    
    let screenWidth: CGFloat = UIScreen.main.bounds.width
    let screenHeight: CGFloat = UIScreen.main.bounds.height
    
}

struct TabBarView: View {
    
    @StateObject var firestoreQuery = FirestoreQuery()
    @StateObject var storageService = StorageService()
    @StateObject var viewModel = TabBarViewModel()
    
//    @StateObject var modelsViewModel = ModelsViewModel() //double declared
//    @StateObject var placementSettings = PlacementSettings()
//    @StateObject var modelDeletionManager = ModelDeletionManager()
    
    @EnvironmentObject var loginModel : LoginAppViewModel
    
    @State private var doneLoading = false
    @State var isLoading = false

    
    init() {
        
        UITabBar.appearance().backgroundColor = UIColor.white
        //let valure = firestoreQuery.showNewScreen
        //UITabBar.appearance().isHidden = valure
        
    }
    
    var body: some View {
        
        let screenWidth = viewModel.screenWidth
        let screenHeight = viewModel.screenHeight
        
        ZStack {
                
            //if(firestoreQuery.showNewScreen == false) {
                        
                //Button(action:{
                    //UITabBar.appearance().isHidden = firestoreQuery.showNewScreen
                //}) {
                
            //if firestoreQuery.showNewScreen == false {
            
            TabView {
                
                if doneLoading {
                    
                    HomeView()
                        .tabItem {
                                
                            Label("Home", systemImage: "house.fill")
                                .font(.system(size: screenWidth / 15, weight: .semibold))
                            
                    }
                        
                    DiscoverMainView()
                        .tabItem {
                                
                            Label("Discover", systemImage: "magnifyingglass")
                                .font(.system(size: screenWidth / 15, weight: .semibold))
                                
                    }
                        
                    if (firestoreQuery.data.skill == 0) {
                        
                        SelfProfileView()
                            .tabItem {
                                    
                                Label("Profile", systemImage: "person.fill")
                                    .font(.system(size: screenWidth / 15, weight: .semibold))
                                    
                                    
                        }
                        
                    }
                    
                    else {
                        
                        SelfProfileViewVerified()
                            .tabItem {
                                
                                Label("Profile", systemImage: "person.fill")
                                    .font(.system(size: screenWidth / 15, weight: .semibold))
                                
                        }
                        
                    }
                    
                }
                
                else {
                    
                    LoadingView(screenHeight: screenHeight, screenWidth: screenWidth, isLoading: $isLoading)
                    
                }
                    
            }
            .accentColor(Color.black)
            .environmentObject(viewModel)
            .environmentObject(firestoreQuery)
            .environmentObject(storageService)
            .onAppear{ async { await NetworkingCall() } }
                
            
            
            ZStack {

                    CollectionReelView(screenWidth: screenWidth, screenHeight: screenHeight)
                        .offset(y: firestoreQuery.showNewScreen ? 0 : UIScreen.main.bounds.height)
                        
                        //if one of the reel screen and camera screen's are minimized, and both were previously minimized (minimized = false)
                        .animation(((!firestoreQuery.showNewScreen && firestoreQuery.showCameraScreen && !firestoreQuery.bothScreensMinimized) || (firestoreQuery.showNewScreen && !firestoreQuery.showCameraScreen && !firestoreQuery.bothScreensMinimized)) ? .linear(duration: 0) : .default)
                        
                        .edgesIgnoringSafeArea(.all)
                        .environmentObject(firestoreQuery)
                    
                    
                
//                    FullARView()
//                        .offset(y: firestoreQuery.showCameraScreen ? 0 : UIScreen.main.bounds.height)
//                        
//                        //if one of the reel screen and camera screen's are minimized, and both were previously minimized (minimized = false)
//                        .animation(((!firestoreQuery.showNewScreen && firestoreQuery.showCameraScreen && !firestoreQuery.bothScreensMinimized) || (firestoreQuery.showNewScreen && !firestoreQuery.showCameraScreen && !firestoreQuery.bothScreensMinimized)) ? .linear(duration: 0) : .default)
//              
//                        .edgesIgnoringSafeArea(.all)
//                        .environmentObject(modelsViewModel)
//                        .environmentObject(placementSettings)
//                        .environmentObject(modelDeletionManager)
//                        .environmentObject(firestoreQuery)

            }
            .zIndex(3.0)
                
        }
        
    }
    
    /*
    This method turns off the loadingView screen once basic data is recieved.
    */
    
    func NetworkingCall() async {
            
        UITabBar.appearance().isHidden = firestoreQuery.showNewScreen
//
//        let auth = Auth.auth()
//        try? auth.signOut()
//        loginModel.signedIn = false
//        loginModel.newUserCreated = false
        
        if(loginModel.newUserCreated || loginModel.signedIn){
            
            await firestoreQuery.fetchData()

            //firestoreQuery.getLibrary(library_ids: firestoreQuery.data.Library)
            //refresh collection list
            await firestoreQuery.getUserLibrary()

            await firestoreQuery.fetchArt()

            //await firestoreQuery.getHome()
            await firestoreQuery.getHomeMuseumList()

            //getMuseums. Gets all these Museums. List of Playlists
            await firestoreQuery.getHomeMuseums()

            //getPlaylists. Gets all the data for the playlists. Called once per museum.
            await firestoreQuery.getHomePlaylists()
    //
            await firestoreQuery.getDiscoverContent()
//            print("DONEEE")
            
                    //var db = Firestore.firestore()
//            let userDocRef = try db.collection("users").document(auth.currentUser!.uid)
//            do{
//                let libraryPlaylistNames = ["Collection1", "Donda", "Collection2"]
//                for i in 0...2 {
//                  let playlist = Playlist()
//                  playlist.name = libraryPlaylistNames[i]
//                  let playlistRef = try db.collection("playlists").document()
//                  try playlistRef.setData(from: playlist)
//                    try await userDocRef.updateData(["Library": FieldValue.arrayUnion([playlistRef.documentID])])
//
//                }
//            }
//            catch{
//
//            }
//
//            do{
//                let libraryArtNames = ["test23" , "test24", "test25", "test26"]
//                for i in 0...3{
//                  let art = Art()
//                  art.name = libraryArtNames[i]
//                  let artRef = try db.collection("art").document()
//                    art.artId = artRef.documentID
//                  try artRef.setData(from: art)
//
//                }
//            }
//            catch{
//
//            }

            doneLoading = true
        }
            
    }
    
}

struct TabBarPreview: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
